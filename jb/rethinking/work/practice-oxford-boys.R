source("iplot.R")
library(rethinking)

display_markdown(r"(
**14H4.** Varying effects models are useful for modeling time series, as well as spatial clustering.
In a time series, the observations cluster by entities that have continuity through time, such as
individuals. Since observations within individuals are likely highly correlated, the multilevel
structure can help quite a lot. You’ll use the data in `data(Oxboys)`, which is 234 height
measurements on 26 boys from an Oxford Boys Club (I think these were like youth athletic leagues?),
at 9 different ages (centered and standardized) per boy. You’ll be interested in predicting
`height`, using `age`, clustered by `Subject` (individual boy). Fit a model with varying intercepts
and slopes (on age), clustered by `Subject`. Present and interpret the parameter estimates. Which
varying effect contributes more variation to the heights, the intercept or the slope?
)")

data(Oxboys)
ox <- Oxboys

display_markdown(r"(
**Answer.** A `head` and `summary` of the `Oxboys` data.frame (no `help` exists):
)")
display(head(ox))
display(summary(ox))

display_markdown(r"(
<br/>
Fitting the model:
)")

ox_dat <- list(
  Subject = ox$Subject,
  Age = ox$age,
  Height = ox$height
)
m_ox <- ulam(
  alist(
    Height ~ dnorm(mu, sigma),
    mu <- a_boy[Subject] + b_boy[Subject] * Age,
    c(a_boy, b_boy)[Subject] ~ multi_normal(c(a, b), Rho, sigma_intercepts_slopes),
    a ~ normal(0, 1),
    b ~ normal(0, 0.5),
    sigma_intercepts_slopes ~ exponential(1),
    Rho ~ lkj_corr(2),
    sigma ~ normal(0, 2)
  ),
  data = ox_dat, chains = 4, cores = 4, log_lik = TRUE
)
display(precis(m_ox, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m_ox, depth=3), main="m_ox")
}, ar=0.7)

display_markdown(r"(
The intercepts term contributes much more to the heights than the slopes. Notice the `b_boy` terms
are the maximum that the slopes can contribute to `mu` since `Age` is at most equal one.
)")

display_markdown(r"(
<br/>
**14H5.** Now consider the correlation between the varying intercepts and slopes. Can you explain
its value? How would this estimated correlation influence your predictions about a new sample of
boys?

**Answer.** The correlation is positive, because more positive intercepts are associated with more
positive slopes. That is, boys who are on average taller also grow faster.
)")

display_markdown(r"(
**14H6.** Use `mvrnorm` (in `library(MASS)`) or `rmvnorm` (in `library(mvtnorm)`) to simulate a new
sample of boys, based upon the posterior mean values of the parameters. That is, try to simulate
varying intercepts and slopes, using the relevant parameter estimates, and then plot the predicted
trends of height on age, one trend for each simulated boy you produce. A sample of 10 simulated boys
is plenty, to illustrate the lesson. You can ignore uncertainty in the posterior, just to make the
problem a little easier. But if you want to include the uncertainty about the parameters, go for it.
Note that you can construct an arbitrary variance-covariance matrix to pass to either `mvrnorm` or
`rmvnorm` with something like:

R code 14.54

```R
S <- matrix( c( sa^2 , sa*sb*rho , sa*sb*rho , sb^2 ) , nrow=2 )
```
<br/>

where `sa` is the standard deviation of the first variable, `sb` is the standard deviation of the
second variable, and `rho` is the correlation between them.

**Answer.** The expected plot:
)")

post <- extract.samples(m_ox)
Mu_est <- c(mean(post$a), mean(post$b))
rho_est <- mean(post$Rho[,1,2])
sa_est <- mean(post$sigma_intercepts_slopes[,1])
sb_est <- mean(post$sigma_intercepts_slopes[,2])
cov_ab <- sa_est*sb_est*rho_est
Sigma_est <- matrix(c(sa_est^2, cov_ab, cov_ab, sb_est^2), nrow=2)

library(MASS)
set.seed(5)
N_boys <- 10
vary_effects <- mvrnorm(N_boys, Mu_est, Sigma_est)

iplot(function() {
  plot(NULL, main="Posterior predictive plot, 10 simulated boys",
    xlab="age", ylab="height",
    xlim=c(-1.1, 1.1),
    ylim=c(min(vary_effects[,1] - vary_effects[,2]) - 10, max(vary_effects[,1] + vary_effects[,2]) + 10)
  )
  for (idx in 1:N_boys)
    abline(a=vary_effects[idx, 1], b=vary_effects[idx, 2])
})

display_markdown(r"(
The lesson here is that vague priors can kill predictive power, and that in situations like this one
the priors have a strong influence on the results. In the previous plot the priors on `a` and `b`
were copied and pasted from another model:

$$
\begin{align}
a & \sim Normal(0, 1) \\
b & \sim Normal(0, 0.5)
\end{align}
$$

These are clearly unreasonable. If we fix these priors we get a much better result:

$$
\begin{align}
a & \sim Normal(150, 40) \\
b & \sim Normal(40, 40)
\end{align}
$$
)")

m_ox2 <- ulam(
  alist(
    Height ~ dnorm(mu, sigma),
    mu <- a_boy[Subject] + b_boy[Subject] * Age,
    c(a_boy, b_boy)[Subject] ~ multi_normal(c(a, b), Rho, sigma_intercepts_slopes),
    a ~ normal(150, 40),
    b ~ normal(40, 40),
    sigma_intercepts_slopes ~ exponential(1),
    Rho ~ lkj_corr(2),
    sigma ~ normal(0, 2)
  ),
  data = ox_dat, chains = 4, cores = 4, log_lik = TRUE
)
display(precis(m_ox2, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m_ox2, depth=3), main="m_ox2")
}, ar=0.7)

post <- extract.samples(m_ox2)
Mu_est <- c(mean(post$a), mean(post$b))
rho_est <- mean(post$Rho[,1,2])
sa_est <- mean(post$sigma_intercepts_slopes[,1])
sb_est <- mean(post$sigma_intercepts_slopes[,2])
cov_ab <- sa_est*sb_est*rho_est
Sigma_est <- matrix(c(sa_est^2, cov_ab, cov_ab, sb_est^2), nrow=2)

library(MASS)
set.seed(5)
N_boys <- 10
vary_effects <- mvrnorm(N_boys, Mu_est, Sigma_est)

iplot(function() {
  plot(NULL, main="Posterior predictive plot, 10 simulated boys",
    xlab="age", ylab="height",
    xlim=c(-1.1, 1.1),
    ylim=c(min(vary_effects[,1] - vary_effects[,2]) - 10, max(vary_effects[,1] + vary_effects[,2]) + 10)
  )
  for (idx in 1:N_boys)
    abline(a=vary_effects[idx, 1], b=vary_effects[idx, 2])
})
