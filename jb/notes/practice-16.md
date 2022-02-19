---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.5
kernelspec:
  display_name: R
  language: R
  name: ir
---

# Practice: Chp. 16

```{code-cell} r
source("iplot.R")
suppressPackageStartupMessages(library(rethinking))
```

**16E1.** What are some disadvantages of generalized linear models (GLMs)?

**Answer.** Parameters are often not interpretable, and therefore it is difficult to set priors on
them.

When predictions disagree with observations, an understanding of the model provides a path to
improving it rather than simply tuning epicycles. That is, we have a path to do something about
errors.

**16E2.** Can you think of one or more famous scientific models which do not have the additive
structure of a GLM?

**Answer.** All of Maxwell's equations, which are based on differential equations.

**16E3.** Some models do not look like GLMs at first, but can be transformed through a logarithm
into an additive combination of terms. Do you know any scientific models like this?

**Answer.** Theories that are based on addition can be modeled directly in a GLM. Theories that are
based on multiplication would require a logarithm. Newton's law of universal gravitation is based on
the multiplication of two masses.

**16M1.** Modify the cylinder height model, `m16.1`, so that the exponent 3 on height is instead a
free parameter. Do you recover the value of 3 or not? Plot the posterior predictions for the new
model. How do they differ from those of `m16.1`?

**Answer.** First, let's reproduce results for `m16.1`:

```{code-cell} r
load.d16m1 <- function() {
  data(Howell1)
  d <- Howell1
  
  # scale observed variables
  d$w <- d$weight / mean(d$weight)
  d$h <- d$height / mean(d$height)
  return(d)
}
vcpp <- function(mc, d) {
  h_seq <- seq(from = 0, to = max(d$h), length.out = 30)
  w_sim <- sim(mc, data = list(h = h_seq))
  mu_mean <- apply(w_sim, 2, mean)
  w_CI <- apply(w_sim, 2, PI)
  iplot(function() {
    plot(d$h, d$w,
      xlim = c(0, max(d$h)), ylim = c(0, max(d$w)), col = rangi2,
      lwd = 2, xlab = "height (scaled)", ylab = "weight (scaled)"
    )
    lines(h_seq, mu_mean)
    shade(w_CI, h_seq)
  })
}
fm16m1 <- function(d) {
  m16.1 <- ulam(
    alist(
      w ~ dlnorm(mu, sigma),
      exp(mu) <- 3.141593 * k * p^2 * h^3,
      p ~ beta(2, 18),
      k ~ exponential(0.5),
      sigma ~ exponential(1)
    ),
    data = d, chains = 4, cores = 4
  )
  display_precis(m16.1, "m16.1", ar=4.0)
  vcpp(m16.1, d)
  return(m16.1)
}
d <- load.d16m1()
m16.1 <- fm16m1(d)
```

Fitting the new model with a parameterized exponent:

```{code-cell} r
fm3exp <- function(d) {
  m3exp <- ulam(
    alist(
      w ~ dlnorm(mu, sigma),
      exp(mu) <- 3.141593 * k * p^2 * h^he,
      p ~ beta(2, 18),
      k ~ exponential(0.5),
      he ~ dexp(0.5),
      sigma ~ exponential(1)
    ),
    data = d, chains = 4, cores = 4
  )
  display_precis(m3exp, "m3exp", ar=4.0)
  vcpp(m3exp, d)
  return(m3exp)
}
m3exp <- fm3exp(d)
```

The new model fits the data better in the range of children, at some cost to the fit in the range of
adults. In general it fits more closely; notice the change in the `sigma` estimate.

**16M2.** Conduct a prior predictive simulation for the cylinder height model. Begin with the priors
in the chapter. Do these produce reasonable prior height distributions? If not, which modifications
do you suggest?

**ERROR:**
> Do these produce reasonable prior height distributions?

We're predicting weight, so the author likely meant reasonable weight distributions.

```{code-cell} r
pp16m2 <- function(p_sim, k_sim) {
  h_seq <- seq(from=0, to=1.0, length.out=30)
  iplot(function() {
    plot(NULL, NULL,
      xlim = c(0, max(h_seq)), ylim = c(0, 1.0), col = rangi2,
      lwd = 2, xlab = "height (scaled)", ylab = "weight (scaled)", main="Cylinder Prior Predictive"
    )
    for (i in 1:length(p_sim)) {
      mu_median <- pi * k_sim[i] * p_sim[i]^2 * h_seq ^ 3
      d <- data.frame(h=h_seq, w=mu_median)
      lines(h_seq, mu_median)
    }
  })
}
s16m2 <- function() {
  set.seed(7)
  N <- 20
  p_sim <- rbeta(N, shape1=2, shape2=18)
  k_sim <- rexp(N, rate=0.5)
  pp16m2(p_sim, k_sim)
}
s16m2()
```

