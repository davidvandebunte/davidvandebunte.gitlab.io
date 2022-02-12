source("iplot.R")
library(rethinking)

display_markdown(r"(
**15H1.** The data in `data(elephants)` are counts of matings observed for bull elephants of
differing ages. There is a strong positive relationship between age and matings. However, age is not
always assessed accurately. First, fit a Poisson model predicting `MATINGS` with `AGE` as a
predictor. Second, assume that the observed `AGE` values are uncertain and have a standard error of
±5 years. Re-estimate the relationship between `MATINGS` and `AGE`, incorporating this measurement
error. Compare the inferences of the two models.

**Answer.** The full `elephants` data.frame:
)")
data(elephants)
display(elephants)

q15.h1.a <- function(d) {
  dat <- list(
    M = as.integer(d$MATINGS),
    A = as.numeric(standardize(d$AGE))
  )
  m15.h1.a <- ulam(
    alist(
      M ~ dpois(lambda),
      lambda <- exp(a + bA*A),
      a ~ dnorm(0, 1),
      bA ~ dnorm(0, 1)
    ), data=dat, cores = 4, chains = 4, log_lik = TRUE
  )
  display_precis(m15.h1.a, "m15.h1.a", 4.0)
  return(m15.h1.a)
}
q15.h1.b <- function(d, error=5.0) {
  set.seed(31)
  stdA = standardize(d$AGE)
  dat <- list(
    M = as.integer(d$MATINGS),
    A_obs = as.numeric(stdA),
    A_sd = error / attr(stdA, "scaled:scale"),
    N = nrow(d)
  )
  m15.h1.b <- ulam(
    alist(
      M ~ dpois(lambda),
      A_obs ~ dnorm(A_true, A_sd),
      lambda <- exp(a + bA*A_true[i]),
      vector[N]:A_true ~ dnorm(0, 1),
      a ~ dnorm(0, 1),
      bA ~ dnorm(0, 1)
    ), data=dat, cores = 4, chains = 4, log_lik = TRUE
  )
  display_precis(m15.h1.b, "m15.h1.b", 0.8)
  return(m15.h1.b)
}

# m15.h1.a <- q15.h1.a(elephants)
# m15.h1.b <- q15.h1.b(elephants)
# 
# iplot(function() {
#   plot(coeftab(m15.h1.b, m15.h1.a), pars=c("a", "bA"), main="Parameter comparison for elephant models")
# }, ar=3.0)

display_markdown(r"(
The second model infers both a larger and more uncertain estimate (wider credible intervals) for
`bA`.
)")

display_markdown(r"(
**15H2.** Repeat the model fitting problem above, now increasing the assumed standard error on
`AGE`. How large does the standard error have to get before the posterior mean for the coefficient
on `AGE` reaches zero?

**Answer.** The coefficient's uncertainty gets large enough to cover zero when we get to roughly
20-25 years of age uncertainty:
)")
q15.h1.b(elephants, error=25)
