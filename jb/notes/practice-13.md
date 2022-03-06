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

# Practice: Chp. 13

```{code-cell} r
source("iplot.R")
suppressPackageStartupMessages(library(rethinking))
```

**13E1.** Which of the following priors will produce more *shrinkage* in the estimates?

(a) $\alpha_{tank} \sim Normal(0,1)$

(b) $\alpha_{tank} \sim Normal(0,2)$

**Answer.** We could interpret this question in two ways. The first is that the author meant to
write:

(a) $\bar{\alpha} \sim Normal(0,1)$

(b) $\bar{\alpha} \sim Normal(0,2)$

That is, interpretion #1 is that these are priors for the hyperparameter for the average of all
tanks, with no new prior specified for the hyperparameter for the variability among tanks $\sigma$.

The second interpretation is that the author is trying to express in shorthand new priors for both
the $\bar{\alpha}$ and $\sigma$ priors, and only the expected value of these two priors, ignoring
a standard deviation. To use the same terms as the chapter:

(a) $\alpha_{tank} \sim Normal(\bar{\alpha},\sigma),
     \bar{\alpha} \sim Normal(0,?),
     \sigma \sim Exponential(1)$

(b) $\alpha_{tank} \sim Normal(\bar{\alpha},\sigma),
     \bar{\alpha} \sim Normal(0,?),
     \sigma \sim Exponential(\frac{1}{2})$

Notice we decrease the $\lambda$ parameter to the exponential distribution to increase the expected
value.

Said another way, the first interpretation is that the author meant to specify this prior at the
second level of the model, and the second interpretation is that the author meant to specify this
prior at the first level. The first interpretation makes sense given this prior shows up directly in
models in the chapter already, without much reinterpretation. The second interpretation is supported
by the author's choice of variable name (e.g. see the chapter and question **13M3**). See also
question **13M5**.

In both interpretations, prior (a) will produce more shrinkage because it is more regularizing. It
has a smaller standard deviation and therefore expects less variability.

**13E2.** Rewrite the following model as a multilevel model.

$$
\begin{align}
y_i & \sim Binomial(1,p_i) \\
logit(p_i) & = \alpha_{group[i]} + \beta x_i \\
\alpha_{group} & \sim Normal(0, 1.5) \\
\beta & \sim Normal(0, 0.5)
\end{align}
$$

**Answer.** The focus of this chapter is on varying intercepts rather than varying effects (see the next
chapter), so we'll only convert the intercept:

$$
\begin{align}
y_i & \sim Binomial(1,p_i) \\
logit(p_i) & = \alpha_{group[i]} + \beta x_i \\
\alpha_{group} & \sim Normal(\bar{\alpha}, \sigma) \\
\bar{\alpha} & \sim Normal(0, 1.5) \\
\sigma & \sim Exponential(1) \\
\beta & \sim Normal(0, 0.5)
\end{align}
$$

**13E3.** Rewrite the following model as a multilevel model.

$$
\begin{align}
y_i & \sim Normal(\mu_i,\sigma) \\
\mu_i & = \alpha_{group[i]} + \beta x_i \\
\alpha_{group} & \sim Normal(0, 5) \\
\beta & \sim Normal(0, 1) \\
\sigma & \sim Exponential(1)
\end{align}
$$

**Answer.** As in the last question, we'll only convert the intercept:

$$
\begin{align}
y_i & \sim Normal(\mu_i,\sigma_1) \\
\mu_i & = \alpha_{group[i]} + \beta x_i \\
\alpha_{group} & \sim Normal(\bar{\alpha}, \sigma_2) \\
\bar{\alpha} & \sim Normal(0, 5) \\
\sigma_2 & \sim Exponential\left(\frac{1}{2}\right) \\
\beta & \sim Normal(0, 1) \\
\sigma_1 & \sim Exponential(1)
\end{align}
$$

**13E4.** Write a mathematical model formula for a Poisson regression with varying intercepts.

$$
\begin{align}
y_i & \sim Poisson(\lambda) \\
log(\lambda) & = \alpha_{group[i]} \\
\alpha_{group} & \sim Normal(\bar{\alpha}, \sigma) \\
\bar{\alpha} & \sim Normal(0, 5) \\
\sigma & \sim Exponential(1)
\end{align}
$$

**13E5.** Write a mathematical model formula for a Poisson regression with two different kinds of
varying intercepts, a cross-classified model.

$$
\begin{align}
y_i & \sim Poisson(\lambda) \\
log(\lambda) & = \alpha_{x[i]} + \alpha_{y[i]} \\
\alpha_{x} & \sim Normal(\mu_x, \sigma_x) \\
\mu_x & \sim Normal(0, 5) \\
\sigma_x & \sim Exponential(1) \\
\alpha_{y} & \sim Normal(0, \sigma_y) \\
\sigma_y & \sim Exponential(1)
\end{align}
$$

**13M1.** Revisit the Reed frog survival data, `data(reedfrogs)`, and add the `predation` and `size`
treatment variables to the varying intercept model. Consider models with either main effect alone,
both main effects, as well as a model including both and their interaction. Instead of focusing on
inferences about these two predictor variables, focus on the inferred variation across tanks.
Explain why it changes as it does across models.

**ERROR.** The `predation` predictor is actually labeled `pred`.

**ERROR.** The author duplicated this question in **13H4**, without realizing he had moved it and
primarily only changed wording.

Compare the second sentences:

> Consider models with either main effect alone, both main effects, as well as a model including both
> and their interaction.

> Consider models with either predictor alone, both predictors, as well as a model including their
> interaction.

One sentence only exists in **13H4**:

> What do you infer about the causal inference of these predictor variables?

Compare the last two sentences:

> Instead of focusing on inferences about these two predictor variables, focus on the inferred
> variation across tanks. Explain why it changes as it does across models.

> Also focus on the inferred variation across tanks (the $\sigma$ across tanks). Explain why it
> changes as it does across models with different predictors included.

We could treat **13H4** as a separate question that expands on **13M1** by adding causal inference,
but this answer will combine the two.

**Answer.** First, let's reproduce results from model `m13.2` in the chapter:

