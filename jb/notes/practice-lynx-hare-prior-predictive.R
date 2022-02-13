source("iplot.R")
library(rethinking)

e16m3 <- r"(
**16M3.** Use prior predictive simulations to investigate the lynx-hare model. Begin with the priors
in the chapter. Which population dynamics do these produce? Can you suggest any improvements to the
priors, on the basis of your simulations?
)"
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
e16m3a <- r"(
Clearly, these priors produce extreme observations. In some cases populations vary from nearly zero
individuals to tens of millions. In any real ecosystem this would not happen; species would go
extinct if they hit an extreme population bottleneck.

A simple solution is to assume a species's birth and death rates are not several orders of magnitude
off from each other, and to reduce the magnitude of dispersion parameters (standard deviations).
)"
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
q16m3 <- function() {
  display_markdown(e16m3)
  display_markdown("**Answer.** Sampling only ten simulations from the priors:")
  s16m2a()
  display_markdown(e16m3a)
  s16m2b()
}
