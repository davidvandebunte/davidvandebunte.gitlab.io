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

**14M4.** Use WAIC to compare the Gaussian process model of Oceanic tools to the models fit to the
same data in Chapter 11. Pay special attention to the effective numbers of parameters, as estimated
by WAIC.

**Answer.** Let's reproduce results from the two chapters:

```{code-cell} r
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
```

A `compare` plot with its associated raw data:

```{code-cell} r
iplot(function() {
  plot(compare(m11.9, m11.10, m11.11, m14.8))
}, ar=4.5)
display_markdown("Raw data (preceding plot):")
display(compare(m11.9, m11.10, m11.11, m14.8), mimetypes="text/plain")
```

The new model does better overall relative to `m11.1` because it presumably has a more accurate
method of estimating the contact between islands. See the first section of **14.5.1** for how the
new model improves upon the old low/high contact indicator.

The new model also has the lowest penalty term (effective number of parameters). Notice in the
`precis` output above it has 10 intercept terms, and 5 other terms. This is much more than the 5
parameters in `m11.1`, also above. It achieves this relative to `m11.1` because of the significant
regularization provided by parameter sharing.

**14M5.** Modify the phylogenetic distance example to use group size as the outcome and brain size
as a predictor. Assuming brain size influences group size, what is your estimate of the effect? How
does phylogeny influence the estimate?

**Answer.** First, let's reproduce the results from the chapter:

```{code-cell} r
data(Primates301)
data(Primates301_nex)

d <- Primates301
d$name <- as.character(d$name)
dstan <- d[complete.cases(d$group_size, d$body, d$brain), ]
spp_obs <- dstan$name

dat_list <- list(
  N_spp = nrow(dstan),
  M = standardize(log(dstan$body)),
  B = standardize(log(dstan$brain)),
  G = standardize(log(dstan$group_size)),
  Imat = diag(nrow(dstan))
)
m14.9 <- ulam(
  alist(
    B ~ multi_normal(mu, SIGMA),
    mu <- a + bM * M + bG * G,
    matrix[N_spp, N_spp]:SIGMA <- Imat * sigma_sq,
    a ~ normal(0, 1),
    c(bM, bG) ~ normal(0, 0.5),
    sigma_sq ~ exponential(1)
  ),
  data = dat_list, chains = 4, cores = 4
)
display(precis(m14.9, depth=2), mimetypes="text/plain")

library(ape)
tree_trimmed <- keep.tip(Primates301_nex, spp_obs)
Rbm <- corBrownian(phy = tree_trimmed)
V <- vcv(Rbm)

# put species in right order
dat_list$V <- V[spp_obs, spp_obs]
# convert to correlation matrix
dat_list$R <- dat_list$V / max(V)

m14.10 <- ulam(
  alist(
    B ~ multi_normal(mu, SIGMA),
    mu <- a + bM * M + bG * G,
    matrix[N_spp, N_spp]:SIGMA <- R * sigma_sq,
    a ~ normal(0, 1),
    c(bM, bG) ~ normal(0, 0.5),
    sigma_sq ~ exponential(1)
  ),
  data = dat_list, chains = 4, cores = 4
)
display(precis(m14.10, depth=2), mimetypes="text/plain")

Dmat <- cophenetic(tree_trimmed)
# add scaled and reordered distance matrix
dat_list$Dmat <- Dmat[spp_obs, spp_obs] / max(Dmat)

m14.11 <- ulam(
  alist(
    B ~ multi_normal(mu, SIGMA),
    mu <- a + bM * M + bG * G,
    matrix[N_spp, N_spp]:SIGMA <- cov_GPL1(Dmat, etasq, rhosq, 0.01),
    a ~ normal(0, 1),
    c(bM, bG) ~ normal(0, 0.5),
    etasq ~ half_normal(1, 0.25),
    rhosq ~ half_normal(3, 0.25)
  ),
  data = dat_list, chains = 4, cores = 4
)
display(precis(m14.11, depth=2), mimetypes="text/plain")
```

Reversing the prediction problem:

```{code-cell} r
dat_list <- list(
  N_spp = nrow(dstan),
  M = standardize(log(dstan$body)),
  B = standardize(log(dstan$brain)),
  G = standardize(log(dstan$group_size)),
  Imat = diag(nrow(dstan))
)
m14.9_reversed <- ulam(
  alist(
    G ~ multi_normal(mu, SIGMA),
    mu <- a + bM * M + bB * B,
    matrix[N_spp, N_spp]:SIGMA <- Imat * sigma_sq,
    a ~ normal(0, 1),
    c(bM, bB) ~ normal(0, 0.5),
    sigma_sq ~ exponential(1)
  ),
  data = dat_list, chains = 4, cores = 4
)
display(precis(m14.9_reversed, depth=2), mimetypes="text/plain")

# put species in right order
dat_list$V <- V[spp_obs, spp_obs]
# convert to correlation matrix
dat_list$R <- dat_list$V / max(V)

m14.10_reversed <- ulam(
  alist(
    G ~ multi_normal(mu, SIGMA),
    mu <- a + bM * M + bB * B,
    matrix[N_spp, N_spp]:SIGMA <- R * sigma_sq,
    a ~ normal(0, 1),
    c(bM, bB) ~ normal(0, 0.5),
    sigma_sq ~ exponential(1)
  ),
  data = dat_list, chains = 4, cores = 4
)
display(precis(m14.10_reversed, depth=2), mimetypes="text/plain")

# add scaled and reordered distance matrix
dat_list$Dmat <- Dmat[spp_obs, spp_obs] / max(Dmat)

m14.11_reversed <- ulam(
  alist(
    G ~ multi_normal(mu, SIGMA),
    mu <- a + bM * M + bB * B,
    matrix[N_spp, N_spp]:SIGMA <- cov_GPL1(Dmat, etasq, rhosq, 0.01),
    a ~ normal(0, 1),
    c(bM, bB) ~ normal(0, 0.5),
    etasq ~ half_normal(1, 0.25),
    rhosq ~ half_normal(3, 0.25)
  ),
  data = dat_list, chains = 4, cores = 4
)
display(precis(m14.11_reversed, depth=2), mimetypes="text/plain")
```

Interestingly, the ordinary regression model makes an even more extreme prediction about how group
size influences brain size than the reverse. Still, the uncertainties are large.

The addition of phylogeny once again removes the presumed effect. The uncertainties are so large in
these latter two models that they really say almost nothing about an association.

**14H1.** Let’s revisit the Bangladesh fertility data, `data(bangladesh)`, from the practice
problems for Chapter 13. Fit a model with both varying intercepts by `district_id` and varying
slopes of `urban` by `district_id`. You are still predicting `use.contraception`. Inspect the
correlation between the intercepts and slopes. Can you interpret this correlation, in terms of what
it tells you about the pattern of contraceptive use in the sample? It might help to plot the mean
(or median) varying effect estimates for both the intercepts and slopes, by district. Then you can
visualize the correlation and maybe more easily think through what it means to have a particular
correlation. Plotting predicted proportion of women using contraception, with urban women on one
axis and rural on the other, might also help.

**Answer.** To review, the `help` for the `bangladesh` data.frame:

```{code-cell} r
data(bangladesh)
display(help(bangladesh))

bc_df <- bangladesh
bc_df$district_id <- as.integer(as.factor(bc_df$district))
```

A `head` and `summary` of the `bangladesh` data.frame, with the new variable suggested by the author
in question 13H1:

```{code-cell} r
display(head(bc_df))
display(summary(bc_df))
```

Sampling from the varying intercepts model:

```{code-cell} r
# If you want to reproduce results from the previous chapter:
#
# bc_dat <- list(
#   UseContraception = bc_df$use.contraception,
#   DistrictId = bc_df$district_id
# )
# m_bc_ve <- ulam(
#   alist(
#     UseContraception ~ dbinom(1, p),
#     logit(p) <- a[DistrictId],
#     a[DistrictId] ~ dnorm(a_bar, sigma),
#     a_bar ~ dnorm(0, 1.5),
#     sigma ~ dexp(1)
#   ),
#   data = bc_dat, chains = 4, cores = 4, log_lik = TRUE
# )

bc_dat <- list(
  UseContraception = bc_df$use.contraception,
  DistrictId = bc_df$district_id,
  Urban = bc_df$urban
)
m_bc_vis <- ulam(
  alist(
    UseContraception ~ dbinom(1, p),
    logit(p) <- a_district[DistrictId] + b_district[DistrictId] * Urban,
    c(a_district, b_district)[DistrictId] ~ multi_normal(c(a, b), Rho, sigma_intercepts_slopes),
    a ~ normal(0, 2),
    b ~ normal(0, 0.5),
    sigma_intercepts_slopes ~ exponential(1),
    Rho ~ lkj_corr(2)
  ),
  data = bc_dat, chains = 4, cores = 4, log_lik = TRUE
)
display(precis(m_bc_vis, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m_bc_vis, depth=3), main="m_bc_vis")
}, ar=0.4)

post <- extract.samples(m_bc_vis) # posterior
R <- rlkjcorr(1e4, K = 2, eta = 2) # prior

iplot(function() {
  dens(post$Rho[, 1, 2], xlim = c(-1, 1))
  dens(R[, 1, 2], add = TRUE, lty = 2)
})
```