```{code-cell} r
data(reedfrogs)
rf_df <- reedfrogs
rf_df$tank <- 1:nrow(rf_df)

rf_dat <- list(
  S = rf_df$surv,
  N = rf_df$density,
  tank = rf_df$tank
)

## R code 13.3
m13.2 <- ulam(
  alist(
    S ~ dbinom(N, p),
    logit(p) <- a[tank],
    a[tank] ~ dnorm(a_bar, sigma),
    a_bar ~ dnorm(0, 1.5),
    sigma ~ dexp(1)
  ),
  data = rf_dat, chains = 4, cores = 4, log_lik = TRUE
)

iplot(function() {
  plot(precis(m13.2, depth=2), main='m13.2')
}, ar=1.0)
```

Raw data (preceding plot):

```{code-cell} r
display(precis(m13.2, depth = 2), mimetypes="text/plain")

rf_df$Predator <- as.integer(as.factor(rf_df$pred))
rf_df$Size <- as.integer(as.factor(rf_df$size))
rf_df$Treatment <- 1 + ifelse(rf_df$Predator == 1, 0, 1) + 2*ifelse(rf_df$Size == 1, 0, 1)
```

The `reedfrogs` data.frame is small enough to show in its entirety. Notice several new preprocessed
variables (columns) this solution will introduce later as they are used in models:

```{code-cell} r
display(rf_df)
```

The `help` is also short:

```{code-cell} r
display(help(reedfrogs))
```

Our first model will add the `pred` predictor on only the first level:

$$
\begin{align}
S_i & \sim Binomial(N_i,p_i) \\
logit(p_i) & = \alpha_{tank[i]} + \beta_{pred[i]} \\
\alpha_j & \sim Normal(\bar{\alpha}, \sigma), j = 1..48 \\
\bar{\alpha} & \sim Normal(0, 1.5) \\
\sigma & \sim Exponential(1) \\
\beta_j & \sim Normal(0, 1.5), j = 1..2
\end{align}
$$

Seeing as this is a chapter on multilevel models, and it's generally advisable to consider a
multilevel model when we have exchangeable index variables, should we add a second level of
parameters for this predictor? In other words:

$$
\begin{align}
S_i & \sim Binomial(N_i,p_i) \\
logit(p_i) & = \alpha_{tank[i]} + \beta_{pred[i]} \\
\alpha_j & \sim Normal(\bar{\alpha}, \sigma_{\alpha}), j = 1..48 \\
\bar{\alpha} & \sim Normal(0, 1.5) \\
\sigma_{\alpha} & \sim Exponential(1) \\
\beta_j & \sim Normal(0, \sigma_{\beta}), j = 1..2 \\
\sigma_{\beta} & \sim Exponential(1)
\end{align}
$$

The problem with this model is that there are only 2 (rather than 48) clusters for us to learn from,
that is, we are adding one second-level parameter to go with only two first-level parameters. Said
another way, do our clusters have anything to learn from each other? It may help to not forget about
the last tank of tadpoles when learning about a new one, or the last chimp when learning about a new
one, but in this case there is only one other pool to learn from: either all predator pools, or all
non-predator pools.

We could try to remember what we learned about one predator pool when moving to another predator
pool. In this approach, we would learn one $\bar{\alpha}$ and one $\sigma$ for the predator pools,
and one $\bar{\alpha}$ and one $\sigma$ for the non-predator pools. Presumably this would require
reindexing predator and non-predator pools from 1..24. The original model from the chapter already
has an intercept for individual pools this approach would likely not differ significantly from, so
we will avoid these complications and only add `pred` on the first level.

Now let's fit our new model, with a `pred` predictor on the first level. This model struggles to fit
as provided above. To avoid Stan warnings about RHat, Bulk ESS, and Tail ESS, we're actually going
to fit a model with a different $\bar{\alpha}$ prior than the one proposed above:

$$
\begin{align}
S_i & \sim Binomial(N_i,p_i) \\
logit(p_i) & = \alpha_{tank[i]} + \beta_{pred[i]} \\
\alpha_j & \sim Normal(\bar{\alpha}, \sigma), j = 1..48 \\
\bar{\alpha} & \sim Normal(0, 0.1) \\
\sigma & \sim Exponential(1) \\
\beta_j & \sim Normal(0, 1.5), j = 1..2
\end{align}
$$

See more comments on this tight $\bar{\alpha}$ prior below.

```{code-cell} r
rf_dat <- list(
  S = rf_df$surv,
  N = rf_df$density,
  tank = rf_df$tank,
  Predator = rf_df$Predator
)

m_rf_pred_orig <- ulam(
  alist(
    S ~ dbinom(N, p),
    logit(p) <- a[tank] + bPredator[Predator],
    a[tank] ~ dnorm(a_bar, sigma),
    a_bar ~ dnorm(0, 0.1),
    sigma ~ dexp(1),
    bPredator[Predator] ~ dnorm(0, 1.5)
  ),
  data = rf_dat, chains = 4, cores = 4, log_lik = TRUE, iter=2000
)

iplot(function() {
  plot(precis(m_rf_pred_orig, depth=2), main='m_rf_pred_orig')
}, ar=1.0)
```

Raw data (preceding plot):

```{code-cell} r
display(precis(m_rf_pred_orig, depth = 2), mimetypes="text/plain")
```

As explained above, this model struggles to sample. We've managed to avoid the warnings and achieve
decent mixing by tightening a prior:

```{code-cell} r
iplot(function() {
  traceplot(m_rf_pred_orig, pars=c("a[41]", "a[30]", "a_bar", "sigma", "bPredator[1]", "bPredator[2]"))
}, ar=2)
iplot(function() {
  trankplot(m_rf_pred_orig, pars=c("a[41]", "a[30]", "a_bar", "sigma", "bPredator[1]", "bPredator[2]"))
}, ar=2)
```

Why are we struggling to sample? To debug this, let's go back to the chapter on debugging MCMC, in
particular section **9.5.4.** on non-identifiable parameters. If non-identifiable parameters are a
cause of this symptom, what could we check for? Going even further back, to the end of section
**6.1**, the author suggests checking whether the posterior has changed relative to the prior. This
is a good question to ask regularly; which parameters are unchanged relative to their prior? The
obvious parameter is $\bar{\alpha}$, which we already had to tweak. Let's change the $\bar{\alpha}$
prior again and see if it remains unchanged in the posterior:

