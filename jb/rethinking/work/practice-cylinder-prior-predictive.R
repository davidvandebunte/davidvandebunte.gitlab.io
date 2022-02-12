source("iplot.R")
library(rethinking)

e16m2 <- r"(
**16M2.** Conduct a prior predictive simulation for the cylinder height model. Begin with the priors
in the chapter. Do these produce reasonable prior height distributions? If not, which modifications
do you suggest?

**ERROR:**
> Do these produce reasonable prior height distributions?

We're predicting weight, so the author likely meant reasonable weight distributions.
)"
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
e16m2a <- r"(
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
)"
s16m2a <- function() {
  set.seed(7)
  N <- 20
  p_sim <- rbeta(N, shape1=2, shape2=18)
  k_sim <- rlnorm(N, meanlog=log(30), sdlog=0.1)
  pp16m2(p_sim, k_sim)
}
q16m2 <- function() {
  display_markdown(e16m2)
  s16m2()
  display_markdown(e16m2a)
  s16m2a()
}
q16m2()