These priors do not produce a reasonable weight distribution; we rarely produce a sample that
touches the maximum weight.

Part of the reason for this is that the exponential distribution puts a lot of probability near
zero. This leads to many more curves on the lower end of the distribution than the upper end. To fix
this, use a LogNormal distribution instead.

Another part of the reason is that we were not careful selecting the `k` prior. Returning to the
equation we used to pick `k` in the text:

$$
1 = k \pi p^2 1^3
$$

Solving for `k` and assuming we set p to 0.1:

$$
k = \frac{1}{\pi p^2} = \frac{1}{\pi \cdot 0.1^2} \approx 31.8
$$

Set `k` to 32 and use a LogNormal prior to produce a better simulation:

```{code-cell} r
s16m2a <- function() {
  set.seed(7)
  N <- 20
  p_sim <- rbeta(N, shape1=2, shape2=18)
  k_sim <- rlnorm(N, meanlog=log(30), sdlog=0.1)
  pp16m2(p_sim, k_sim)
}
s16m2a()
```

**16M3.** Use prior predictive simulations to investigate the lynx-hare model. Begin with the priors
in the chapter. Which population dynamics do these produce? Can you suggest any improvements to the
priors, on the basis of your simulations?

**Answer.** Sampling only ten simulations from the priors:

```{code-cell} r
sim.pred.prey <- function(n_steps, init, theta, dt = 0.002) {
  # Euler method; exactly the same as `sim_lynx_hare` in the text.
  Pred <- rep(NA, n_steps)
  Prey <- rep(NA, n_steps)
  Pred[1] <- init[1]
  Prey[1] <- init[2]
  for (i in 2:n_steps) {
    Prey[i] <- Prey[i - 1] + dt * Prey[i - 1] * (theta[1] - theta[2] * Pred[i - 1])
    Pred[i] <- Pred[i - 1] + dt * Pred[i - 1] * (theta[3] * Prey[i - 1] - theta[4])
  }
  return(cbind(Pred, Prey))
}
pp16m3 <- function(theta) {
  iplot(function() {
    par(mar = c(4.0, 4.0, 0.2, 0.2))
    n_sim <- 1e4
    dt <- 0.001
    z <- sim.pred.prey(n_sim, c(10,10), as.numeric(theta), dt=dt)
    t <- dt*(1:n_sim)
    display(theta) 
    plot(t, z[, 2],
      type = "l", ylim = c(0, max(z[,])), lwd = 2,
      xlab = "year", ylab = "number (thousands)"
    )
    lines(t, z[, 1], col = rangi2, lwd = 2)
  }, ar=2)
}
s16m2a <- function() {
  set.seed(7)
  N <- 10
  bH_sim <- abs(rnorm(N, mean=1, sd=0.5))
  bL_sim <- abs(rnorm(N, mean=0.05, sd=0.05))
  mH_sim <- abs(rnorm(N, mean=0.05, sd=0.05))
  mL_sim <- abs(rnorm(N, mean=1, sd=0.5))
  for (i in 1:length(bH_sim)) {
    theta = list(bH=bH_sim[i], mH=mH_sim[i], bL=bL_sim[i], mL=mL_sim[i])
    pp16m3(theta)
  }
}
s16m2a()
```

Clearly, these priors produce extreme observations. In some cases populations vary from nearly zero
individuals to tens of millions. In any real ecosystem this would not happen; species would go
extinct if they hit an extreme population bottleneck.

A simple solution is to assume a species's birth and death rates are not several orders of magnitude
off from each other, and to reduce the magnitude of dispersion parameters (standard deviations).

```{code-cell} r
s16m2b <- function() {
  set.seed(7)
  N <- 10
  bH_sim <- abs(rnorm(N, mean=1, sd=0.2))
  bL_sim <- abs(rnorm(N, mean=0.05*bH_sim, sd=0.02*bH_sim))
  mH_sim <- abs(rnorm(N, mean=0.05*bH_sim, sd=0.02*bH_sim))
  mL_sim <- abs(rnorm(N, mean=bH_sim, sd=0.2*bH_sim))
  for (i in 1:length(bH_sim)) {
    theta = list(bH=bH_sim[i], mH=mH_sim[i], bL=bL_sim[i], mL=mL_sim[i])
    pp16m3(theta)
  }
}
s16m2b()
```