$$
\begin{align}
S_i & \sim Binomial(N_i,p_i) \\
logit(p_i) & = \alpha_{tank[i]} + \beta_{pred[i]} \\
\alpha_j & \sim Normal(\bar{\alpha}, \sigma), j = 1..48 \\
\bar{\alpha} & \sim Normal(1.0, 0.1) \\
\sigma & \sim Exponential(1) \\
\beta_j & \sim Normal(0, 1.5), j = 1..2
\end{align}
$$

```{code-cell} r
m_rf_pred_shift <- ulam(
  alist(
    S ~ dbinom(N, p),
    logit(p) <- a[tank] + bPredator[Predator],
    a[tank] ~ dnorm(a_bar, sigma),
    a_bar ~ dnorm(1.0, 0.1),
    sigma ~ dexp(1),
    bPredator[Predator] ~ dnorm(0, 1.5)
  ),
  data = rf_dat, chains = 4, cores = 4, log_lik = TRUE, iter=2000
)

iplot(function() {
  plot(precis(m_rf_pred_shift, depth=2), main='m_rf_pred_shift')
}, ar=1.0)
display_markdown("Raw data (preceding plot):")
display(precis(m_rf_pred_shift, depth = 2), mimetypes="text/plain")
```

The $\bar{\alpha}$ prior remains unchanged even after being shifted. Notice that the predator
parameters are the ones that have responded (and unsuprisingly, all the `a` parameters). Previously
the model had inferred a 'lack of predator' drastically helps survival and a predator has no effect
on survival (treating a predator as the baseline). Now it has inferred a predator hurts chances of
survival, and the lack of a predator doesn't help as much. That is, all these parameters only make
sense relative to each other.

To avoid this mess we could use an indicator variable:

$$
\begin{align}
S_i & \sim Binomial(N_i,p_i) \\
logit(p_i) & = \alpha_{tank[i]} + \beta P_i \\
\alpha_j & \sim Normal(\bar{\alpha}, \sigma), j = 1..48 \\
\bar{\alpha} & \sim Normal(0, 2) \\
\sigma & \sim Exponential(1) \\
\beta & \sim Normal(0, 1.5)
\end{align}
$$

```{code-cell} r
rf_dat <- list(
  S = rf_df$surv,
  N = rf_df$density,
  tank = rf_df$tank,
  Predator = ifelse(rf_df$Predator == 1, 0, 1)
)
m_rf_pred_indicator <- ulam(
  alist(
    S ~ dbinom(N, p),
    logit(p) <- a[tank] + bPredator * Predator,
    a[tank] ~ dnorm(a_bar, sigma),
    a_bar ~ dnorm(0, 2),
    sigma ~ dexp(1),
    bPredator ~ dnorm(0, 3)
  ),
  data = rf_dat, chains = 4, cores = 4, log_lik = TRUE, iter=4000
)

iplot(function() {
  plot(precis(m_rf_pred_indicator, depth=2), main='m_rf_pred_indicator')
}, ar=1.0)
display_markdown("Raw data (preceding plot):")
display(precis(m_rf_pred_indicator, depth = 2), mimetypes="text/plain")
```

Notice in the last model we've been able to widen the $\bar{\alpha}$ prior and actually learn it
from the data, that is, the prior changes in the posterior.

Still, an indicator variable isn't ideal for at least one of the reasons given in section
**5.3.1.**: We aren't more uncertain about the predator than the non-predator situation. The
indicator variable approach also makes it harder to read the `a` parameters relative to `a_bar`
since they aren't centered at zero, and makes it harder to set an `a_bar` prior.

Instead let's simply fix the `a_bar` prior's expected value to zero as suggested in section
**13.3.1**:

$$
\begin{align}
S_i & \sim Binomial(N_i,p_i) \\
logit(p_i) & = \alpha_{tank[i]} + \beta_{pred[i]} \\
\alpha_j & \sim Normal(0, \sigma), j = 1..48 \\
\sigma & \sim Exponential(1) \\
\beta_j & \sim Normal(0, 1.5), j = 1..2
\end{align}
$$

```{code-cell} r
rf_dat <- list(
  S = rf_df$surv,
  N = rf_df$density,
  tank = rf_df$tank,
  Predator = rf_df$Predator
)
m_rf_df_pred <- ulam(
  alist(
    S ~ dbinom(N, p),
    logit(p) <- a[tank] + bPredator[Predator],
    a[tank] ~ dnorm(0, sigma),
    sigma ~ dexp(1),
    bPredator[Predator] ~ dnorm(0, 1.5)
  ),
  data = rf_dat, chains = 4, cores = 4, log_lik = TRUE, iter=2000
)

iplot(function() {
  plot(precis(m_rf_df_pred, depth=2), main='m_rf_df_pred')
}, ar=1.0)
display_markdown("Raw data (preceding plot):")
display(precis(m_rf_df_pred, depth = 2), mimetypes="text/plain")
```

Let's fit a similar model with only the `size` predictor:

$$
\begin{align}
S_i & \sim Binomial(N_i,p_i) \\
logit(p_i) & = \alpha_{tank[i]} + \beta_{size[i]} \\
\alpha_j & \sim Normal(0, \sigma), j = 1..48 \\
\sigma & \sim Exponential(1) \\
\beta_j & \sim Normal(0, 1.5), j = 1..2
\end{align}
$$

```{code-cell} r
rf_dat <- list(
  S = rf_df$surv,
  N = rf_df$density,
  tank = rf_df$tank,
  Size = rf_df$Size
)
m_rf_df_size <- ulam(
  alist(
    S ~ dbinom(N, p),
    logit(p) <- a[tank] + bSize[Size],
    a[tank] ~ dnorm(0, sigma),
    sigma ~ dexp(1),
    bSize[Size] ~ dnorm(0, 1.5)
  ),
  data = rf_dat, chains = 4, cores = 4, log_lik = TRUE, iter=2000
)

iplot(function() {
  plot(precis(m_rf_df_size, depth=2), main='m_rf_df_size')
}, ar=1.0)
display_markdown("Raw data (preceding plot):")
display(precis(m_rf_df_size, depth = 2), mimetypes="text/plain")
```

