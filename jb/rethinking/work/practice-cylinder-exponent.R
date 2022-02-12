source("iplot.R")
library(rethinking)

e16m1 <- r"(
**16M1.** Modify the cylinder height model, `m16.1`, so that the exponent 3 on height is instead a
free parameter. Do you recover the value of 3 or not? Plot the posterior predictions for the new
model. How do they differ from those of `m16.1`?

**Answer.** First, let's reproduce results for `m16.1`:
)"
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
epce <- r"(
The new model fits the data better in the range of children, at some some cost to the fit in the
range of adults. In general it fits more closely; notice the change in the `sigma` estimate.
)"
q16m1 <- function() {
  display_markdown(e16m1)
  d <- load.d16m1()
  m16.1 <- fm16m1(d)
  display_markdown("Fitting the new model with a parameterized exponent:")
  m3exp <- fm3exp(d)
  display_markdown(epce)
}