**16M4.** Modify the cylinder height model to use a sphere instead of a cylinder. What choices do
you have to make now? Is this a better model, on a predictive basis? Why or why not?

**Answer.** Fitting the previous model, for reference:

```{code-cell} r
d <- load.d16m1()
m16.1 <- fm16m1(d)
```

A spherical man (or cow) doesn't seem as helpful for selecting intelligent priors like `p`. On the
other hand, even the cyclinder model required us to pick a prior for `k` that was based on a fit to
maximums in the data rather than introducing more helpful independent information from our
experiences. When we select priors based on maximums we're only easing the fitting process rather
than potentially improving the model's inferences. Still, the process of scaling inputs based on
maximums improves our ability to interpret model internals like the priors, which we need to
interpret again as the posterior.

The explicitly stated model:

$$
W = kV = k \cdot \frac{4}{3} \pi r^3
$$

Using $h = 2r$:

$$
W = k \cdot \frac{\pi}{6} h^3
$$

We'll use a similar equation to the one in the text (based on maximums) to select the prior for `k`
in this scenario:

$$
1 = k \cdot \frac{\pi}{6} 1^3
$$

Solving for `k`:

$$
k = \frac{6}{\pi}
$$

Fitting the new model:

```{code-cell} r
fmsph <- function(d) {
  msph <- ulam(
    alist(
      w ~ dlnorm(mu, sigma),
      exp(mu) <- 3.141593 * k * h^3,
      k ~ exponential(3.141593 / 6),
      sigma ~ exponential(1)
    ),
    data = d, chains = 4, cores = 4
  )
  display_precis(msph, "msph", ar=4.0)
  vcpp(msph, d)
  return(msph)
}
msph <- fmsph(d)
```

We've replaced the `k` and `p` parameters, which were previously non-identifiable with respect to
one another, with a single parameter. With this change the number of effective samples has improved
dramatically, but the posterior predictions are essentially the same.

**16H1.** Modify the Panda nut opening model so that male and female chimpanzees have different
maximum adult body mass. The `sex` variable in `data(Panda_nuts)` provides the information you need.
Be sure to incorporate the fact that you know, prior to seeing the data, that males are on average
larger than females at maturity.

**Answer.** First, let's reproduce results from the chapter:

```{code-cell} r
load.panda.nut.data <- function() {
  data(Panda_nuts)
  Panda_nuts$sex_int <- as.integer(ifelse(Panda_nuts$sex == 'm', 2, 1))
  display_markdown("The `Panda_nuts` data.frame, with the new predictor as an additional column:")
  display(Panda_nuts)
  return(Panda_nuts)
}
fit.panda.nut.example <- function() {
  data(Panda_nuts)
  dat_list <- list(
    n = as.integer(Panda_nuts$nuts_opened),
    age = Panda_nuts$age / max(Panda_nuts$age),
    seconds = Panda_nuts$seconds
  )
  m16.4 <- ulam(
    alist(
      n ~ poisson(lambda),
      lambda <- seconds * phi * (1 - exp(-k * age))^theta,
      phi ~ lognormal(log(1), 0.1),
      k ~ lognormal(log(2), 0.25),
      theta ~ lognormal(log(5), 0.25)
    ),
    data = dat_list, chains = 4
  )
  display_precis(m16.4, "m16.4", ar=4.0)
}
fit.panda.nut.example()
d <- load.panda.nut.data()
```

[wiki_chimps]: https://en.wikipedia.org/w/index.php?title=Chimpanzee&oldid=1055948132

To include the sex predictor, let's reconsider the following equation from the text:

$$
\lambda = \alpha S_t^{\theta} = \alpha (\beta M_{max}(1 - exp(-k t)))^{\theta}
$$

We'd like to make $M_{max}$ depend on sex:

$$
\lambda = \alpha (\beta M_{max,sex}(1 - exp(-k t)))^{\theta}
$$

We can still scale the $M$ predictors, but with the new understanding that we are now scaling by the
maximum male body size rather than just a general maximum. We can then expect that $M_{max,male}$
to be one after scaling. We can treat $M_{max,female}$ as a parameter we expect to be less than one.
For our prior we can use information from [Chimpanzee][wiki_chimps]: a male chimp averages 55 kg at
maturity and a female chimp averages about 40 kg.

