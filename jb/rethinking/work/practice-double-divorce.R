source("iplot.R")
library(rethinking)

display_markdown(r"(
**15M3.** Repeat the divorce data measurement error models, but this time double the standard
errors. Can you explain how doubling the standard errors impacts inference?

**Answer.** Let's start by reproducing the results from the chapter, for the sake of comparison:
)")

data(WaffleDivorce)
d <- WaffleDivorce

dlist <- list(
  D_obs = standardize(d$Divorce),
  D_sd = d$Divorce.SE / sd(d$Divorce),
  M = standardize(d$Marriage),
  A = standardize(d$MedianAgeMarriage),
  N = nrow(d)
)
m15.1 <- ulam(
  alist(
    D_obs ~ dnorm(D_true, D_sd),
    vector[N]:D_true ~ dnorm(mu, sigma),
    mu <- a + bA * A + bM * M,
    a ~ dnorm(0, 0.2),
    bA ~ dnorm(0, 0.5),
    bM ~ dnorm(0, 0.5),
    sigma ~ dexp(1)
  ),
  data = dlist, chains = 4, cores = 4
)
display(precis(m15.1, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m15.1, depth=3), main="m15.1")
}, ar=1)

dlist <- list(
  D_obs = standardize(d$Divorce),
  D_sd = d$Divorce.SE / sd(d$Divorce),
  M_obs = standardize(d$Marriage),
  M_sd = d$Marriage.SE / sd(d$Marriage),
  A = standardize(d$MedianAgeMarriage),
  N = nrow(d)
)
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
  data = dlist, chains = 4, cores = 4
)
display(precis(m15.2, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m15.2, depth=3), main="m15.2")
}, ar=0.5)

display_markdown(r"(
Doubling the standard error:
)")
d$doubleSE = 2*d$Divorce.SE

dlist <- list(
  D_obs = standardize(d$Divorce),
  D_sd = d$doubleSE / sd(d$Divorce),
  M = standardize(d$Marriage),
  A = standardize(d$MedianAgeMarriage),
  N = nrow(d)
)
m.double.se.1 <- ulam(
  alist(
    D_obs ~ dnorm(D_true, D_sd),
    vector[N]:D_true ~ dnorm(mu, sigma),
    mu <- a + bA * A + bM * M,
    a ~ dnorm(0, 0.2),
    bA ~ dnorm(0, 0.5),
    bM ~ dnorm(0, 0.5),
    sigma ~ dexp(1)
  ),
  data = dlist, chains = 4, cores = 4
)
display(precis(m.double.se.1, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m.double.se.1, depth=3), main="m.double.se.1")
}, ar=1)

dlist <- list(
  D_obs = standardize(d$Divorce),
  D_sd = d$doubleSE / sd(d$Divorce),
  M_obs = standardize(d$Marriage),
  M_sd = d$Marriage.SE / sd(d$Marriage),
  A = standardize(d$MedianAgeMarriage),
  N = nrow(d)
)
m.double.se.2 <- ulam(
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
  data = dlist, chains = 4, cores = 4
)
display(precis(m.double.se.2, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m.double.se.2, depth=3), main="m.double.se.2")
}, ar=0.5)

display_markdown(r"(
Comparing the most important parameters:
)")

iplot(function() {
  plot(
    coeftab(m.double.se.2, m15.2, m.double.se.1, m15.1), pars=c("a", "bA", "bM", "sigma"),
    main="All models"
  )
}, ar=1.7)

display_markdown(r"(
Notice we are getting some divergent transitions. It's likely we're running into these issues
because there is more parameter space to explore; we're less certain about all our inferences and so
we need to cover more possibilities. Like vague priors, this can lead to divergent transitions.

The `a`, `bA`, and `bM` parameters have increased. With less certainty in the measurements, it's
more plausible that a stronger relationship holds (similar to what we saw in Figure 15.3). In
contrast, the `sigma` parameter has decreased, because we can now explain more variation in terms of
measurement error than general noise.

We also see, in general, more uncertainty in parameter estimates across the board (wider HDPI bars).
)")
