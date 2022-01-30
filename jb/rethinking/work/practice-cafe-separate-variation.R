source("iplot.R")
library(rethinking)

display_markdown(r"(
**14M2.** Fit this multilevel model to the simulated café data:

$$
\begin{align}
W_i & \sim Normal(\mu_i, \sigma) \\
\mu_i & = \alpha_{CAFE[j]} + \beta_{CAFE[j]} A_i \\
\alpha_{CAFE} & \sim Normal(\alpha, \sigma_{\alpha}) \\
\beta_{CAFE} & \sim Normal(\beta, \sigma_{\beta}) \\
\alpha & \sim Normal(0, 10) \\
\sigma, \sigma_{\alpha}, \sigma_{\beta} & \sim Exponential(1)
\end{align}
$$

Use WAIC to compare this model to the model from the chapter, the one that uses a multi-variate
Gaussian prior. Explain the result.
)")

a <- 3.5 # average morning wait time
b <- (-1) # average difference afternoon wait time
sigma_a <- 1 # std dev in intercepts
sigma_b <- 0.5 # std dev in slopes
rho <- (-0.7) # correlation between intercepts and slopes

Mu <- c(a, b)

sigmas <- c(sigma_a, sigma_b) # standard deviations
Rho <- matrix(c(1, rho, rho, 1), nrow = 2) # correlation matrix
Sigma <- diag(sigmas) %*% Rho %*% diag(sigmas)

N_cafes <- 20

library(MASS)
set.seed(5) # used to replicate example
vary_effects <- mvrnorm(N_cafes, Mu, Sigma)

a_cafe <- vary_effects[, 1]
b_cafe <- vary_effects[, 2]

set.seed(22)
N_visits <- 10
afternoon <- rep(0:1, N_visits * N_cafes / 2)
cafe_id <- rep(1:N_cafes, each = N_visits)
mu <- a_cafe[cafe_id] + b_cafe[cafe_id] * afternoon
sigma <- 0.5 # std dev within cafes
wait <- rnorm(N_visits * N_cafes, mu, sigma)
d <- data.frame(cafe = cafe_id, afternoon = afternoon, wait = wait)

m_cafe_separate_variation <- ulam(
  alist(
    wait ~ normal(mu, sigma),
    mu <- a_cafe[cafe] + b_cafe[cafe] * afternoon,
    a_cafe[cafe] ~ normal(a, sigma_a),
    b_cafe[cafe] ~ normal(b, sigma_b),
    a ~ normal(5, 2),
    b ~ normal(-1, 0.5),
    sigma ~ exponential(1),
    sigma_a ~ exponential(1),
    sigma_b ~ exponential(1)
  ),
  data = d, chains = 4, cores = 4, log_lik = TRUE
)

m14.1 <- ulam(
  alist(
    wait ~ normal(mu, sigma),
    mu <- a_cafe[cafe] + b_cafe[cafe] * afternoon,
    c(a_cafe, b_cafe)[cafe] ~ multi_normal(c(a, b), Rho, sigma_cafe),
    a ~ normal(5, 2),
    b ~ normal(-1, 0.5),
    sigma_cafe ~ exponential(1),
    sigma ~ exponential(1),
    Rho ~ lkj_corr(2)
  ),
  data = d, chains = 4, cores = 4, log_lik = TRUE
)

display_markdown(r"(
**Answer.** A `compare` plot with its associated raw data:
)")

iplot(function() {
  plot(compare(m14.1, m_cafe_separate_variation))
}, ar=4.5)
display_markdown("Raw data (preceding plot):")
display(compare(m14.1, m_cafe_separate_variation), mimetypes="text/plain")

display_markdown(r"(
<br/>

The new model fits the training data worse (as expected, having fewer parameters). It doesn't make
up for this in the penalty term, though, because it also does less parameter sharing.
)")