Not surprisingly, the `b` slope parameter and most of the `b_district` are positive. Normally,
living in an urban area makes one more open to ideas like contraception. The `a` parameters are
likely negative because in general many women do not use contraception.

The correlation is negative, because `a` is typically negative and `b` is typically positive. It is
also relatively large in absolute magnitude, implying that a more negative intercept is associated
with a more positive slope (and vice versa). We can see this in a plot of mean intercepts vs. mean
slopes:

```{code-cell} r
iplot(function() {
  post <- extract.samples(m_bc_vis)
  a2 <- apply(post$a_district, 2, mean)
  b2 <- apply(post$b_district, 2, mean)

  plot(a2, b2,
    xlab = "intercept", ylab = "slope",
    pch = 1, col = rangi2, ylim = c(min(b2) - 0.1, max(b2) + 0.1),
    xlim = c(min(a2) - 0.1, max(a2) + 0.1)
  )

  Mu_est <- c(mean(post$a), mean(post$b))
  rho_est <- mean(post$Rho[, 1, 2])
  sa_est <- mean(post$sigma_intercepts_slopes[, 1])
  sb_est <- mean(post$sigma_intercepts_slopes[, 2])
  cov_ab <- sa_est * sb_est * rho_est
  Sigma_est <- matrix(c(sa_est^2, cov_ab, cov_ab, sb_est^2), ncol = 2)
  library(ellipse)
  for (l in c(0.1, 0.3, 0.5, 0.8, 0.99)) {
    lines(ellipse(Sigma_est, centre = Mu_est, level = l),
      col = col.alpha("black", 0.2)
    )
  }
})
```

This is a similar relationship to what we saw in the cafe example at the start of the chapter; more
extreme intercepts (cafes, districts) are associated with more extreme slopes. In this case the
districts with especially low contraceptive use are associated with a greater increase in use when a
woman 'moves' to an urban area within the district.

**14H2.** Now consider the predictor variables `age.centered` and `living.children`, also contained
in `data(bangladesh)`. Suppose that age influences contraceptive use (changing attitudes) and number
of children (older people have had more time to have kids). Number of children may also directly
influence contraceptive use. Draw a DAG that reflects these hypothetical relationships. Then build
models needed to evaluate the DAG. You will need at least two models. Retain `district` and `urban`,
as in 14H1. What do you conclude about the causal influence of age and children?

**Answer.**
[cc]: https://en.wikipedia.org/wiki/Counterfactual_conditional

Consider the following causal diagram. Is this diagram reasonable? The author asked us to only
consider this one DAG, but it's worth thinking whether it's reasonable so we know what to expect
from our inferences.

The `Age` variable only has arrows pointing out of it. As discussed elsewhere (see question 12H7),
this is the only way we should put time-based variables on DAGs. We can think about `Age` as
describing the timing of someone's birth. In terms of a [counterfactual conditional][cc], we would
say that if a woman had been born e.g. 10 years earlier she would not have used contraception. A
counterfactual conditional like this describes a causal theory, but expressed regarding the past.
Casual theories should still be tested, when possible, by actively controlling a variable in the
future. In this case we won't be able to test the theory in the future (as well as the past) because
we can't control the date of anyone's birth, unless we ran an experiment with identical twins where
we somehow froze the zygote of one twin in time for years. We'll include a description of all
existing and potential arrows in this DAG as counterfactual conditionals below.

It's reasonable to think that `Age` could affect `Urban`. More people are moving to cities every
year across the world, for jobs, and so in general we'd expect younger women to be living in cities.
That is, if a woman was born later she would be more likely to be urban.

It's possible that `Age` could affect `District` if there was a people migration happening across
the country at one point in the past and slightly older women were less likely to move. That is, if
a woman was born later she could be living in a different district.

Some districts could be more urbanized and therefore `District` could predict `Urban`, and vice
versa. That is, if a woman was living in a different district she could be more likely to be urban.
If a woman was not in an urban area she would be more likely to be in a different district.

