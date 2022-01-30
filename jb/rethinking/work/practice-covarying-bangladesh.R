source("iplot.R")
library(rethinking)

display_markdown(r"(
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
)")

data(bangladesh)
display(help(bangladesh))

bc_df <- bangladesh
bc_df$district_id <- as.integer(as.factor(bc_df$district))

display_markdown(r"(
A `head` and `summary` of the `bangladesh` data.frame, with the new variable suggested by the author
in question 13H1:
)")
display(head(bc_df))
display(summary(bc_df))

display_markdown(r"(
<br/>
Sampling from the varying intercepts model:
)")

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

display_markdown(r"(
Not surprisingly, the `b` slope parameter and most of the `b_district` are positive. Normally,
living in an urban area makes one more open to ideas like contraception. The `a` parameters are
likely negative because in general many women do not use contraception.

The correlation is negative, because `a` is typically negative and `b` is typically positive. It is
also relatively large in absolute magnitude, implying that a more negative intercept is associated
with a more positive slope (and vice versa). We can see this in a plot of mean intercepts vs. mean
slopes:
)")

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

display_markdown(r"(
This is a similar relationship to what we saw in the cafe example at the start of the chapter; more
extreme intercepts (cafes, districts) are associated with more extreme slopes. In this case the
districts with especially low contraceptive use are associated with a greater increase in use when a
woman 'moves' to an urban area within the district.
)")

source("practice-age-children-bangladesh.R")
source("practice-ordered-category-bangladesh.R")