Finally, lets model an interaction term. We've already added a 'treatment' index variable in
preprocessing; see the data.frame near the start of this question.

$$
\begin{align}
S_i & \sim Binomial(N_i,p_i) \\
logit(p_i) & = \alpha_{tank[i]} + \beta_{Treatment[i]} \\
\alpha_j & \sim Normal(0, \sigma), j = 1..48 \\
\sigma & \sim Exponential(1) \\
\beta_j & \sim Normal(0, 1.5), j = 1..4
\end{align}
$$

```{code-cell} r
rf_dat <- list(
  S = rf_df$surv,
  N = rf_df$density,
  tank = rf_df$tank,
  Treatment = rf_df$Treatment
)
m_rf_df_interaction <- ulam(
  alist(
    S ~ dbinom(N, p),
    logit(p) <- a[tank] + bTreatment[Treatment],
    a[tank] ~ dnorm(0, sigma),
    sigma ~ dexp(1),
    bTreatment[Treatment] ~ dnorm(0, 1.5)
  ),
  data = rf_dat, chains = 4, cores = 4, log_lik = TRUE, iter=2000
)

iplot(function() {
  plot(precis(m_rf_df_interaction, depth=2), main='m_rf_df_interaction')
}, ar=1.0)
display_markdown("Raw data (preceding plot):")
display(precis(m_rf_df_interaction, depth = 2), mimetypes="text/plain")
```

Let's go back to the original question:

> Instead of focusing on inferences about these two predictor variables, focus on the inferred
> variation across tanks. Explain why it changes as it does across models.

The inferred variation across tanks ($\sigma$) decreases in these models as we add more predictors.
We see the largest $\sigma$ in `m13.2` where we haven't tried to explain variation with any
predictors. When we add the predator predictor in `m_rf_df_pred` we see `sigma` drop significantly
because there is a lot of predictive power in that variable (or at least more than `size`). The
model with an interaction term has the lowest inference for `sigma` because it indirectly has access
to all the predictors.

One question only exists in **13H4**:

> What do you infer about the causal inference of these predictor variables?

In the typical predator-prey relationship it's more appropriate to use differential equations to
model the relationship between the populations. Reading the original paper, though, it appears that
the presence of predators, tadpole sizes, and initial density were manipulated. If that is the case
then the causal diagram would be relatively simple: the predictors can only affect the outcome, not
each other.

It's tempting to read from the difference between `bTreatment[1]` and `bTreatment[3]` relative to
the difference between `bTreatment[2]` and `bTreatment[4]` that being large helps survival in the
absence of predators (to overcome the elements/nature) but in the presence of predators being large
makes a tadpole easier to catch (harder to hide) and more desirable to catch.

The support for the advantage of size in the absence of predators is limited, though, considering
the error bars on `bTreatment[1]` and `bTreatment[3]`. If we only accept the significant difference
in survivability from being smaller in the presence of predators, we would conclude being small
would primarily be an advantage in the larval/tadpole stage of the frog's development without an
explanation for why some tadpoles hatch larger. Based on the original paper, the confounding
variable seems to be survivability at metamorphosis, which could influence the timing of hatching
and therefore the ideal tadpole size. Tadpoles that are smaller at metamorphosis may be less likely
to survive (or reproduce) than those that are larger.

That is, there are two influences on the ideal tadpole size, both survivability at life stages in
nature:
```
MetaSurv -> TadpoleSize <- LarvSurv
```

The species (apparently) has to tradeoff size to survive both stages.

**13M2.** Compare the models you fit just above, using WAIC. Can you reconcile the differences in
WAIC with the posterior distributions of the models?

**Answer.** For comparison and to check on warnings, these results include `PSIS` deviances as well.
Notice the model with the predator predictor does well in both comparisons. This predictor
significantly improves predictive accuracy at the cost of only one parameter. Generally speaking the
model with only the size predictor does not do as well, because (alone) this is not an effective
predictor of whether the tadpole will survive to metamorphosis.

In general there are not large differences between these models, however, considering the error bars
produced by both WAIC and PSIS.

```{code-cell} r
iplot(function() {
  plot(compare(m13.2, m_rf_df_pred, m_rf_df_size, m_rf_df_interaction))
}, ar=3.5)
display_markdown("Raw data (preceding plot):")
display(compare(m13.2, m_rf_df_pred, m_rf_df_size, m_rf_df_interaction), mimetypes="text/plain")

p_comp = compare(m13.2, m_rf_df_pred, m_rf_df_size, m_rf_df_interaction, func=PSIS)
iplot(function() {
  plot(p_comp)
}, ar=3.5)
display_markdown("Raw data (preceding plot):")
display(p_comp, mimetypes="text/plain")
```

**13M3.** Re-estimate the basic Reed frog varying intercept model, but now using a Cauchy
distribution in place of the Gaussian distribution for the varying intercepts. That is, fit this
model:

$$
\begin{align}
S_i & \sim Binomial(N_i,p_i) \\
logit(p_i) & = \alpha_{tank[i]} \\
\alpha_{tank} & \sim Cauchy(\alpha, \sigma), tank = 1..48 \\
\alpha & \sim Normal(0, 1) \\
\sigma & \sim Exponential(1) \\
\end{align}
$$

(You are likely to see many divergent transitions for this model. Can you figure out why? Can you
fix them?) Compare the posterior means of the intercepts, $\alpha_{tank}$, to the posterior means
produced in the chapter, using the customary Gaussian prior. Can you explain the pattern of
differences? Take note of any change in the mean $\alpha$ as well.

**Answer.** First, let's reproduce some of the plots from the chapter. Similar to the approach in
the `R code 13.22` box and elsewhere, we'll print the raw output of `precis` for a model before its
plots:

[com1]: under_score

