source("iplot.R")
library(rethinking)

display_markdown(r"(
**15H6.** Return to the divorce rate measurement error model. This time try to incorporate the full
generative system: $A \rightarrow M \rightarrow D$, $A \rightarrow D$. What this means is that the
prior for $M$ should include $A$ somehow, because it is influenced by $A$.
)")

load.d15h6 <- function() {
  data(WaffleDivorce)
  d <- WaffleDivorce

  dat <- list(
    D_obs = standardize(d$Divorce),
    D_sd = d$Divorce.SE / sd(d$Divorce),
    M_obs = standardize(d$Marriage),
    M_sd = d$Marriage.SE / sd(d$Marriage),
    A = standardize(d$MedianAgeMarriage),
    N = nrow(d)
  )
  return(dat)
}

a15h6a <- function(dat) {
  m15.2 <- ulam(
    alist(
      D_obs ~ dnorm(D_true, D_sd),
      vector[N]:D_true ~ dnorm(mu, sigma),
      mu <- a + bA * A + bM * M_true[i],
      M_obs ~ dnorm(M_true, M_sd),
      vector[N]:M_true ~ dnorm(0, 1),
      a ~ dnorm(0, 0.2),
      bA ~ dnorm(0, 0.5),
      bM ~ dnorm(0, 0.5),
      sigma ~ dexp(1)
    ),
    data = dat, chains = 4, cores = 4
  )
  display_precis(m15.2, "m15.2", ar=0.4)
  return(m15.2)
}

q15h6b <- function(dat) {
  m15h6 <- ulam(
    alist(
      D_obs ~ dnorm(D_true, D_sd),
      vector[N]:D_true ~ dnorm(mu, sigma),
      mu <- a + bA * A + bM * M_true[i],
      M_obs ~ dnorm(M_true, M_sd),
      vector[N]:M_true ~ dnorm(mu_M, 1),
      mu_M <- aM + bAM * A,
      aM ~ dnorm(0, 0.2),
      a ~ dnorm(0, 0.2),
      bA ~ dnorm(0, 0.5),
      bM ~ dnorm(0, 0.5),
      bAM ~ dnorm(0, 0.5),
      sigma ~ dexp(1)
    ),
    data = dat, chains = 4, cores = 4
  )
  display_precis(m15h6, "m15h6", ar=0.4)
  return(m15h6)
}

e15h6b <- r"(
Notice `bAM` is nonzero. However, most of the original parameters are unchanged, as expected based
on the discussion in section **5.1.4** (`M` adds little predictive power once you know `A`).
)"
q15h6 <- function() {
  dat <- load.d15h6()
  display_markdown("**Answer.** Let's start by reproducing results from the chapter:")
  m15.2 <- a15h6a(dat)
  display_markdown("Fitting the new model:")
  m15h6 <- q15h6b(dat)

  iplot(function() {
    plot(coeftab(m15.2, m15h6), pars=c("a", "bA", "bM", "sigma"), main="coeftab")
  }, ar=2)
  display_markdown(e15h6b)
}
q15h6()
