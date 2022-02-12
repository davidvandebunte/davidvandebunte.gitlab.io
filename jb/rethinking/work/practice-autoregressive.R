library(rethinking)

source('iplot.R')

ask.one.lag.variable <- r"(
**16H3.** The chapter asserts that a typical, geocentric time series model might be one that uses
lag variables. Here you’ll fit such a model and compare it to the ODE model in the chapter. An
autoregressive time series uses earlier values of the state variables to predict new values of the
same variables. These earlier values are called *lag variables*. You can construct the lag variables
here with:

R code 16.21
```
data(Lynx_Hare)
dat_ar1 <- list(
 L = Lynx_Hare$Lynx[2:21],
 L_lag1 = Lynx_Hare$Lynx[1:20],
 H = Lynx_Hare$Hare[2:21],
 H_lag1 = Lynx_Hare$Hare[1:20] )
```
<br/>

Now you can use `L_lag1` and `H_lag1` as predictors of the outcomes `L` and `H`. Like this:

$$
\begin{align}
L_t \sim LogNormal(log(\mu_{L,t}), \sigma_L) \\
\mu_{L,t} = \alpha_L + \beta_{LL}L_{t-1} + \beta_{LH}H_{t-1} \\
H_t \sim LogNormal(log(\mu_{H,t}), \sigma_H) \\
\mu_{H,t} = \alpha_H + \beta_{HH}H_{t-1} + \beta_{HL}L_{t-1}
\end{align}
$$

where $L_{t-1}$ and $H_{t–1}$ are the lag variables. Use `ulam()` to fit this model. Be careful of
the priors of the $\alpha$ and $\beta$ parameters. Compare the posterior predictions of the
autoregressive model to the ODE model in the chapter. How do the predictions differ? Can you explain
why, using the structures of the models?

**Answer.** First, let's review the data and reproduce some results from the text.
)"
display.lh.df <- function() {
  data(Lynx_Hare)
  display_markdown("The entirety of the `Lynx_Hare` data.frame:")
  display(Lynx_Hare)
  display_markdown("The model proposed by the author:")
  data(Lynx_Hare_model)
  cat(Lynx_Hare_model)
  flush.console()
}
plot.lh.posterior <- function(x, hare_pred, lynx_pred, Lynx_Hare, name) {
  pelts <- Lynx_Hare[, 2:3]
  iplot(function() {
    plot(1:21, pelts[, 2],
      main = name, pch = 16, ylim = c(0, 120), xlab = "year",
      ylab = "thousands of pelts", xaxt = "n"
    )
    at <- c(1, 11, 21)
    axis(1, at = at, labels = Lynx_Hare$Year[at])
    points(1:21, pelts[, 1], col = rangi2, pch = 16)
    # 21 time series from posterior
    for (s in 1:21) {
      lines(x, hare_pred[s,], col = col.alpha("black", 0.2), lwd = 2)
      lines(x, lynx_pred[s,], col = col.alpha(rangi2, 0.3), lwd = 2)
    }
    # text labels
    text(17, 90, "Lepus", pos = 2)
    text(19, 50, "Lynx", pos = 2, col = rangi2)
  })
}

reproduce.lh.model <- function() {
  data(Lynx_Hare)
  data(Lynx_Hare_model)
  dat_list <- list(
    N = nrow(Lynx_Hare),
    pelts = Lynx_Hare[, 2:3]
  )
  m16.5 <- stan(
    model_code = Lynx_Hare_model, data = dat_list,
    chains = 4, cores = 4,
    control = list(adapt_delta = 0.95)
  )
  post <- extract.samples(m16.5)
  hare_pred = post$pelts_pred[,,2]
  lynx_pred = post$pelts_pred[,,1]
  display_markdown("The posterior predictions from the text:")
  plot.lh.posterior(1:21, hare_pred, lynx_pred, Lynx_Hare, "m16.5")
}

english.compare.models <- r"(
Let's compare the mathematical form of the models side-by-side. The core of the ODE model:
$$
\begin{align}
H_1 & \sim LogNormal(log(10), 1) \\
L_1 & \sim LogNormal(log(10), 1) \\
H_{T>1} & = H_1 + \int\limits_1^T H_t (b_H - m_H L_t) dt \\
L_{T>1} & = L_1 + \int\limits_1^T L_t (b_L H_t - m_L) dt
\end{align}
$$

