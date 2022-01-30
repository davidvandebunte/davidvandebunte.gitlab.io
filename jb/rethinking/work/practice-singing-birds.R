source("iplot.R")
library(rethinking)

display_markdown(r"(
**15M5.** Return to the singing bird model, `m15.9`, and compare the posterior estimates of cat
presence (`PrC1`) to the true simulated values. How good is the model at inferring the missing data?
Can you think of a way to change the simulation so that the precision of the inference is stronger?
)")

set.seed(9)
N_houses <- 100L
alpha <- 5
beta <- (-3)
k <- 0.5
r <- 0.2
cat <- rbern(N_houses, k)
notes <- rpois(N_houses, alpha + beta * cat)
R_C <- rbern(N_houses, r)
cat_obs <- cat
cat_obs[R_C == 1] <- (-9L)
dat <- list(
  notes = notes,
  cat = cat_obs,
  RC = R_C,
  N = as.integer(N_houses)
)

m15.9 <- ulam(
  alist(
    # singing bird model
    notes | RC == 0 ~ poisson(lambda),
    notes | RC == 1 ~ custom(log_sum_exp(
      log(k) + poisson_lpmf(notes | exp(a + b)),
      log(1 - k) + poisson_lpmf(notes | exp(a))
    )),
    log(lambda) <- a + b * cat,
    a ~ normal(5, 3),
    b ~ normal(-3, 2),

    # sneaking cat model
    cat | RC == 0 ~ bernoulli(k),
    k ~ beta(2, 2),

    # imputed values
    gq > vector[N]:PrC1 <- exp(lpC1) / (exp(lpC1) + exp(lpC0)),
    gq > vector[N]:lpC1 <- log(k) + poisson_lpmf(notes[i] | exp(a + b)),
    gq > vector[N]:lpC0 <- log(1 - k) + poisson_lpmf(notes[i] | exp(a))
  ),
  data = dat, chains = 4, cores = 4
)
display(precis(m15.9, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m15.9, depth=3), main="m15.9")
}, ar=0.2)

display_markdown(r"(
Indexes of the missing values:
)")
display(which(R_C != 0))

post <- extract.samples(m15.9)
display_markdown(r"(
The mean values of `PrC1` at those indexes:
)")
mean_prc1 <- apply(post$PrC1, 2, mean)
display(mean_prc1[R_C != 0])

display_markdown(r"(
The true simulated values at those indexes:
)")
display(cat[R_C != 0])

display_markdown(r"(
If we take `PrC1` > 0.5 to mean a cat is present, then these missing elements were predicted
correctly:
)")
cat_prc1 <- as.integer(mean_prc1 > 0.5)
is_correct <- cat_prc1[R_C != 0] == cat[R_C != 0]
display(is_correct)

display_markdown(r"(
For a total accuracy of:
)")
display(sum(is_correct) / length(is_correct))