```{code-cell} r
data(reedfrogs)
rf_df <- reedfrogs
rf_df$tank <- 1:nrow(rf_df)

rf_dat <- list(
  S = rf_df$surv,
  N = rf_df$density,
  tank = rf_df$tank
)

## R code 13.3
m13.2 <- ulam(
  alist(
    S ~ dbinom(N, p),
    logit(p) <- a[tank],
    a[tank] ~ dnorm(a_bar, sigma),
    a_bar ~ dnorm(0, 1.5),
    sigma ~ dexp(1)
  ),
  data = rf_dat, chains = 4, cores = 4, log_lik = TRUE
)

plot_means <- function(post, plot_main) {
  # compute mean intercept for each tank
  # also transform to probability with logistic
  rf_df$propsurv.est <- logistic(apply(post$a, 2, mean))

  iplot(function() {
    # display raw proportions surviving in each tank
    plot(rf_df$propsurv,
      ylim = c(0, 1), pch = 16, xaxt = "n",
      xlab = "tank", ylab = "proportion survival", col = rangi2,
      main=plot_main
    )
    axis(1, at = c(1, 16, 32, 48), labels = c(1, 16, 32, 48))

    # overlay posterior means
    points(rf_df$propsurv.est)

    # mark posterior mean probability across tanks
    abline(h = mean(inv_logit(post$a_bar)), lty = 2)

    # draw vertical dividers between tank densities
    abline(v = 16.5, lwd = 0.5)
    abline(v = 32.5, lwd = 0.5)
    text(8, 0, "small tanks")
    text(16 + 8, 0, "medium tanks")
    text(32 + 8, 0, "large tanks")
  })
}

display(precis(m13.2, depth = 2), mimetypes="text/plain")
iplot(function() {
  plot(precis(m13.2, depth=2), main='m13.2')
}, ar=1.0)
post <- extract.samples(m13.2)
plot_means(post, "m13.2")
```

As promised, sampling from the model produces divergent transitions:

```{code-cell} r
m_tank_cauchy_orig <- ulam(
  alist(
    S ~ dbinom(N, p),
    logit(p) <- a[tank],
    a[tank] ~ dcauchy(a_bar, sigma),
    a_bar ~ dnorm(0, 1),
    sigma ~ dexp(1)
  ),
  data = rf_dat, chains = 4, cores = 4, log_lik = TRUE
)
```

Adjusting `adapt_delta` does little to reduce the number of divergent transitions:

```{code-cell} r
m_tank_cauchy <- ulam(
  alist(
    S ~ dbinom(N, p),
    logit(p) <- a[tank],
    a[tank] ~ dcauchy(a_bar, sigma),
    a_bar ~ dnorm(0, 1),
    sigma ~ dexp(1)
  ),
  data = rf_dat, chains = 4, cores = 4, log_lik = TRUE, control=list(adapt_delta=0.99)
)
```

Let's examine the `pairs()` plot suggested in the warning message (for only a few parameters):

```{code-cell} r
sel_pars = c("a_bar", "sigma", "a[41]", "a[38]")
iplot(function() {
  pairs(m_tank_cauchy@stanfit, pars=sel_pars)
})
iplot(function() {
  traceplot(m_tank_cauchy, pars=sel_pars)
}, ar=2)
```

For comparison, these are the same plots for the Devil's Funnel (i.e. Neal's Funnel):

```{code-cell} r
m13.7 <- ulam(
  alist(
    v ~ normal(0, 3),
    x ~ normal(0, exp(v))
  ),
  data = list(N = 1), chains = 4
)
display(precis(m13.7), mimetypes="text/plain")
iplot(function() {
  plot(precis(m13.7), main='m13.7')
}, ar=4.5)
```

This model produces warnings even producing the `pairs()` plot:

```{code-cell} r
iplot(function() {
  pairs(m13.7@stanfit)
})
iplot(function() {
  traceplot(m13.7)
}, ar=2)
```

[qf]: https://en.wikipedia.org/wiki/Quantile_function
[nd]: https://en.wikipedia.org/wiki/Normal_distribution
[cd]: https://en.wikipedia.org/wiki/Cauchy_distribution

Unlike the `pairs()` plot from the Funnel, the divergent transitions produced by the Cauchy
distribution are not associated with steep contours.

Let's at least attempt to reparameterize the model to confirm whether or not it will help. One way
to think about reparameterizing a model is as factoring the quantile function. As explained in
[Quantile function][qf], a sample from a given distribution may be obtained in principle by applying
its quantile function to a sample from a uniform distribution. The quantile function for the [Normal
distribution][nd] is:

$$
Q(p, \mu, \sigma) = \mu + \sigma \sqrt{2} \cdot erf^{-1} (2p - 1)
$$

So for the standard normal:
$$
Q_s(p) = \sqrt{2} \cdot erf^{-1} (2p - 1)
$$

Imagining `p` comes from a uniform distribution in both cases, we can write:
$$
Q(p, \mu, \sigma) = \mu + \sigma Q_s(p)
$$

Starting from the quantile function for the [Cauchy distribution][cd]:
$$
Q(p, x_0, \gamma) = x_0 + \gamma \tan[\pi(p - \frac{1}{2})]
$$

Define the standard Cauchy distribution quantile function as:
$$
Q_s(p) = \tan[\pi(p - \frac{1}{2})]
$$

So that:
$$
Q(p, x_0, \gamma) = x_0 + \gamma Q_s(p)
$$

Finally, define a new non-centered model:
$$
\begin{align}
S_i & \sim Binomial(N_i,p_i) \\
logit(p_i) & = \alpha + \sigma \cdot a_{tank[i]} \\
a_{tank} & \sim Cauchy(0, 1), tank = 1..48 \\
\alpha & \sim Normal(0, 1) \\
\sigma & \sim Exponential(1) \\
\end{align}
$$

Unfortunately, this model produces the same divergent transitions:

```{code-cell} r
m_tank_noncen_cauchy <- ulam(
  alist(
    S ~ dbinom(N, p),
    logit(p) <- a_bar + sigma * std_c[tank],
    std_c[tank] ~ dcauchy(0, 1),
    a_bar ~ dnorm(0, 1),
    sigma ~ dexp(1)
  ),
  data = rf_dat, chains = 4, cores = 4, log_lik = TRUE
)
```

What's more likely going on here is that the energy sanity checks in MCMC are too tight for the
extreme deviates produced by the Cauchy distribution. Consider the quantile function for the Cauchy
distribution above, defined based on the trigonometric `tan` function. This definition leads to
extreme negative or positive deviates when `p` is near either zero or one; notice this term
approaches negative infinity as `p` approaches zero and positive infinity as it approaches one.