The AR model:
$$
\begin{align}
H_t \sim LogNormal(log(\mu_{H,t}), \sigma_H) \\
\mu_{H,t} = \alpha_H + \beta_{HH}H_{t-1} + \beta_{HL}L_{t-1} \\
L_t \sim LogNormal(log(\mu_{L,t}), \sigma_L) \\
\mu_{L,t} = \alpha_L + \beta_{LL}L_{t-1} + \beta_{LH}H_{t-1}
\end{align}
$$

The ODE model doesn't have an alpha parameter, which lets Hare and Lynx be created from nothing in
the AR model. In the ODE model, the Hare death rate is proportional to the product of the current
Hare and Lynx population; in the AR model it is proportional to only the Lynx population. Similarly,
Lynx birth rate is proportional to the product of the Hare and Lynx populations rather than only the
Lynx population. The ODE model seems to have better assumptions in all these cases.

Because the AR model must always be able to look back one step to make a prediction, one predictive
difference we can expect is that it will have one fewer prediction. That is, it will have no
prediction for the initial population other than what the data provides. Notice the AR model has no
prior for the initial population like the ODE model has.

Critically, the AR model assumes the present population is based on the observed populations from
one time step back, and no farther. The ODE model uses the full histories (looking forward and back)
to pick model parameters. The ODE model looks forward in the sense that it has parameters for the
initial population that will be indirectly updated based on future observations.

The AR models aren't designed in a way that we know in a strict sense which parameters should be
positive and negative. In the one-lag AR model, we would expect $\beta_{HH}$ to be positive because
hares give birth to more hares, and $\beta_{HL}$ to be negative because lynx eat hares. It gets
harder to make simple prior decisions like this with two lag variables because we can't strictly
interpret the $\beta$ parameters as birth and death rates.
)"
fit.one.lag.variable <- function() {
  data(Lynx_Hare)
  dat_ar1 <- list(
    L = Lynx_Hare$Lynx[2:21],
    L_lag1 = Lynx_Hare$Lynx[1:20],
    H = Lynx_Hare$Hare[2:21],
    H_lag1 = Lynx_Hare$Hare[1:20]
  )
  m.one.lag <- ulam(
    alist(
      H ~ lognormal(log(mu_H), sigma_H),
      mu_H <- alpha_H + beta_HH * H_lag1 + beta_HL * L_lag1,
      L ~ lognormal(log(mu_L), sigma_L),
      mu_L <- alpha_L + beta_LL * L_lag1 + beta_LH * H_lag1,
      sigma_H ~ dexp(0.5),
      sigma_L ~ dexp(0.5),
      alpha_H ~ dnorm(0, 1),
      alpha_L ~ dnorm(0, 1),
      beta_HH ~ dnorm(0.5, 1),
      beta_HL ~ dnorm(-0.5, 1),
      beta_LL ~ dnorm(0.5, 1),
      beta_LH ~ dnorm(0.5, 1)
    ), data = dat_ar1, cores = 4, chains = 4
  )
  display_markdown("Inferred parameters:")
  iplot(function() {
    plot(precis(m.one.lag), main="m.one.lag")
  }, ar=3)
  display_markdown(r"(Posterior predictions without influence of $\sigma$:)")
  post <- extract.samples(m.one.lag)
  mu_H <- mapply(function(H_l1, L_l1) {
    post$alpha_H + post$beta_HH * H_l1 + post$beta_HL * L_l1
  }, dat_ar1$H_lag1, dat_ar1$L_lag1)
  mu_L <- mapply(function(H_l1, L_l1) {
    post$alpha_L + post$beta_LL * L_l1 + post$beta_LH * H_l1
  }, dat_ar1$H_lag1, dat_ar1$L_lag1)
  plot.lh.posterior(2:21, mu_H, mu_L, Lynx_Hare, "m.one.lag")
}
english.predictions.differ <- r"(
We skip the influence of $\sigma$ in the previous plot to make it easier to interpret. The AR model
generally performs worse than the ODE model, in particular in areas with extreme transitions.
Because the AR model is looking at such a more local scale when it updates parameters, it seems to
dismiss these extreme cases as outliers in order to fit the majority of the data more closely. That
is, it can't see these cases as the result of a larger trend going back several steps.
)"
ask.answer.one.lag.variable <- function() {
  display_markdown(ask.one.lag.variable)
  display.lh.df()
  reproduce.lh.model()
  display_markdown(english.compare.models)
  fit.one.lag.variable()
  display_markdown(english.predictions.differ)
}
ask.answer.one.lag.variable()