Merging several non-identifiable parameters similarly to the text, we have:

$$
\lambda = \phi_{sex} (1 - exp(-k t))^{\theta}
$$

We can use the same priors from the text, other than for $\phi_{sex}$. Because we continued to scale
the $M$ predictors, however, we can reuse the $\phi_{male}$ prior and effectively only add one new
parameter for the female sex:

$$
\begin{align}
\phi_{male} & \sim LogNormal \left( log(1), 0.1 \right) \\
\phi_{female} & \sim LogNormal \left( log(\frac{40}{55}), 0.1) \right)
\end{align}
$$

For simplicity, we'll set the same prior and learn the minor difference from the data:

```{code-cell} r
fit.panda.nut.example.with.sex.predictor <- function(d) {
  dat_list <- list(
    n = as.integer(d$nuts_opened),
    age = d$age / max(d$age),
    seconds = d$seconds,
    sex = d$sex_int
  )
  m.with.sex.predictor <- ulam(
    alist(
      n ~ poisson(lambda),
      lambda <- seconds * phi[sex] * (1 - exp(-k * age))^theta,
      phi[sex] ~ lognormal(log(1), 0.1),
      k ~ lognormal(log(2), 0.25),
      theta ~ lognormal(log(5), 0.25)
    ),
    data = dat_list, chains = 4
  )
  display_precis(m.with.sex.predictor, "m.with.sex.predictor", ar=4.0)
}
fit.panda.nut.example.with.sex.predictor(d)
```

The new model learns significantly different $\phi$ parameters.

**16H2.** Now return to the Panda nut model and try to incorporate individual differences. There are
two parameters, $\phi$ and $k$, which plausibly vary by individual. Pick one of these, allow it to
vary by individual, and use partial pooling to avoid overfitting. The variable `chimpanzee` in
`data(Panda_nuts)` tells you which observations belong to which individuals.

**Answer.** Pick the $\phi$ parameter to vary by individual:

```{code-cell} r
fit.panda.nut.example.with.individual.differences <- function() {
  data(Panda_nuts)
  dat_list <- list(
    n = as.integer(Panda_nuts$nuts_opened),
    age = Panda_nuts$age / max(Panda_nuts$age),
    chimp = Panda_nuts$chimpanzee,
    seconds = Panda_nuts$seconds
  )
  m.with.individual.phi <- ulam(
    alist(
      n ~ poisson(lambda),
      lambda <- seconds * phi[chimp] * (1 - exp(-k * age))^theta,
      phi[chimp] ~ lognormal(log(phi_bar), 0.1),
      phi_bar ~ lognormal(log(1), 0.1),
      k ~ lognormal(log(2), 0.25),
      theta ~ lognormal(log(5), 0.25)
    ),
    data = dat_list, chains = 4
  )
  display_precis(m.with.individual.phi, "m.with.individual.phi", ar=1.5)
}
fit.panda.nut.example.with.individual.differences()
```

There's a lot of individual variation; the 9th chimpanzee is a standout even with regularization.

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

```{code-cell} r
display.lh.df <- function() {
  data(Lynx_Hare)
  display_markdown("The entirety of the `Lynx_Hare` data.frame:")
  display(Lynx_Hare)
  display_markdown("The model proposed by the author:")
  data(Lynx_Hare_model)
  cat(Lynx_Hare_model)
  flush.console()
}
display.lh.df()
```

```{code-cell} r
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
reproduce.lh.model()
```

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

```{code-cell} r
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
fit.one.lag.variable()
```

We skip the influence of $\sigma$ in the previous plot to make it easier to interpret. The AR model
generally performs worse than the ODE model, in particular in areas with extreme transitions.
Because the AR model is looking at such a more local scale when it updates parameters, it seems to
dismiss these extreme cases as outliers in order to fit the majority of the data more closely. That
is, it can't see these cases as the result of a larger trend going back several steps.

**16H4.** Adapt the autoregressive model to use a two-step lag variable. This means that $L_{t–2}$ and
$H_{t–2}$, in addition to $L_{t–1}$ and $H_{t–1}$, will appear in the equation for $\mu$. This
implies that prediction depends upon not only what happened just before now, but also on what
happened two time steps ago. How does this model perform, compared to the ODE model?

**Answer.** We'll extend the previous question's model in a straightforward way.

```{code-cell} r
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
fit.two.lag.variable()
```

The two-step lag model performs similarly the one-step lag model, with more uncertainty associated
with extra parameters that only give the model general flexibility, not the right kind of
flexibility for this problem.