Some districts might have governmental programs or tax incentives to encourage or discourage
children, implying a relationship between `District` and `Children` mediated by the program. This
would confound our causal inference about the effect of `Children` on `UseContraception` if we
didn't include `District` in our model. Similarly, for urban programs encouraging or discouraging
children. If a woman was living in a different district, she may have had more or fewer children.

It's also likely that women move to more rural areas for e.g. cheaper housing when they have more
children, or to districts with cheaper housing and costs of living. That is, a woman had fewer
children, she may be living in a less urban area or in general somewhere else.

Like the controversy over global warming in the United States, there are often many possible
confounds we can suggest to make a DAG more complicated. It can be hard to decide which need to be
included in every model without getting into a lot of details.

In this question we are predicting `UseContraception` from `Children` but we'd typically think of
the opposite causal path: contraception clearly influences the number of children a woman will have.
In this case, we are essentially assuming that the number of children a woman has in the present
influences her present decision to use contraception. In general, though, these variables interact,
so we have to look at the casual paths similar as a causal time series similar to how the author
treated the causal influence of group size on brain size at the beginning of section **14.5.2**. Our
causal inferences here will only apply to the point in time when these surveys were taken.

We'll ignore all of this. The DAG expected by the question:

```{code-cell} r
library(dagitty)

expected_dag <- dagitty('
dag {
    bb="0,0,1,1"
    Age [pos="0.3,0.1"]
    Children [exposure,pos="0.5,0.1"]
    District [pos="0.65,0.2"]
    Urban [pos="0.65,0.1"]
    UseContraception [outcome,pos="0.4,0.2"]
    Age -> Children
    Age -> UseContraception
    Children -> UseContraception
    District -> UseContraception
    Urban -> UseContraception
}')
iplot(function() plot(expected_dag), scale=10)
```

Implied conditional independencies:

```{code-cell} r
display(impliedConditionalIndependencies(expected_dag))
```

We will build two models, as the question suggests. The first will include both predictors, so we
can infer the direct/total causal effect of children on `UseContraception`:

```{code-cell} r
display(adjustmentSets(expected_dag, exposure="Children", outcome="UseContraception", effect="direct"))
display(adjustmentSets(expected_dag, exposure="Children", outcome="UseContraception", effect="total"))
```

The first model will also predict the direct effect of `Age` on `UseContraception`:

```{code-cell} r
display(adjustmentSets(expected_dag, exposure="Age", outcome="UseContraception", effect="direct"))
```

The second will include only `Age` so we can infer the total causal effect of `Age` on
`UseContraception`:

```{code-cell} r
display(adjustmentSets(expected_dag, exposure="Age", outcome="UseContraception", effect="total"))
```

Fitting the first model:

```{code-cell} r
data(bangladesh)
bc_df <- bangladesh
bc_df$district_id <- as.integer(as.factor(bc_df$district))

bc_dat <- list(
  UseContraception = bc_df$use.contraception,
  DistrictId = bc_df$district_id,
  Urban = bc_df$urban,
  Age = standardize(bc_df$age.centered),
  Children = bc_df$living.children
)
m_bc_age_children <- ulam(
  alist(
    UseContraception ~ dbinom(1, p),
    logit(p) <- a_district[DistrictId] + b_district[DistrictId] * Urban + bAge * Age +
a_children[Children],
    c(a_district, b_district)[DistrictId] ~ multi_normal(c(a, b), Rho, sigma_intercepts_slopes),
    a_children[Children] ~ normal(0, 1),
    a ~ normal(0, 2),
    b ~ normal(0, 0.5),
    bAge ~ normal(0, 0.5),
    sigma_intercepts_slopes ~ exponential(1),
    Rho ~ lkj_corr(2)
  ),
  data = bc_dat, chains = 4, cores = 4, log_lik = TRUE
)
display(precis(m_bc_age_children, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m_bc_age_children, depth=3), main="m_bc_age_children")
}, ar=0.4)
```

Fitting the second model:

```{code-cell} r
bc_dat <- list(
  UseContraception = bc_df$use.contraception,
  DistrictId = bc_df$district_id,
  Urban = bc_df$urban,
  Age = standardize(bc_df$age.centered)
)
m_bc_age <- ulam(
  alist(
    UseContraception ~ dbinom(1, p),
    logit(p) <- a_district[DistrictId] + b_district[DistrictId] * Urban + bAge * Age,
    c(a_district, b_district)[DistrictId] ~ multi_normal(c(a, b), Rho, sigma_intercepts_slopes),
    a ~ normal(0, 2),
    b ~ normal(0, 0.5),
    bAge ~ normal(0, 0.5),
    sigma_intercepts_slopes ~ exponential(1),
    Rho ~ lkj_corr(2)
  ),
  data = bc_dat, chains = 4, cores = 4, log_lik = TRUE
)
display(precis(m_bc_age, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m_bc_age, depth=3), main="m_bc_age")
}, ar=0.4)
```

