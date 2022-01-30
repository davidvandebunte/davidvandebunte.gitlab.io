library(rethinking)

source('iplot.R')

ask.modify.panda.nut.example.with.sex.predictor <- r"(
**16H1.** Modify the Panda nut opening model so that male and female chimpanzees have different
maximum adult body mass. The `sex` variable in `data(Panda_nuts)` provides the information you need.
Be sure to incorporate the fact that you know, prior to seeing the data, that males are on average
larger than females at maturity.
)"
answer.modify.panda.nut.example.with.sex.predictor <- r"(
**Answer.** First, let's reproduce results from the chapter:
)"
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
english.rework.panda.nut.scientific.model.with.sex.predictor <- r"(
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
)"
modify.panda.nut.example.with.sex.predictor <- function() {
  display_markdown(ask.modify.panda.nut.example.with.sex.predictor)
  display_markdown(answer.modify.panda.nut.example.with.sex.predictor)
  fit.panda.nut.example()
  d <- load.panda.nut.data()
  display_markdown(english.rework.panda.nut.scientific.model.with.sex.predictor)
  fit.panda.nut.example.with.sex.predictor(d)
  display_markdown(r"(The new model learns significantly different $\phi$ parameters.)")
}
# modify.panda.nut.example.with.sex.predictor()

ask.panda.nut.example.with.individual.differences <- r"(
**16H2.** Now return to the Panda nut model and try to incorporate individual differences. There are
two parameters, $\phi$ and $k$, which plausibly vary by individual. Pick one of these, allow it to
vary by individual, and use partial pooling to avoid overfitting. The variable `chimpanzee` in
`data(Panda_nuts)` tells you which observations belong to which individuals.
)"
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

answer.panda.nut.example.with.individual.differences <- r"(
There's a lot of individual variation; the 9th chimpanzee is a standout even with regularization.
)"
modify.panda.nut.example.with.individual.differences <- function() {
    display_markdown(ask.panda.nut.example.with.individual.differences)
    display_markdown(r"(**Answer.** Pick the $\phi$ parameter to vary by individual:)")
    fit.panda.nut.example.with.individual.differences()
    display_markdown(answer.panda.nut.example.with.individual.differences)
}
modify.panda.nut.example.with.individual.differences()