Notice in the `pairs()` plot above, the trace plot, and in the number of effective samples that
larger parameters like `a[38]` are harder to sample than `a[41]`. Part of the reason for this may
be that these samples would get rejected as divergent transitions, even when we rarely happen to
sample from this part of the posterior.

In the posterior distributions parameter `a[38]` is much less certain than `a[41]`. In the original
and Cauchy model, parameter 38 is inferred to be larger than 41. All large parameters are going to
be more uncertain with the Cauchy distribution and in fact for all distributions with a thick tail;
getting a sample of a large value implies a rather large deviate from the distribution and a
specific large deviate is relatively unlikely relative to other large deviates (the long tail is
relatively flat). Additionally, a large observation could be explained by applying a larger range of
parameters to a distribution because every parameterization has large tails that allow for the
observation. The same observation could be made of the Student-t inferences in the next question.
The increase in uncertainty for larger parameters exists even in model `m13.2` but is much more
significant for thick-tailed distributions.

```{code-cell} r
display(precis(m_tank_cauchy, depth = 2), mimetypes="text/plain")
iplot(function() {
  plot(precis(m_tank_cauchy, depth=2), main='m_tank_cauchy')
}, ar=1.0)
```

The same trends in shrinkage exist in this model as the original model. Because of the thicker
tails, the model doesn't apply as much shrinkage to extreme observations. Because of the difficulty
in sampling, the shrinkage is more variable.

```{code-cell} r
post <- extract.samples(m_tank_cauchy)
plot_means(post, "m_tank_cauchy")
```

**13M4.** Now use a Student-t distribution with $\nu = 2$ for the intercepts:

$$
\alpha_{tank} \sim Student(2, \alpha, \sigma)
$$

Refer back to the Student-t example in Chapter 7 (page 234), if necessary. Compare the resulting
posterior to both the original model and the Cauchy model in 13M3. Can you explain the differences
and similarities in shrinkage in terms of the properties of these distributions?

**Answer.** This model produces some but fewer divergent transitions, likely because of deviates
coming from the thick tails:

[com2]: under_score

```{code-cell} r
m_tank_student_t <- ulam(
  alist(
    S ~ dbinom(N, p),
    logit(p) <- a[tank],
    a[tank] ~ dstudent(2, a_bar, sigma),
    a_bar ~ dnorm(0, 1),
    sigma ~ dexp(1)
  ),
  data = rf_dat, chains = 4, cores = 4, log_lik = TRUE
)
```

Although we won't address these divergent transitions, let's at least check how much mixing is
occurring:

```{code-cell} r
iplot(function() {
  pairs(m_tank_cauchy@stanfit, pars=sel_pars)
})
iplot(function() {
  traceplot(m_tank_cauchy, pars=sel_pars)
}, ar=2)

display(precis(m_tank_student_t, depth = 2), mimetypes="text/plain")
iplot(function() {
  plot(precis(m_tank_student_t, depth=2), main='m_tank_student_t')
}, ar=1.0)
```

Similar trends in shrinkage exist in this model. Because of the thicker tails, the model doesn't
apply as much shrinkage to extreme observations. Improved sampling relative to the Cauchy
distribution seems to have produced slightly more consistent shrinkage.

```{code-cell} r
post <- extract.samples(m_tank_student_t)
plot_means(post, "m_tank_student_t")
```

**13M5.** Modify the cross-classified chimpanzees model `m13.4` so that the adaptive prior for
blocks contains a parameter $\gamma$ for its mean:

$$
\begin{align}
\gamma_j & \sim Normal(\bar{\gamma}, \sigma_{\gamma}) \\
\bar{\gamma} & \sim Normal(0, 1.5)
\end{align}
$$

Compare this model to `m13.4`. What has including $\gamma$ done?

**Answer.** First, let's reproduce the relevant plots from the chapter:

[com3]: under_score

```{code-cell} r
data(chimpanzees)
d <- chimpanzees
d$treatment <- 1 + d$prosoc_left + 2 * d$condition

dat_list <- list(
  pulled_left = d$pulled_left,
  actor = d$actor,
  block_id = d$block,
  treatment = as.integer(d$treatment)
)

set.seed(13)
m13.4 <- ulam(
  alist(
    pulled_left ~ dbinom(1, p),
    logit(p) <- a[actor] + g[block_id] + b[treatment],
    b[treatment] ~ dnorm(0, 0.5),
    ## adaptive priors
    a[actor] ~ dnorm(a_bar, sigma_a),
    g[block_id] ~ dnorm(0, sigma_g),
    ## hyper-priors
    a_bar ~ dnorm(0, 1.5),
    sigma_a ~ dexp(1),
    sigma_g ~ dexp(1)
  ),
  data = dat_list, chains = 4, cores = 4, log_lik = TRUE
)

display(precis(m13.4, depth = 2), mimetypes="text/plain")
iplot(function() {
  plot(precis(m13.4, depth=2), main='m13.4')
}, ar=2.0)
```

When we add the new parameter, the number of divergent transitions increase:

```{code-cell} r
m13.4_extra_param <- ulam(
  alist(
    pulled_left ~ dbinom(1, p),
    logit(p) <- a[actor] + g[block_id] + b[treatment],
    b[treatment] ~ dnorm(0, 0.5),
    ## adaptive priors
    a[actor] ~ dnorm(a_bar, sigma_a),
    g[block_id] ~ dnorm(g_bar, sigma_g),
    ## hyper-priors
    a_bar ~ dnorm(0, 1.5),
    g_bar ~ dnorm(0, 1.5),
    sigma_a ~ dexp(1),
    sigma_g ~ dexp(1)
  ),
  data = dat_list, chains = 4, cores = 4, log_lik = TRUE
)
```

We also see many HDPI increase:

```{code-cell} r
display(precis(m13.4_extra_param, depth = 2), mimetypes="text/plain")
iplot(function() {
  plot(precis(m13.4_extra_param, depth=2), main='m13.4_extra_param')
}, ar=2.0)
```

