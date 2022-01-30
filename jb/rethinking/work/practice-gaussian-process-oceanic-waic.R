source("iplot.R")
library(rethinking)

display_markdown(r"(
**14M4.** Use WAIC to compare the Gaussian process model of Oceanic tools to the models fit to the
same data in Chapter 11. Pay special attention to the effective numbers of parameters, as estimated
by WAIC.

**Answer.** Let's reproduce results from the two chapters:
)")

data(islandsDistMatrix)
data(Kline2) # load the ordinary data, now with coordinates
d <- Kline2
d$P <- scale(log(d$population))
d$contact_id <- ifelse(d$contact == "high", 2, 1)

dat <- list(
  T = d$total_tools,
  P = d$P,
  cid = d$contact_id
)

# intercept only
m11.9 <- ulam(
  alist(
    T ~ dpois(lambda),
    log(lambda) <- a,
    a ~ dnorm(3, 0.5)
  ),
  data = dat, chains = 4, log_lik = TRUE
)

# interaction model
m11.10 <- ulam(
  alist(
    T ~ dpois(lambda),
    log(lambda) <- a[cid] + b[cid] * P,
    a[cid] ~ dnorm(3, 0.5),
    b[cid] ~ dnorm(0, 0.2)
  ),
  data = dat, chains = 4, log_lik = TRUE
)

dat2 <- list(T = d$total_tools, P = d$population, cid = d$contact_id)
m11.11 <- ulam(
  alist(
    T ~ dpois(lambda),
    lambda <- exp(a[cid]) * P^b[cid] / g,
    a[cid] ~ dnorm(1, 1),
    b[cid] ~ dexp(1),
    g ~ dexp(1)
  ),
  data = dat2, chains = 4, log_lik = TRUE
)
flush.console()
display(precis(m11.11, depth=2), mimetypes="text/plain")
flush.console()

d$society <- 1:10 # index observations
dat_list <- list(
  T = d$total_tools,
  P = d$population,
  society = d$society,
  Dmat = islandsDistMatrix
)
m14.8 <- ulam(
  alist(
    T ~ dpois(lambda),
    lambda <- (a * P^b / g) * exp(k[society]),
    vector[10]:k ~ multi_normal(0, SIGMA),
    matrix[10, 10]:SIGMA <- cov_GPL2(Dmat, etasq, rhosq, 0.01),
    c(a, b, g) ~ dexp(1),
    etasq ~ dexp(2),
    rhosq ~ dexp(0.5)
  ),
  data = dat_list, chains = 4, cores = 4, iter = 2000, log_lik = TRUE
)
flush.console()
display(precis(m14.8, depth=2), mimetypes="text/plain")
flush.console()

display_markdown(r"(
<br/>

A `compare` plot with its associated raw data:
)")

iplot(function() {
  plot(compare(m11.9, m11.10, m11.11, m14.8))
}, ar=4.5)
display_markdown("Raw data (preceding plot):")
display(compare(m11.9, m11.10, m11.11, m14.8), mimetypes="text/plain")

display_markdown(r"(
<br/>

The new model does better overall relative to `m11.1` because it presumably has a more accurate
method of estimating the contact between islands. See the first section of **14.5.1** for how the
new model improves upon the old low/high contact indicator.

The new model also has the lowest penalty term (effective number of parameters). Notice in the
`precis` output above it has 10 intercept terms, and 5 other terms. This is much more than the 5
parameters in `m11.1`, also above. It achieves this relative to `m11.1` because of the significant
regularization provided by parameter sharing.
)")
