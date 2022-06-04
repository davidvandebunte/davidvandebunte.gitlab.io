source('iplot.R')
library(rethinking)

display_markdown("
**9M1.** Re-estimate the terrain ruggedness model from the chapter, but now using a uniform prior
for the standard deviation, `sigma`. The uniform prior should be `dunif(0,1)`. Use `ulam` to
estimate the posterior. Does the different prior have any detectible influence on the posterior
distribution of `sigma`? Why or why not?

**Answer.** This change could have potentially have had an effect on the inference for `sigma`
because it assigns zero prior probability to parameter values above `1.0`. Because `sigma` is less
than one, it doesn't make a difference.
")

source('load-slim-rugged.R')

m_rugged_unif_sigma <- ulam(
  alist(
    log_gdp_std ~ dnorm(mu, sigma),
    mu <- a[cid] + b[cid] * (rugged_std - 0.215),
    a[cid] ~ dnorm(1, 0.1),
    b[cid] ~ dnorm(0, 0.3),
    sigma ~ dunif(0,1)
  ),
  data = dat_slim, chains = 4, cores = parallel::detectCores()
)

iplot(function() {
  plot(precis(m_rugged_unif_sigma, depth=2), main="m_rugged_unif_sigma")
}, ar=4.0)

display_markdown("
**9M2.** Modify the terrain ruggedness model again. This time, change the prior for `b[cid]` to
`dexp(0.3)`. What does this do to the posterior distribution? Can you explain it?

**Answer.** Notice `b[2]` is now positive, when previously it was inferred to be negative. Because
we assigned zero prior probability to negative values, we're forcing this new inference.

You may also see the warning message:

```
Warning message:
“Tail Effective Samples Size (ESS) is too low, indicating posterior variances and tail quantiles may be unreliable.
Running the chains for more iterations may help. See
http://mc-stan.org/misc/warnings.html#tail-ess”
```
")

m_rugged_exp_b <- ulam(
  alist(
    log_gdp_std ~ dnorm(mu, sigma),
    mu <- a[cid] + b[cid] * (rugged_std - 0.215),
    a[cid] ~ dnorm(1, 0.1),
    b[cid] ~ dexp(0.3),
    sigma ~ dexp(1)
  ),
  data = dat_slim, chains = 4, cores = parallel::detectCores()
)

iplot(function() {
  plot(precis(m_rugged_exp_b, depth=2), main="m_rugged_exp_b")
}, ar=4.0)

source('practice-vary-mcmc-warmup.R')
source('practice-cauchy-prior.R')
source('practice-ulam-divorce-rate.R')