Notice the previously specified prior for the new parameter $\bar{\gamma}$ did not change
significantly in the posterior. Let's change the prior to:
$$
\bar{\gamma} \sim Normal(5, 4)
$$

With this change, we can come up with significantly different inferences:

```{code-cell} r
m13.4_extra_param_new_prior <- ulam(
  alist(
    pulled_left ~ dbinom(1, p),
    logit(p) <- a[actor] + g[block_id] + b[treatment],
    b[treatment] ~ dnorm(0, 0.5),
    ## adaptive priors
    a[actor] ~ dnorm(a_bar, sigma_a),
    g[block_id] ~ dnorm(g_bar, sigma_g),
    ## hyper-priors
    a_bar ~ dnorm(0, 1.5),
    g_bar ~ dnorm(5, 1.5),
    sigma_a ~ dexp(1),
    sigma_g ~ dexp(1)
  ),
  data = dat_list, chains = 4, cores = 4, log_lik = TRUE
)

display(precis(m13.4_extra_param_new_prior, depth = 2), mimetypes="text/plain")
iplot(function() {
  plot(precis(m13.4_extra_param_new_prior, depth=2), main='m13.4_extra_param_new_prior')
}, ar=2.0)
```

All these symptoms are indicative of a non-identifiable parameter, as discussed in the chapter at
the start of section **13.3.1**. We encountered the same issue in question **13M1**.

**ERROR:**
> Likewise, the tails of distributions strongly influence can (sic) outliers are shrunk or not
towards the mean.

Likewise, the tails of distributions strongly influence whether outliers are shrunk towards the
mean.

**13M6.** Sometimes the prior and the data (through the likelihood) are in conflict, because they
concentrate around different regions of parameter space. What happens in these cases depends a lot
upon the shape of the tails of the distributions. Likewise, the tails of distributions strongly
influence can outliers are shrunk or not towards the mean. I want you to consider four different
models to fit to one observation at $y = 0$. The models differ only in the distributions assigned to
the likelihood and the prior. Here are the four models:

Model NN:
$$
\begin{align}
y & \sim Normal(\mu, 1) \\
\mu & \sim Normal(10, 1)
\end{align}
$$

Model TN:
$$
\begin{align}
y & \sim Student(2, \mu, 1) \\
\mu & \sim Normal(10, 1)
\end{align}
$$

Model NT:
$$
\begin{align}
y & \sim Normal(\mu, 1) \\
\mu & \sim Student(2, 10, 1)
\end{align}
$$

Model TT:
$$
\begin{align}
y & \sim Student(2, \mu, 1) \\
\mu & \sim Student(2, 10, 1)
\end{align}
$$

Estimate the posterior distributions for these models and compare them. Can you explain the results,
using the properties of the distributions?

**Answer.** Fit model NN:

```{code-cell} r
m_nn <- ulam(
  alist(
    y ~ dnorm(mu, 1),
    mu ~ dnorm(10, 1)
  ),
  data = list(y = 0), chains = 4
)
flush.console()
```

Output of `precis` for model NN:

```{code-cell} r
display(precis(m_nn), mimetypes="text/plain")
```

Fit model TN:

```{code-cell} r
m_tn <- ulam(
  alist(
    y ~ dstudent(2, mu, 1),
    mu ~ dnorm(10, 1)
  ),
  data = list(y = 0), chains = 4
)
flush.console()
```

Output of `precis` for model TN:

```{code-cell} r
display(precis(m_tn), mimetypes="text/plain")
```

Fit model NT:

```{code-cell} r
m_nt <- ulam(
  alist(
    y ~ dnorm(mu, 1),
    mu ~ dstudent(2, 10, 1)
  ),
  data = list(y = 0), chains = 4
)
flush.console()
```

Output of `precis` for model NT:

```{code-cell} r
display(precis(m_nt), mimetypes="text/plain")
```

Fit model NN:

```{code-cell} r
m_tt <- ulam(
  alist(
    y ~ dstudent(2, mu, 1),
    mu ~ dstudent(2, 10, 1)
  ),
  data = list(y = 0), chains = 4
)
flush.console()
```

Output of `precis` for model TT:

```{code-cell} r
display(precis(m_tt), mimetypes="text/plain")
```

[rr]: https://en.wikipedia.org/wiki/Robust_regression
[rp]: https://en.wikipedia.org/wiki/Regularization_(mathematics)

These four models are best understood in terms of [Robust regression][rr] (section **7.5.2**) and
[Regularizing priors][rp] (section **7.3**).

Try not to assume a right answer in these inferences. The $y = 0$ data point is definitely an
outlier with respect to the four priors centered at $\mu = 10$, but are the priors or the data point
correct? It may be that most observations are at $y = 10$ and this sample is truly an outlier, or
that most observations are at $y = 0$ and the human building the model made a mistake in stating a
prior centered on $\mu = 10$.

Let's consider regularizing priors. The normal priors on $\mu$ in the first and second models are
much more regularizing than the Student-t priors. A regularizing prior in this and any other model
means a prior that prevents the model from getting overly excited by the data. Said another way, a
regularizing prior is a strong statement about prior beliefs that should override the data to some
extent. The term *regularizing* is generally a positive one, but a regularizing prior is more
generally a neutral concept of preference for the prior to the data. In these first two models we
see the inference for $\mu$ is generally closer to the prior than to the data. That is, $\mu \sim 5$
and $\mu \sim 10$ are closer to the prior of $\mu = 10$ than the models with less regularizing
Student-t distributions, with inferences of $\mu \sim 0$ and $\mu \sim 5$.

Equally as important to the final inferences are the likelihood functions. The Student-t likelihoods
in the second and fourth models are much more robust to outliers than the noormal likelihoods. We
say we are doing robust regression when we pick a likelihood function that is not easily surprised
by the data such as a Student-t distribution. Again, the term *robust* is generally a positive one,
but a robust regression is more generally a neutral concept of preference against getting excited by
any single data point. With one data point, this translates to preference for the prior. In the second
and fourth models we see the inference for $\mu$ is generally closer to the prior than to the data.
That is, $\mu \sim 10$ and $\mu \sim 5$ are closer to the prior of $\mu = 10$ than the models with
less robust normal likelihoods, with inferences of $\mu \sim 5$ and $\mu \sim 0$.

