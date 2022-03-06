---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.5
kernelspec:
  display_name: R
  language: R
  name: ir
---

# Practice: Chp. 14

```{code-cell} r
source("iplot.R")
suppressPackageStartupMessages(library(rethinking))
```

**14E1.** Add to the following model varying slopes on the predictor *x*.

$$
\begin{align}
y_i & \sim Normal(\mu_i, \sigma) \\
\mu_i & = \alpha_{GROUP[i]} + \beta x_i \\
\alpha_{GROUP} & \sim Normal(\alpha, \sigma_{\alpha}) \\
\alpha & \sim Normal(0, 10) \\
\beta & \sim Normal(0, 1) \\
\sigma & \sim Exponential(1) \\
\sigma_{\alpha} & \sim Exponential(1)
\end{align}
$$

**Answer.** See section **14.1.3**. Notice the distinction of $i$ and $j$ indexes.

$$
\begin{align}
y_i & \sim Normal(\mu_i, \sigma) \\
\mu_i & = \alpha_{GROUP[j]} + \beta_{GROUP[j]} x_i \\
\begin{bmatrix}
\alpha_{GROUP} \\
\beta_{GROUP}
\end{bmatrix}
& \sim
MVNormal(
\begin{bmatrix}
\alpha \\
\beta
\end{bmatrix}
, \mathbf{S}) \\
\alpha & \sim Normal(0, 10) \\
\beta & \sim Normal(0, 1) \\
\mathbf{S} & =
\begin{pmatrix}
\sigma_{\alpha} & 0 \\
0 & \sigma_{\beta}
\end{pmatrix}
\mathbf{R}
\begin{pmatrix}
\sigma_{\alpha} & 0 \\
0 & \sigma_{\beta}
\end{pmatrix} \\
\sigma_{\alpha} & \sim Exponential(1) \\
\sigma_{\beta} & \sim Exponential(1)
\end{align}
$$

**14E2.** Think up a context in which varying intercepts will be positively correlated with varying
slopes. Provide a mechanistic explanation for the correlation.

**Answer.** If you believe that education leads to greater wealth, then in the prediction of wealth
based on parent's wealth. If you come from family with a lot of money you'll start off with a lot of
money (the intercept), and because wealth builds on wealth the addition of education will help more
than for someone who doesn't have as many resources to work with to start (the slope). You could
replace education with ambition or something else along that theme, as well.

We could also adapt the cafe example to use an `M` indicator (for morning) rather than an `A`
indicator for afternoon. The intercepts would have to become the afternoon wait. Long afternoon
waits are correlated with even longer morning waits.

**14E3.** When is it possible for a varying slopes model to have fewer effective parameters (as
estimated by WAIC or PSIS) than the corresponding model with fixed (unpooled) slopes? Explain.

**Answer.** When there is some relationship between the intercepts and slopes that helps the model
regularize itself. That is, if there is some correlation between intercepts and slopes, the model
should be able to detect this and effectively learn to predict intercepts from slopes, and vice
versa. This is similar to how in an intercepts-only multilevel model knowing some intercepts should
help the model predict other intercepts; the known intercepts are a regularizing prior for new
intercepts.

**14M1.** Repeat the café robot simulation from the beginning of the chapter. This time, set `rho`
to zero, so that there is no correlation between intercepts and slopes. How does the posterior
distribution of the correlation reflect this change in the underlying simulation?

**Answer.** Rerun the simulation:

```{code-cell} r
a <- 3.5 # average morning wait time
b <- (-1) # average difference afternoon wait time
sigma_a <- 1 # std dev in intercepts
sigma_b <- 0.5 # std dev in slopes
rho <- (-0.0) # correlation between intercepts and slopes

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

iplot(function() {
  plot(a_cafe, b_cafe,
    col = rangi2,
    xlab = "intercepts (a_cafe)", ylab = "slopes (b_cafe)",
    main = "Figure 14.2 (updated simulation)"
  )

  library(ellipse)
  for (l in c(0.1, 0.3, 0.5, 0.8, 0.99)) {
    lines(ellipse(Sigma, centre = Mu, level = l), col = col.alpha("black", 0.2))
  }
})

set.seed(22)
N_visits <- 10
afternoon <- rep(0:1, N_visits * N_cafes / 2)
cafe_id <- rep(1:N_cafes, each = N_visits)
mu <- a_cafe[cafe_id] + b_cafe[cafe_id] * afternoon
sigma <- 0.5 # std dev within cafes
wait <- rnorm(N_visits * N_cafes, mu, sigma)
d <- data.frame(cafe = cafe_id, afternoon = afternoon, wait = wait)
```

Refit the model:

```{code-cell} r
set.seed(867530)
m_cafe_rho_zero <- ulam(
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
  data = d, chains = 4, cores = 4
)
display(precis(m_cafe_rho_zero, depth = 3), mimetypes="text/plain")

post <- extract.samples(m_cafe_rho_zero) # posterior
R <- rlkjcorr(1e4, K = 2, eta = 2) # prior

iplot(function() {
  dens(post$Rho[, 1, 2], xlim = c(-1, 1))
  dens(R[, 1, 2], add = TRUE, lty = 2)
})
```

The model has inferred `rho` is zero, as expected.

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

```{code-cell} r
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
```

**Answer.** A `compare` plot with its associated raw data:

```{code-cell} r
iplot(function() {
  plot(compare(m14.1, m_cafe_separate_variation))
}, ar=4.5)
display_markdown("Raw data (preceding plot):")
display(compare(m14.1, m_cafe_separate_variation), mimetypes="text/plain")
```

The new model fits the training data worse (as expected, having fewer parameters). It doesn't make
up for this in the penalty term, though, because it also does less parameter sharing.

**14M3.** Re-estimate the varying slopes model for the `UCBadmit` data, now using a non-centered
parameterization. Compare the efficiency of the forms of the model, using n_eff. Which is better?
Which chain sampled faster?

**ERROR.** There is no varying slopes model for `UCBadmit` data. This is the first chapter on
varying slopes, and no model in this chapter is based on that dataset.

It's likely the non-centered parameterization does better, if we had what model the author is
referring to.
