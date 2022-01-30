source("iplot.R")
library(rethinking)

display_markdown(r"(
**15H4.** Using `data(Primates301)`, consider the relationship between brain volume (`brain`) and
body mass (`body`). These variables are presented as single values for each species. However, there
is always a range of sizes in a species, and some of these measurements are taken from very small
samples. So these values are measured with some unknown error.

We don’t have the raw measurements to work with - that would be best. But we can imagine what might
happen if we had them. Suppose error is proportional to the measurement. This makes sense, because
larger animals have larger variation. As a consequence, the uncertainty is not uniform across the
values and this could mean trouble.

Let’s make up some standard errors for these measurements, to see what might happen. Load the data
and scale the the measurements so the maximum is 1 in both cases:

R code 15.33
```R
library(rethinking)
data(Primates301)
d <- Primates301
cc <- complete.cases( d$brain , d$body )
B <- d$brain[cc]
M <- d$body[cc]
B <- B / max(B)
M <- M / max(M)
```
<br/>

Now I’ll make up some standard errors for $B$ and $M$, assuming error is 10% of the measurement.

R code 15.34
```R
Bse <- B*0.1
Mse <- M*0.1
```
<br/>

Let’s model these variables with this relationship:

$$
B_i \sim LogNormal(\mu_i, \sigma) \\
\mu_i = \alpha + \beta log M_i
$$

This says that brain volume is a log-normal variable, and the mean on the log scale is given by
$\mu$. What this model implies is that the expected value of B is:

$$
E(B_i | M_i) = exp(\alpha)M_i^{\beta}
$$

So this is a standard allometric scaling relationship - incredibly common in biology.

Ignoring measurement error, the corresponding `ulam` model is:

R code 15.35
```R
dat_list <- list( B = B , M = M )
m15H4 <- ulam(
 alist(
  B ~ dlnorm( mu , sigma ),
  mu <- a + b*log(M),
  a ~ normal(0,1),
  b ~ normal(0,1),
  sigma ~ exponential(1)
 ) , data=dat_list )
```
<br/>

Your job is to add the measurement errors to this model. Use the divorce/marriage example in the
chapter as a guide. It might help to initialize the unobserved true values of $B$ and $M$ using the
observed values, by adding a list like this to `ulam`:

R code 15.36
```R
start=list( M_true=dat_list$M , B_true=dat_list$B )
```
<br/>

Compare the inference of the measurement error model to those of `m1.1` above. Has anything changed?
Why or why not?

**ERROR:**

> Compare the inference of the measurement error model to those of `m1.1` above.

The author meant `m15H4`.

**Solution.** The math is a bit fuzzy for the allometric relationship. The mean of a LogNormal
random variable is:

$$
E[X] = exp(\mu + \sigma^2/2)
$$

The author seems to be ignoring the $\sigma^2/2$ term. If you accept that 'simplification' you can
get the second equation he presents with:

$$
\begin{align}
E(B_i|M_i) & = exp(\mu_i) \\
& = exp(\alpha + \beta \cdot log(M_i)) \\
& = e^{\alpha} e^{log(M_i) \cdot \beta} \\
& = e^{\alpha} M_i^{\beta}
\end{align}
$$
)")


load.d.15.h4 <- function() {
  data(Primates301)
  d <- Primates301
  cc <- complete.cases( d$brain , d$body )
  B <- d$brain[cc]
  M <- d$body[cc]
  B <- B / max(B)
  M <- M / max(M)
  
  Bse <- B*0.1
  Mse <- M*0.1

  d.15.h4 <- data.frame(B=B, M=M, Bse=Bse, Mse=Mse)
  return(d.15.h4)
}
d.15.h4 <- load.d.15.h4()

q.15.h4.a <- function(d) {
  dat_list <- list(B = d$B, M = d$M)
  m15H4 <- ulam(
    alist(
      B ~ dlnorm(mu, sigma),
      mu <- a + b * log(M),
      a ~ normal(0, 1),
      b ~ normal(0, 1),
      sigma ~ exponential(1)
    ), data=dat_list, chains=4, cores=4
  )
  display_precis(m15H4, "m15H4", 4.0)
  return(m15H4)
}
m15H4 <- q.15.h4.a(d.15.h4)

q.15.h4.b <- function(d) {
  dat_list <- list(
    B_obs = d$B,
    M_obs = d$M,
    B_sd = d$Bse,
    M_sd = d$Mse,
    N_obs = nrow(d)
  )
  m.15.h4.b <- ulam(
    alist(
      B_obs ~ dnorm(B_true, B_sd),
      vector[N_obs]:B_true ~ dlnorm(mu, sigma),
      mu <- a + b * log(M_true[i]),
      M_obs ~ dnorm(M_true, M_sd),
      vector[N_obs]:M_true ~ dexp(1),
      a ~ normal(0, 1),
      b ~ normal(0, 1),
      sigma ~ exponential(1)
    ), data=dat_list, chains=4, cores=4, log_lik=TRUE
  )
  display_precis(m.15.h4.b, "m.15.h4.b", 0.2)
  return(m.15.h4.b)
}
m.15.h4.b <- q.15.h4.b(d.15.h4)

# iplot_coeftab <- function(..., pars, ar, main="coeftab") {
#   iplot(function() {
#     plot(coeftab(...), pars=pars, main=main)
#   }, ar=ar)
# }
# iplot_coeftab(m15H4, m.15.h4.b, pars=c("a", "b", "sigma"), ar=2.0)
iplot(function() {
  plot(coeftab(m15H4, m.15.h4.b), pars=c("a", "b", "sigma"), main="coeftab")
}, ar=2)

display_markdown(r"(
Little has changed with the update. It looks like `sigma` is slightly smaller, perhaps because more
uncertainty in the data has naturally led to more confidence in the model.
)")
