source("iplot.R")
library(rethinking)

display_markdown(r"(
**14M5.** Modify the phylogenetic distance example to use group size as the outcome and brain size
as a predictor. Assuming brain size influences group size, what is your estimate of the effect? How
does phylogeny influence the estimate?

**Answer.** First, let's reproduce the results from the chapter:
)")

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

display_markdown(r"(
<br/>

Reversing the prediction problem:
)")

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

display_markdown(r"(
<br/>

Interestingly, the ordinary regression model makes an even more extreme prediction about how group
size influences brain size than the reverse. Still, the uncertainties are large.

The addition of phylogeny once again removes the presumed effect. The uncertainties are so large in
these latter two models that they really say almost nothing about an association.
)")