**16H5.** Population dynamic models are typically very difficult to fit to empirical data. The
lynx-hare example in the chapter was easy, partly because the data are unusually simple and partly
because the chapter did the difficult prior selection for you. Here’s another data set that will
impress upon you both how hard the task can be and how badly Lotka-Volterra fits empirical data in
general. The data in `data(Mites)` are numbers of predator and prey mites living on fruit. Model
these data using the same Lotka-Volterra ODE system from the chapter. These data are actual counts
of individuals, not just their pelts. You will need to adapt the Stan code in
`data(Lynx_Hare_model)`. Note that the priors will need to be rescaled, because the outcome
variables are on a different scale. Prior predictive simulation will help. Keep in mind as well that
the time variable and the birth and death parameters go together. If you rescale the time dimension,
that implies you must also rescale the parameters.

**Answer.** Let's start by inspecting the data.

```{code-cell} r
load.mites <- function() {
  data(Mites)
  display_markdown("The `Mites` data:")
  display(Mites)
  return(Mites)
}
d <- load.mites()
```

```{code-cell} r
mites.simple.model <- r"(
Notice the observations are usually 6-7 days apart. For modeling simplicity, we'll assume the
observations are evenly spaced. The raw data with this simpler x-axis is:
)"
plot.mites <- function(d) {
  display_markdown("<br/> The `Mites` data on a plot:")
  iplot(function() {
    plot(d$day, d$prey,
      main = "Mites", pch = 16,
      xlim = c(0, max(d$day)*1.05),
      ylim = c(0, max(d$prey)*1.05),
      xlab = "day", ylab = "population"
    )
    points(d$day, d$predator, col = rangi2, pch = 16)
  })
  display_markdown(mites.simple.model)
  iplot(function() {
    N = length(d$day)
    plot(1:N, d$prey,
      main = "Mites", pch = 16,
      ylim = c(0, max(d$prey)*1.05),
      xlab = "observation", ylab = "population"
    )
    points(1:N, d$predator, col = rangi2, pch = 16)
  })
}
plot.mites(d)
```

The cyclical trend is less clear than in the Lynx-Hare data (compare to Figure 16.6).

```{code-cell} r
plot.mite.prior <- function(init, theta) {
  iplot(function() {
    par(mar = c(4.0, 4.0, 0.2, 0.2))
    n_sim <- 3.5e4
    dt <- 0.001
    z <- sim.pred.prey(n_sim, as.numeric(init), as.numeric(theta), dt=dt)
    t <- dt*(1:n_sim)
    display(init) 
    display(theta) 
    plot(t, z[, 2],
      type = "l", ylim = c(0, max(z[,])), lwd = 2,
      xlab="observation", ylab="population"
    )
    lines(t, z[, 1], col = rangi2, lwd = 2)
  }, ar=2)
}
```

Let's select Mites priors starting from the Lynx-Hare model priors:

```{code-cell} r
theta <- list(bPrey=1, mPrey=0.05, bPred=0.05, mPred=1)
init <- list(initPred=10, initPrey=10)
plot.mite.prior(init, theta)
init <- list(initPred=100, initPrey=100)
display_markdown("Scaling initial values:")
plot.mite.prior(init, theta)
```

The two populations are starting to hit extreme values, unacceptable in a population model. To fix
this, let's reduce the two parameters associated with the coupling between the populations,
$m_{Prey}$ and $b_{Pred}$. If we were to decrease these parameters to zero we would completely
decouple the populations; we'll pick something less extreme:

```{code-cell} r
theta <- list(bPrey=1, mPrey=0.02, bPred=0.02, mPred=1)
plot.mite.prior(init, theta)
```

We've recovered more normal cycles, but the prediction scale is still low. Let's increase birth
rates to further increase the implied predictions:

```{code-cell} r
theta <- list(bPrey=5, mPrey=0.02, bPred=0.02, mPred=5)
plot.mite.prior(init, theta)
```

[nr]: https://en.wikipedia.org/wiki/Nyquist_rate
[lve]: https://en.wikipedia.org/w/index.php?title=Lotka%E2%80%93Volterra_equations&oldid=1057972095

At this point we're getting predictions on about the right output scale but this prior assumes mite
populations change too quickly. If you look at the raw data you'll see what looks like at most 5-6
cycles over the course of the 35 observations; if there were many more cycles we'd fail to capture
them with data at this frequency anyways (see [Nyquist rate][nr]).

