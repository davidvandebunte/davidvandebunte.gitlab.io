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

```{code-cell}
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

```{code-cell}
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

```{code-cell}
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

```{code-cell}
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

```{code-cell}
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

"**Answer.** Sampling only ten simulations from the priors:"

```{code-cell}
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

```{code-cell}
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

```{code-cell}
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

```{code-cell}
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

```{code-cell}
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

```{code-cell}
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

```{code-cell}
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

```{code-cell}
source('practice-autoregressive.R')
```

```{code-cell}
source('practice-mites.R')
```