Interestingly, the flat prior on model TT has led to some divergent transitions. See section
**9.5.3** for how a weakly informative prior such as the normal prior in model TN could address this
issue. If you look at the `pairs()` plot and traceplot below, you'll see the sampling process can't
decide whether the data or the likelihood is correct. That is, the histogram for `mu` produces a
large number of samples at both $\mu = 0$ and $\mu = 10$. The Student-t likelihood doesn't strongly
rule out the possibility that the Student-t prior is correct, and the Student-t prior doesn't
strongly rule out the possibility that the data, through the Student-t likelihood, is correct.

```{code-cell} r
iplot(function() {
  pairs(m_tt@stanfit)
})
iplot(function() {
  traceplot(m_tt)
}, ar=2)
```

**13H1.** In 1980, a typical Bengali woman could have 5 or more children in her lifetime. By the
year 2000, a typical Bengali woman had only 2 or 3. You’re going to look at a historical set of
data, when contraception was widely available but many families chose not to use it. These data
reside in `data(bangladesh)` and come from the 1988 Bangladesh Fertility Survey. Each row is one of
1934 women. There are six variables, but you can focus on two of them for this practice problem:

1. `district`: ID number of administrative district each woman resided in
2. `use.contraception`: An indicator (0/1) of whether the woman was using contraception

The first thing to do is ensure that the cluster variable, `district`, is a contiguous set of
integers. Recall that these values will be index values inside the model. If there are gaps, you’ll
have parameters for which there is no data to inform them. Worse, the model probably won’t run. Look
at the unique values of the `district` variable:

R code 13.40

```
> sort(unique(d$district))

[1] 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
[26] 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50
[51] 51 52 53 55 56 57 58 59 60 61
```

District 54 is absent. So `district` isn’t yet a good index variable, because it’s not contiguous.
This is easy to fix. Just make a new variable that is contiguous. This is enough to do it:

R code 13.41

```
> d$district_id <- as.integer(as.factor(d$district))
> sort(unique(d$district_id))

[1] 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
[26] 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50
[51] 51 52 53 54 55 56 57 58 59 60
```

Now there are 60 values, contiguous integers 1 to 60. Now, focus on predicting `use.contraception`,
clustered by `district_id`. Fit both (1) a traditional fixed-effects model that uses an index
variable for district and (2) a multilevel model with varying intercepts for district. Plot the
predicted proportions of women in each district using contraception, for both the fixed-effects
model and the varying-effects model. That is, make a plot in which district ID is on the horizontal
axis and expected proportion using contraception is on the vertical. Make one plot for each model,
or layer them on the same plot, as you prefer. How do the models disagree? Can you explain the
pattern of disagreement? In particular, can you explain the most extreme cases of disagreement, both
why they happen where they do and why the models reach different inferences?

**Answer.** The `help` for the `bangladesh` data.frame, to confirm we aren't missing anything:

```{code-cell} r
data(bangladesh)
display(help(bangladesh))

bc_df <- bangladesh
bc_df$district_id <- as.integer(as.factor(bc_df$district))
sort(unique(bc_df$district_id))
```

The `head` of the `bangladesh` data.frame, with the new variable suggested by the author:

```{code-cell} r
display(head(bc_df))
```

A `summary` of the `bangladesh` data.frame:

```{code-cell} r
display(summary(bc_df))
```

Sampling from the fixed effects model:

```{code-cell} r
bc_dat <- list(
  UseContraception = bc_df$use.contraception,
  DistrictId = bc_df$district_id
)

m_bc_fe <- ulam(
  alist(
    UseContraception ~ dbinom(1, p),
    logit(p) <- a[DistrictId],
    a[DistrictId] ~ dnorm(0, 1.5)
  ),
  data = bc_dat, chains = 4, cores = 4, log_lik = TRUE
)
display(precis(m_bc_fe, depth=2), mimetypes="text/plain")
iplot(function() {
  plot(precis(m_bc_fe, depth=2), main='m_bc_fe')
}, ar=0.8)
```

Sampling from the varying effects model:

```{code-cell} r
m_bc_ve <- ulam(
  alist(
    UseContraception ~ dbinom(1, p),
    logit(p) <- a[DistrictId],
    a[DistrictId] ~ dnorm(a_bar, sigma),
    a_bar ~ dnorm(0, 1.5),
    sigma ~ dexp(1)
  ),
  data = bc_dat, chains = 4, cores = 4, log_lik = TRUE
)
display(precis(m_bc_ve, depth=2), mimetypes="text/plain")
iplot(function() {
  plot(precis(m_bc_ve, depth=2), main='m_bc_ve')
}, ar=0.8)

post_fe <- extract.samples(m_bc_fe)
post_ve <- extract.samples(m_bc_ve)
p_fe_c <- logistic(apply(post_fe$a, 2, mean))
p_ve_c <- logistic(apply(post_ve$a, 2, mean))
```

The plot suggested by the author in the question:

```{code-cell} r
iplot(function() {
  plot(p_fe_c,
    ylim = c(0, 1), pch = 16, xaxt = "n",
    xlab = "district ID", ylab = "proportion using contraception", col = rangi2,
    main="Predicted proportion using contraception"
  )
  axis(1, at = seq(1, 60, by=2), las=2)

  # overlay posterior means
  points(p_ve_c)

  # mark posterior mean probability across districts
  abline(h = mean(inv_logit(post_ve$a_bar)), lty = 2)
})
```

The number of observations (women) in every district:

```{code-cell} r
iplot(function() {
  barplot(setNames(table(bc_df$district_id), sort(unique(bc_df$district_id))))
})
```

There are two factors affecting shrinkage, as discussed under Figure 13.1 in the text. The first is
the number of observations in the district; notice that district 3 (with only a few observations)
shrinks much more towards the weighted cluster mean (the dashed line) than any other district. The
second is the distance from the dashed line. The estimate for district 35, which still has a
reasonable number of observations, shrinks significantly towards the dashed line because it starts
far from the mean. District 14 starts from a similar distance to the dashed line but shrinks less
because it has so many observations.

```{code-cell} r
# source('practice-multilevel-trolley.R')
```