To decrease the rate at which the populations change, let's inspect the original differential
equations. Using the variable names on [Lotka-Volterra equations][lve], we want to decrease both
$dx/dt$ and $dy/dt$. These rates are direct functions of all four parameters; to decrease them we
can decrease our four main parameters:

```{code-cell} r
theta <- list(bPrey=0.5, mPrey=0.002, bPred=0.002, mPred=0.5)
plot.mite.prior(init, theta)
```

```{code-cell} r
english.select.mites.prior.uncertainties <- r"(
<br/>
We've selected reasonable location parameters for our priors. Selecting the scale parameters is less
difficult; we'll skip those details and confirm that the combination of our scale and location
parameters (with a reasonable initial value prior) produces reasonable overall results. The next
five plots sample from the fully-specified prior:
)"

sim.mites.priors <- function() {
  display_markdown(english.select.mites.prior.uncertainties)
  set.seed(7)
  N <- 5
  iPred_sim <- rlnorm(N, meanlog=log(150), sdlog=1)
  iPrey_sim <- rlnorm(N, meanlog=log(150), sdlog=1)
  bPrey_sim <- abs(rnorm(N, mean=0.5, sd=0.2))
  mPrey_sim <- abs(rnorm(N, mean=0.002, sd=0.002))
  bPred_sim <- abs(rnorm(N, mean=0.002, sd=0.002))
  mPred_sim <- abs(rnorm(N, mean=0.5, sd=0.2))
  for (i in 1:length(bPrey_sim)) {
    init <- list(initPred=iPred_sim[i], initPrey=iPrey_sim[i])
    theta <- list(bPrey=bPrey_sim[i], mPrey=mPrey_sim[i], bPred=bPred_sim[i], mPred=mPred_sim[i])
    plot.mite.prior(init, theta)
  }
}
sim.mites.priors()
```

```{code-cell} r
english.plot.mites.together <- r"(
<br/>
If we plot many posterior predictions (pairs of predator/prey traces) on a single plot as in the
text, it can be hard to identify which belong together:
)"
plot.combined.mites.posteriors <- function(d, prey_pred, pred_pred) {
  iplot(function() {
    N = length(d$day)
    plot(1:N, d$prey,
      main = "Combined Mites Posterior Predictions", pch = 16,
      ylim = c(0, max(d$prey)*1.05),
      xlab = "observation", ylab = "population"
    )
    points(1:N, d$predator, col = rangi2, pch = 16)
    for (s in 1:20) {
      lines(1:N, prey_pred[s,], col = col.alpha("black", 0.2), lwd = 2)
      lines(1:N, pred_pred[s,], col = col.alpha(rangi2, 0.3), lwd = 2)
    }
  })
}
english.plot.mites.separate <- r"(
<br/>
Let's take five snapshots of individual pairs instead:
)"
plot.separate.mites.posteriors <- function(d, prey_pred, pred_pred) {
  N = length(d$day)
  for (s in 1:5) {
    iplot(function() {
      plot(1:N, d$prey,
        main = paste("Mites Posterior Predictions #", s, sep=""), pch = 16,
        ylim = c(0, max(d$prey)*1.05),
        xlab = "observation", ylab = "population"
      )
      points(1:N, d$predator, col = rangi2, pch = 16)
      lines(1:N, prey_pred[s,], col = col.alpha("black", 0.2), lwd = 2)
      lines(1:N, pred_pred[s,], col = col.alpha(rangi2, 0.3), lwd = 2)
    })
  }
}
fit.mites.model <- function(d) {
  dat_list <- list(
    N = nrow(d),
    pelts = d[, 3:2]
  )
  m.mites <- stan(
    file = "mites.stan", data = dat_list,
    chains = 4, cores = 4, seed = 14,
    control = list(adapt_delta = 0.95)
  )
  display_markdown("A `pairs` plot: ")
  iplot(function() {
    pairs(m.mites, pars=c("theta", "pop_init", "sigma"))
  })
  flush.console()
  post <- extract.samples(m.mites)
  prey_pred = post$pop_pred[,,2]
  pred_pred = post$pop_pred[,,1]
  display_markdown(english.plot.mites.together)
  plot.combined.mites.posteriors(d, prey_pred, pred_pred)
  display_markdown(english.plot.mites.separate)
  plot.separate.mites.posteriors(d, prey_pred, pred_pred)
}
fit.mites.model(d)
```

As expected, the Lotka-Volterra model doesn't fit nearly as well to this data as it did to the
Lynx-Hare data.