ask.two.lag.variable <- r"(
**16H4.** Adapt the autoregressive model to use a two-step lag variable. This means that $L_{t–2}$ and
$H_{t–2}$, in addition to $L_{t–1}$ and $H_{t–1}$, will appear in the equation for $\mu$. This
implies that prediction depends upon not only what happened just before now, but also on what
happened two time steps ago. How does this model perform, compared to the ODE model?
)"
fit.two.lag.variable <- function() {
  data(Lynx_Hare)
  dat_ar2 <- list(
    L = Lynx_Hare$Lynx[3:21],
    L_lag1 = Lynx_Hare$Lynx[2:20],
    L_lag2 = Lynx_Hare$Lynx[1:19],
    H = Lynx_Hare$Hare[3:21],
    H_lag1 = Lynx_Hare$Hare[2:20],
    H_lag2 = Lynx_Hare$Hare[1:19]
  )
  m.two.lag <- ulam(
    alist(
      H ~ lognormal(log(mu_H), sigma_H),
      mu_H <- alpha_H + beta_HH1 * H_lag1 + beta_HL1 * L_lag1 + beta_HH2 * H_lag2 + beta_HL2 * L_lag2,
      L ~ lognormal(log(mu_L), sigma_L),
      mu_L <- alpha_L + beta_LL1 * L_lag1 + beta_LH1 * H_lag1 + beta_LL2 * L_lag2 + beta_LH2 * H_lag2,
      sigma_H ~ dexp(0.5),
      sigma_L ~ dexp(0.5),
      alpha_H ~ dnorm(0, 1),
      alpha_L ~ dnorm(0, 1),
      beta_HH1 ~ dnorm(0, 1),
      beta_HL1 ~ dnorm(0, 1),
      beta_LL1 ~ dnorm(0, 1),
      beta_LH1 ~ dnorm(0, 1),
      beta_HH2 ~ dnorm(0, 1),
      beta_HL2 ~ dnorm(0, 1),
      beta_LL2 ~ dnorm(0, 1),
      beta_LH2 ~ dnorm(0, 1)
    ), data = dat_ar2, cores = 4, chains = 4
  )
  display_markdown("Inferred parameters:")
  iplot(function() {
    plot(precis(m.two.lag), main="m.two.lag")
  }, ar=2.4)
  display_markdown(r"(Posterior predictions without influence of $\sigma$:)")
  post <- extract.samples(m.two.lag)
  mu_H <- mapply(function(H_l1, L_l1, H_l2, L_l2) {
    post$alpha_H + post$beta_HH1 * H_l1 + post$beta_HL1 * L_l1 + post$beta_HH2 * H_l2 + post$beta_HL2 * L_l2
  }, dat_ar2$H_lag1, dat_ar2$L_lag1, dat_ar2$H_lag2, dat_ar2$L_lag2)
  mu_L <- mapply(function(H_l1, L_l1, L_l2, H_l2) {
    post$alpha_L + post$beta_LL1 * L_l1 + post$beta_LH1 * H_l1 + post$beta_LL2 * L_l2 + post$beta_LH2 * H_l2
  }, dat_ar2$H_lag1, dat_ar2$L_lag1, dat_ar2$H_lag2, dat_ar2$L_lag2)
  plot.lh.posterior(3:21, mu_H, mu_L, Lynx_Hare, "m.two.lag")
}
two.lag.vs.ode <- r"(
The two-step lag model performs similarly the one-step lag model, with more uncertainty associated
with extra parameters that only give the model general flexibility, not the right kind of
flexibility for this problem.
)"
ask.answer.two.lag.variable <- function() {
  display_markdown(ask.two.lag.variable)
  display_markdown("**Answer.** We'll extend the previous question's model in a straightforward way.")
  fit.two.lag.variable()
  display_markdown(two.lag.vs.ode)
}
ask.answer.two.lag.variable()
