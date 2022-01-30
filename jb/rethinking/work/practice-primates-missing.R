source("iplot.R")
library(rethinking)

display_markdown(r"(
**15H5.** Now consider missing values - this data set is lousy with them. You can ignore measurement
error in this problem. Let’s get a quick idea of the missing values by counting them in each
variable: R code

R code 15.37
```
library(rethinking)
data(Primates301)
d <- Primates301
colSums( is.na(d) )
```
<br/>

We’ll continue to focus on just brain and body, to stave off insanity. Consider only those species
with measured body masses:

R code 15.38
```
cc <- complete.cases( d$body )
M <- d$body[cc]
M <- M / max(M)
B <- d$brain[cc]
B <- B / max( B , na.rm=TRUE )
```
<br/>

You should end up with 238 species and 56 missing brain values among them.

First, consider whether there is a pattern to the missing values. Does it look like missing values
are associated with particular values of body mass? Draw a DAG that represents how missingness works
in this case. Which type (MCAR, MAR, MNAR) is this?

Second, impute missing values for brain size. It might help to initialize the 56 imputed variables
to a valid value:

R code 15.39
```
start=list( B_impute=rep(0.5,56) )
```
<br/>

This just helps the chain get started.

Compare the inferences to an analysis that drops all the missing values. Has anything changed? Why
or why not? Hint: Consider the density of data in the ranges where there are missing values. You
might want to plot the imputed brain sizes together with the observed values.

**ERROR:**

> by counting them in each variable: R code
)")

load.d15h5 <- function() {
  data(Primates301)
  d <- Primates301
  display_markdown("**Answer.** The `colSums` output:")
  display(colSums(is.na(d)), mimetypes="text/plain")
  
  cc <- complete.cases( d$body )
  M <- d$body[cc]
  M <- M / max(M)
  B <- d$brain[cc]
  B <- B / max( B , na.rm=TRUE )
  d15h5 <- data.frame(B = B, M = M)
  display_markdown("<br/> To confirm there are 238 species, preview the data.frame:")
  display(d15h5)
  display_markdown("<br/> To confirm there are 56 missing brain values, check the `summary`:")
  display(summary(d15h5))
  return(d15h5)
}

e15h5a <- r"(
The negative intercept `a` merely indicates that most values are 0 rather than 1 in D (not missing).
More interesting is `bM`, which is reliably negative. A negative `bM` indicates that larger values
of `M` are associated with being missing less. That is, brain sizes are missing more often for
species with small masses.

Clearly this is not MCAR. See section **15.2.2** for potential DAGs. If you believe that brain
volumes are only missing because researchers prefer to study species with a larger mass, then this
may be a salvageable MAR situation. If you believe brain volumes are missing because researchers
prefer to study species with larger brains, this is MNAR.
)"
q15h5a <- function(d) {
  dat <- list(
    D = as.integer(is.na(d$B)),
    M = as.numeric(standardize(d$M))
  )
  display_markdown("<br/> Let's check if we can predict `D` (deleted values) from `M`:")
  m15h5a <- ulam(
    alist(
      D ~ dbinom(1, p),
      logit(p) <- a + bM*M,
      c(a, bM) ~ dnorm(0, 1)
    ), data=dat, cores=4, chains=4
  )
  display_precis(m15h5a, "m15h5a", ar=4.0)
  display_markdown(e15h5a)
}

q15h5b <- function(d) {
  dat <- list(
    B = d$B,
    M = d$M
  )
  # browser()
  m15h5b <- ulam(
    alist(
      B ~ dlnorm(mu, sigma),
      mu <- a + b * log(M),
      a ~ normal(0, 1),
      b ~ normal(0, 1),
      sigma ~ exponential(1)
    ), data=dat, cores=4, chains=4, start=list( B_impute=rep(0.5,56) )
  )
  display_precis(m15h5b, "m15h5b", ar=0.7)
  return(m15h5b)
}

q15h5cc <- function(d) {
  d_cc <- d[complete.cases(d$B),]
  dat <- list(B = d_cc$B, M = d_cc$M)
  m15H4cc <- ulam(
    alist(
      B ~ dlnorm(mu, sigma),
      mu <- a + b * log(M),
      a ~ normal(0, 1),
      b ~ normal(0, 1),
      sigma ~ exponential(1)
    ), data=dat, chains=4, cores=4
  )
  display_precis(m15H4cc, "m15H4cc", 4.0)
  return(m15H4cc)
}

e15h5 <- r"(
There doesn't seem to be any change in the inferences for `a`, `b`, and `sigma`. When you impute
output values, the model isn't really doing anything but posterior predictive inference. We haven't
supplied any new assumptions about what the distribution of `B` should look like, other than what we
know from `M` (which we only learned from complete cases).
)"
q15h5 <- function() {
  d15h5 <- load.d15h5()
  q15h5a(d15h5)
  m15h5b <- q15h5b(d15h5)
  m15H4cc <- q15h5cc(d15h5)
  
  iplot(function() {
    plot(coeftab(m15H4cc, m15h5b), pars=c("a", "b", "sigma"), main="coeftab")
  }, ar=2)
  display_markdown(e15h5)
}
q15h5()
