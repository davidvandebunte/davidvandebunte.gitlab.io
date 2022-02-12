source("iplot.R")
library(rethinking)

display_markdown(r"(
**15M4.** Simulate data from this DAG: $X \rightarrow Y \rightarrow Z$. Now fit a model that
predicts $Y$ using both $X$ and $Z$. What kind of confound arises, in terms of inferring the causal
influence of $X$ on $Y$?

**Answer.** First lets simulate, with normal distributions:
)")

N <- 1000
X <- rnorm(N)
Y <- rnorm(N, mean=X)
Z <- rnorm(N, mean=Y)

dat_list <- list(
  X = X,
  Y = Y,
  Z = Z
)

m_confound <- ulam(
  alist(
    Y ~ dnorm(mu, sigma),
    mu <- a + bX*X + bZ*Z,
    c(a, bX, bZ) ~ dnorm(0, 1),
    sigma ~ dexp(1)
  ), data=dat_list, chains=4, cores=4
)

display(precis(m_confound, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m_confound, depth=3), main="m_confound")
}, ar=4.5)

display_markdown(r"(
The confound we're running into is post-treatment bias (conditioning on the outcome).

In this case $Z$ is a better predictor of $Y$ than $X$ (notice the credible intervals). This is
because the function between $X$ and $Y$ is the same as the function between $Y$ and $Z$,
specifically the normal distribution with standard deviation equal one. Since $Y$ will take on more
dispersed values than $X$, and $Z$ more dispersed values than $Y$, the more widely dispersed values
of $Z$ will predict $Y$ better.
)")
