source("iplot.R")
library(rethinking)

display_markdown(r"(
**15H3.** The fact that information flows in all directions among parameters sometimes leads to
rather unintuitive conclusions. Here’s an example from missing data imputation, in which imputation
of a single datum reverses the direction of an inferred relationship. Use these data:

R code 15.32
```
set.seed(100)
x <- c( rnorm(10) , NA )
y <- c( rnorm(10,x) , 100 )
d <- list(x=x,y=y)
```
<br/>

These data comprise 11 cases, one of which has a missing predictor value. You can quickly confirm
that a regression of `y` on `x` for only the complete cases indicates a strong positive relationship
between the two variables. But now fit this model, imputing the one missing value for `x`:

$$
\begin{align}
y_i & \sim Normal(\mu_i, \sigma) \\
\mu_i & = \alpha + \beta x_i \\
x_i & \sim Normal(0, 1) \\
\alpha & \sim Normal(0, 100) \\
\beta & \sim Normal(0, 100) \\
\sigma & \sim Normal(1)
\end{align}
$$

Be sure to run multiple chains. What happens to the posterior distribution of $\beta$? Be sure to
inspect the full density. Can you explain the change in inference?

**ERROR:** The last line of the model should be:
$$
\sigma \sim Exponential(1)
$$

**Answer.** The list `d` produced by R code 15.32:
)")

r.code.15.32 <- function() {
  set.seed(100)
  x <- c(rnorm(10), NA)
  y <- c(rnorm(10, x), 100)
  d <- list(x = x, y = y)
  display(d)
  return(data.frame(d))
}
d.15.h3 <- r.code.15.32()

display_markdown(r"(
Fitting a model to complete cases, using the same model in the question minus the $x_i$ prior:
)")

q.15.h3.a <- function(d) {
  d_cc <- d[complete.cases(d$x),]
  dat <- list(
    Y = d_cc$y,
    X = d_cc$x
  )
  m15.h3.a <- ulam(
    alist(
      Y ~ dnorm(mu, sigma),
      mu <- a + b*X,
      c(a, b) ~ dnorm(0, 1),
      sigma ~ dnorm(0, 1)
    ), data=dat, cores=4, chains=4, log_lik=TRUE
  )
  display_precis(m15.h3.a, "m15.h3.a", 4.5)
  return(m15.h3.a)
}
m15.h3.a <- q.15.h3.a(d.15.h3)

display_markdown(r"(
Fitting a model to all the data, with the imputation model suggested in the question:
)")

q.15.h3.b <- function(d) {
  dat <- list(
    Y = d$y,
    X = d$x
  )
  m15.h3.b <- ulam(
    alist(
      Y ~ dnorm(mu, sigma),
      mu <- a + b*X,
      X ~ dnorm(0, 1),
      c(a, b) ~ dnorm(0, 1),
      sigma ~ dexp(1)
    ), data=dat, cores=4, chains=4, log_lik=TRUE
  )
  display_precis(m15.h3.b, "m15.h3.b", 4.0)
  return(m15.h3.b)
}
m15.h3.b <- q.15.h3.b(d.15.h3)

display_markdown(r"(
Notice the model has imputed a value near zero for the single missing value. This point is extremely
influential because of the large value of `y` associated with it (the `100`) so it dominates the
inference results. A value of zero associated with `100` implies almost no relationship between `x`
and `y` so the model infers that `sigma` is large instead.
)")