In the first model, we see that with more children the likelihood of using birth control goes up, as
expected. The likelihood of using birth control also goes down with age, as expected if you assume
that younger women are more open to newer ideas like birth control.

In the second model we see the total causal effect of age on whether a woman uses birth control is
positive. That is, the older a woman is the more likely she is to use birth control. That is, the
tendency for a woman to use birth control as she gets older because she has more children is
stronger than the influence of changing acceptance of birth control.

**14H3.** Modify any models from 14H2 that contained that children variable and model the variable now
as a monotonic ordered category, like education from the week we did ordered categories. Education
in that example had 8 categories. Children here will have fewer (no one in the sample had 8
children). So modify the code appropriately. What do you conclude about the causal influence of each
additional child on use of contraception?

**ERROR:** The author uses the term *week* above as if he has a syllabus for the book.

**Answer.** Fitting the model:

```{code-cell} r
data(bangladesh)
bc_df <- bangladesh
bc_df$district_id <- as.integer(as.factor(bc_df$district))

bc_dat <- list(
  UseContraception = bc_df$use.contraception,
  DistrictId = bc_df$district_id,
  Urban = bc_df$urban,
  Age = standardize(bc_df$age.centered),
  Children = as.integer(bc_df$living.children),
  alpha = rep(2, 3)
)
m_bc_ordered_children <- ulam(
  alist(
    UseContraception ~ dbinom(1, p),
    logit(p) <- bC*sum(delta_j[1:Children]) + a_district[DistrictId] + b_district[DistrictId] *
Urban + bAge * Age,
    c(a_district, b_district)[DistrictId] ~ multi_normal(c(a, b), Rho, sigma_intercepts_slopes),
    bC ~ normal(0, 1),
    a ~ normal(0, 2),
    b ~ normal(0, 0.5),
    bAge ~ normal(0, 0.5),
    sigma_intercepts_slopes ~ exponential(1),
    Rho ~ lkj_corr(2),
    vector[4]: delta_j <<- append_row( 0 , delta ),
    simplex[3]: delta ~ dirichlet( alpha )
  ),
  data = bc_dat, chains = 4, cores = 4, log_lik = TRUE
)
display(precis(m_bc_ordered_children, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m_bc_ordered_children, depth=3), main="m_bc_ordered_children")
}, ar=0.4)
```

Notice in the `summary` of this data frame, above, that the women surveyed had a minimum of one and
a maximum of four children. It appears the maximum jump in likelihood of a woman using contraception
occurs after having the second child.

**14H4.** Varying effects models are useful for modeling time series, as well as spatial clustering.
In a time series, the observations cluster by entities that have continuity through time, such as
individuals. Since observations within individuals are likely highly correlated, the multilevel
structure can help quite a lot. You’ll use the data in `data(Oxboys)`, which is 234 height
measurements on 26 boys from an Oxford Boys Club (I think these were like youth athletic leagues?),
at 9 different ages (centered and standardized) per boy. You’ll be interested in predicting
`height`, using `age`, clustered by `Subject` (individual boy). Fit a model with varying intercepts
and slopes (on age), clustered by `Subject`. Present and interpret the parameter estimates. Which
varying effect contributes more variation to the heights, the intercept or the slope?

```{code-cell} r
data(Oxboys)
ox <- Oxboys
```

**Answer.** A `head` and `summary` of the `Oxboys` data.frame (no `help` exists):

```{code-cell} r
display(head(ox))
display(summary(ox))
```

Fitting the model:

```{code-cell} r
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
```

The intercepts term contributes much more to the heights than the slopes. Notice the `b_boy` terms
are the maximum that the slopes can contribute to `mu` since `Age` is at most equal one.

---

**14H5.** Now consider the correlation between the varying intercepts and slopes. Can you explain
its value? How would this estimated correlation influence your predictions about a new sample of
boys?

**Answer.** The correlation is positive, because more positive intercepts are associated with more
positive slopes. That is, boys who are on average taller also grow faster.

---

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

where `sa` is the standard deviation of the first variable, `sb` is the standard deviation of the
second variable, and `rho` is the correlation between them.

**Answer.** The expected plot:

```{code-cell} r
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
```

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

```{code-cell} r
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
```
