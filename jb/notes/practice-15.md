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

# Practice: Chp. 15

```{code-cell} r
library(cmdstanr)
set_cmdstan_path("/opt/conda/bin/cmdstan")

source("iplot.R")
suppressPackageStartupMessages(library(rethinking))
```

**15E1.** Rewrite the Oceanic tools model (from Chapter 11) below so that it assumes measured error
on the log population sizes of each society. You don’t need to fit the model to data. Just modify
the mathematical formula below.

$$
\begin{align}
T_i & \sim Poisson(\mu_i) \\
log(\mu_i) & = \alpha + \beta log(P_i) \\
\alpha & \sim Normal(0, 1.5) \\
\beta & \sim Normal(0, 1)
\end{align}
$$

**Answer.** Assuming a $P_{SE,i}$ is available, though it is not in the data:

$$
\begin{align}
T_i & \sim Poisson(\mu_i) \\
log(\mu_i) & = \alpha + \beta log(P_{TRUE,i}) \\
P_{OBS,i} & \sim Normal(P_{TRUE,i}, P_{SE,i}) \\
\alpha & \sim Normal(0, 1.5) \\
\beta & \sim Normal(0, 1)
\end{align}
$$

**15E2.** Rewrite the same model so that it allows imputation of missing values for log population.
There aren’t any missing values in the variable, but you can still write down a model formula that
would imply imputation, if any values were missing.

**Answer.** As a challenge we'll add this to model that also considers measurement error, assuming
either both the observed value and the measurement are present, or neither. The priors could be much
better:

$$
\begin{align}
T_i & \sim Poisson(\mu_i) \\
log(\mu_i) & = \alpha + \beta log(P_{TRUE,i}) \\
P_{OBS,i} & \sim Normal(P_{TRUE,i}, P_{SE,i}) \\
P_{OBS,i} & \sim Normal(\nu, \sigma_B) \\
\alpha & \sim Normal(0, 1.5) \\
\beta & \sim Normal(0, 1) \\
\nu & \sim Normal(1e6, 1e6) \\
\sigma_B & \sim Exponential(0.0001)
\end{align}
$$

**15M1.** Using the mathematical form of the imputation model in the chapter, explain what is being
assumed about how the missing values were generated.

**ERROR.** It's not clear what the author means by 'the imputation model'; there are several models
in the text.

**Answer.** In section **15.2.2.** the first imputation model assumes a normal distribution for
brain sizes. This is somewhat unreasonable, as explained in the text, because these values should be
bounded between zero and one.

In the second model for this primate example we still assume a normal distribution, but now
correlated with body mass.

**15M2.** Reconsider the primate milk missing data example from the chapter. This time, assign $B$ a
distribution that is properly bounded between zero and 1. A beta distribution, for example, is a
good choice.

**Answer.** This question requires a `start=` list to run at all, which isn't suggested for these
imputation models until a later question. We use the `dbeta2` parameterization provided by `ulam` to
make the parameters a bit more understandable (as opposed to `dbeta`). Fitting the model:

```{code-cell} r
data(milk)
d <- milk
d$neocortex.prop <- d$neocortex.perc / 100
d$logmass <- log(d$mass)
stdB = standardize(d$neocortex.prop)
dat_list <- list(
  K = standardize(d$kcal.per.g),
  B = d$neocortex.prop,
  M = standardize(d$logmass),
  center = attr(stdB, "scaled:center"),
  scale = attr(stdB, "scaled:scale")
)

m_milk_beta <- ulam(
  alist(
    K ~ dnorm(mu, sigma),
    mu <- a + bB*B + bM*M,
    B ~ dbeta2(p, theta),
    a ~ dnorm(0, 0.5),
    c(bB, bM) ~ dnorm(0, 0.5),
    p ~ dunif(0, 1),
    theta ~ dunif(0, 1000),
    sigma ~ dexp(1)
  ), data=dat_list, chains=4, cores=4, start=list(B_impute=rep(0.7,12))
)
```

Without bounds on the parameters to the beta distribution, this model produces a significant number
of divergent transitions. To avoid these errors, we are using uniform priors on the two parameters
to the beta distribution. Checking the `pairs` and `traceplot`:

```{code-cell} r
sel_pars=c("a", "bM", "bB", "sigma", "p", "theta", "B_impute[1]", "B_impute[5]")
iplot(function() {
  pairs(m_milk_beta@stanfit, pars=sel_pars)
})
iplot(function() {
  traceplot(m_milk_beta, pars=sel_pars)
})
```

The `precis` results:

```{code-cell} r
display(precis(m_milk_beta, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m_milk_beta, depth=3), main="m_milk_beta")
}, ar=2)
```

The `theta` parameter to the beta distribution is highly uncertain because there are simply too many
values that are compatible with these observations. The imputed values are essentially nothing more
than the mean of the non-NA observations of brain size. That is, any gentle tilt of the imputed
values we'd expect from using the observed mass seems to have disappeared.

Let's zoom in on some parameters of interest:

```{code-cell} r
iplot(function() {
  plot(precis(m_milk_beta, depth=3), main="m_milk_beta", pars=c("a", "bM", "bB", "sigma"))
}, ar=4.5)
```

Compare these results to the figure produced from R code 15.20 in the chapter. The inference for
`bM` has shrunk even further. It's likely `bB` has shrunk as well, though in this new model `bB` is
multiplied by a probability rather than a standardized value so we can expect it to be smaller.

**15M3.** Repeat the divorce data measurement error models, but this time double the standard
errors. Can you explain how doubling the standard errors impacts inference?

**Answer.** Let's start by reproducing the results from the chapter, for the sake of comparison:

```{code-cell} r
data(WaffleDivorce)
d <- WaffleDivorce

dlist <- list(
  D_obs = standardize(d$Divorce),
  D_sd = d$Divorce.SE / sd(d$Divorce),
  M = standardize(d$Marriage),
  A = standardize(d$MedianAgeMarriage),
  N = nrow(d)
)
m15.1 <- ulam(
  alist(
    D_obs ~ dnorm(D_true, D_sd),
    vector[N]:D_true ~ dnorm(mu, sigma),
    mu <- a + bA * A + bM * M,
    a ~ dnorm(0, 0.2),
    bA ~ dnorm(0, 0.5),
    bM ~ dnorm(0, 0.5),
    sigma ~ dexp(1)
  ),
  data = dlist, chains = 4, cores = 4
)
display(precis(m15.1, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m15.1, depth=3), main="m15.1")
}, ar=1)

dlist <- list(
  D_obs = standardize(d$Divorce),
  D_sd = d$Divorce.SE / sd(d$Divorce),
  M_obs = standardize(d$Marriage),
  M_sd = d$Marriage.SE / sd(d$Marriage),
  A = standardize(d$MedianAgeMarriage),
  N = nrow(d)
)
m15.2 <- ulam(
  alist(
    D_obs ~ dnorm(D_true, D_sd),
    vector[N]:D_true ~ dnorm(mu, sigma),
    mu <- a + bA * A + bM * M_true[i],
    M_obs ~ dnorm(M_true, M_sd),
    vector[N]:M_true ~ dnorm(0, 1),
    a ~ dnorm(0, 0.2),
    bA ~ dnorm(0, 0.5),
    bM ~ dnorm(0, 0.5),
    sigma ~ dexp(1)
  ),
  data = dlist, chains = 4, cores = 4
)
display(precis(m15.2, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m15.2, depth=3), main="m15.2")
}, ar=0.5)
```

Doubling the standard error:

```{code-cell} r
d$doubleSE = 2*d$Divorce.SE

dlist <- list(
  D_obs = standardize(d$Divorce),
  D_sd = d$doubleSE / sd(d$Divorce),
  M = standardize(d$Marriage),
  A = standardize(d$MedianAgeMarriage),
  N = nrow(d)
)
m.double.se.1 <- ulam(
  alist(
    D_obs ~ dnorm(D_true, D_sd),
    vector[N]:D_true ~ dnorm(mu, sigma),
    mu <- a + bA * A + bM * M,
    a ~ dnorm(0, 0.2),
    bA ~ dnorm(0, 0.5),
    bM ~ dnorm(0, 0.5),
    sigma ~ dexp(1)
  ),
  data = dlist, chains = 4, cores = 4
)
display(precis(m.double.se.1, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m.double.se.1, depth=3), main="m.double.se.1")
}, ar=1)

dlist <- list(
  D_obs = standardize(d$Divorce),
  D_sd = d$doubleSE / sd(d$Divorce),
  M_obs = standardize(d$Marriage),
  M_sd = d$Marriage.SE / sd(d$Marriage),
  A = standardize(d$MedianAgeMarriage),
  N = nrow(d)
)
m.double.se.2 <- ulam(
  alist(
    D_obs ~ dnorm(D_true, D_sd),
    vector[N]:D_true ~ dnorm(mu, sigma),
    mu <- a + bA * A + bM * M_true[i],
    M_obs ~ dnorm(M_true, M_sd),
    vector[N]:M_true ~ dnorm(0, 1),
    a ~ dnorm(0, 0.2),
    bA ~ dnorm(0, 0.5),
    bM ~ dnorm(0, 0.5),
    sigma ~ dexp(1)
  ),
  data = dlist, chains = 4, cores = 4
)
display(precis(m.double.se.2, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m.double.se.2, depth=3), main="m.double.se.2")
}, ar=0.5)
```

Comparing the most important parameters:

```{code-cell} r
iplot(function() {
  plot(
    coeftab(m.double.se.2, m15.2, m.double.se.1, m15.1), pars=c("a", "bA", "bM", "sigma"),
    main="All models"
  )
}, ar=1.7)
```

Notice we are getting some divergent transitions. It's likely we're running into these issues
because there is more parameter space to explore; we're less certain about all our inferences and so
we need to cover more possibilities. Like vague priors, this can lead to divergent transitions.

The `a`, `bA`, and `bM` parameters have increased. With less certainty in the measurements, it's
more plausible that a stronger relationship holds (similar to what we saw in Figure 15.3). In
contrast, the `sigma` parameter has decreased, because we can now explain more variation in terms of
measurement error than general noise.

We also see, in general, more uncertainty in parameter estimates across the board (wider HDPI bars).

**15M4.** Simulate data from this DAG: $X \rightarrow Y \rightarrow Z$. Now fit a model that
predicts $Y$ using both $X$ and $Z$. What kind of confound arises, in terms of inferring the causal
influence of $X$ on $Y$?

**Answer.** First lets simulate, with normal distributions:

```{code-cell} r
N <- 1000
X <- rnorm(N)
Y <- rnorm(N, mean=X)
Z <- rnorm(N, mean=Y)

dat_list <- list(
  X = X,
  Y = Y,
  Z = Z
)

m_confound <- ulam(
  alist(
    Y ~ dnorm(mu, sigma),
    mu <- a + bX*X + bZ*Z,
    c(a, bX, bZ) ~ dnorm(0, 1),
    sigma ~ dexp(1)
  ), data=dat_list, chains=4, cores=4
)

display(precis(m_confound, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m_confound, depth=3), main="m_confound")
}, ar=4.5)
```

The confound we're running into is post-treatment bias (conditioning on the outcome).

In this case $Z$ is a better predictor of $Y$ than $X$ (notice the credible intervals). This is
because the function between $X$ and $Y$ is the same as the function between $Y$ and $Z$,
specifically the normal distribution with standard deviation equal one. Since $Y$ will take on more
dispersed values than $X$, and $Z$ more dispersed values than $Y$, the more widely dispersed values
of $Z$ will predict $Y$ better.

**15M5.** Return to the singing bird model, `m15.9`, and compare the posterior estimates of cat
presence (`PrC1`) to the true simulated values. How good is the model at inferring the missing data?
Can you think of a way to change the simulation so that the precision of the inference is stronger?

```{code-cell} r
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
```

Indexes of the missing values:

```{code-cell} r
display(which(R_C != 0))
post <- extract.samples(m15.9)
```

The mean values of `PrC1` at those indexes:

```{code-cell} r
mean_prc1 <- apply(post$PrC1, 2, mean)
display(mean_prc1[R_C != 0])
```

The true simulated values at those indexes:

```{code-cell} r
display(cat[R_C != 0])
```

If we take `PrC1` > 0.5 to mean a cat is present, then these missing elements were predicted
correctly:

```{code-cell} r
cat_prc1 <- as.integer(mean_prc1 > 0.5)
is_correct <- cat_prc1[R_C != 0] == cat[R_C != 0]
display(is_correct)
```

For a total accuracy of:

```{code-cell} r
display(sum(is_correct) / length(is_correct))
```

**15M6.** Return to the four dog-eats-homework missing data examples. Simulate each and then fit one
or more models to try to recover valid estimates for $S \rightarrow H$.

**Answer.** A model fit to completely observed (`co`) data and a model fit to complete cases (`cc`)
for the first scenario, where dogs eat homework at random:

```{code-cell} r
library(data.table)

N <- 100
S <- rnorm(N)
H <- rbinom(N, size = 10, inv_logit(S))

D <- rbern(N) # dogs completely random
Hm <- H
Hm[D == 1] <- NA

d <- data.frame(S = S, H = H, Hm = Hm)
check_co <- function(d, name) {
  set.seed(27)
  dat.co <- list(
    S = d$S,
    H = d$H
  )
  m.dog.co <- ulam(
    alist(
      H ~ dbinom(10, p),
      logit(p) <- a + bS*S,
      a ~ dnorm(0, 1),
      bS ~ dnorm(0, 1)
    ), data=dat.co, cores=4, chains=4
  )
  display(precis(m.dog.co, depth=2), mimetypes="text/plain")
  iplot(function() {
    plot(precis(m.dog.co, depth=2), main=name)
  }, ar=4.0)
}
check_co(d, "m.dog.1.co")

check_cc <- function(d, name) {
  # browser()
  set.seed(27)
  d_cc <- d[complete.cases(d$Hm), ]
  # t_d <- transpose(d_cc)
  # colnames(t_d) <- rownames(d_cc)
  # rownames(t_d) <- colnames(d_cc)
  # display(t_d)
  dat.cc <- list(
    S = d_cc$S,
    Hm = d_cc$Hm
  )
  display_markdown("Sample of data remaining for 'complete case' analysis: ")
  display(head(d_cc))
  m.dog.cc <- ulam(
    alist(
      Hm ~ dbinom(10, p),
      logit(p) <- a + bS*S,
      a ~ dnorm(0, 1),
      bS ~ dnorm(0, 1)
    ), data=dat.cc, cores=4, chains=4
  )
  display(precis(m.dog.cc, depth=2), mimetypes="text/plain")
  iplot(function() {
    plot(precis(m.dog.cc, depth=2), main=name)
  }, ar=4.0)
}
check_cc(d, "m.dog.1.cc")
```

As expected (explained in the chapter) we are able to infer `bS` both with and without all the data.

In the second scenario, dogs of hard-working students eat homework. We don't need to fit a new
completely observed (`co`) model because it shouldn't be any different from `m.dog.1.co`. A model
fit to complete cases (`cc`):

```{code-cell} r
D2 <- ifelse(S > 0, 1, 0)
Hm2 <- H
Hm2[D2 == 1] <- NA
d <- data.frame(S = S, H = H, Hm = Hm2)
check_cc(d, "m.dog.2.cc")
```

As expected (explained in the chapter) we are able to infer `bS` both with and without all the data.

The text suggests a variation on scenario 2 where the function $S \rightarrow H$ is nonlinear
and unobserved only in the domain of the function where it is non-linear. Let's simulate this
scenario and attempt to infer the coefficient of the (wrong) linear function with and without all
the data:

```{code-cell} r
H3 <- ifelse(S > 0, H, 0)
Hm3 <- H3
Hm3[D2 == 1] <- NA
d <- data.frame(S = S, H = H3, Hm = Hm3)
check_co(d, "m.dog.2.var.co")
check_cc(d, "m.dog.2.var.cc")
```

As expected (explained in the chapter) both these inferences are wrong. The `cc` inference is wrong
because despite complete observability our model was linear when the function was non-linear. The
`co` inference is extra wrong because our sampling is also biased. The data going into this second
model is completely uninformative; all the `S` are random negative numbers and the `H` are 0. Notice
that we confusingly still get a positive inference for `bS`. The model wants to push everything in
the log link as negative as possible, but `a` is already as negative as it can be given our thin
tailed (normal) prior on it. We can push everything farther negative by making `bS` positive, since
all the `S` values are negative. Be skeptical of models that have any parameter inferences that are
extreme relative to the parameter's priors (like `a`)! These mean that either your prior is wrong,
your data, or your model.

The third scenario, where some unobserved variable like the noise level in the student's house
affects both the homework quality and whether dogs eat homework, is already partially covered in the
chapter. Let's consider the variation suggested in R code 15.14, however:

```{code-cell} r
N2 <- 1000
X <- rnorm(N2)
S2 <- rnorm(N2)
H4 <- rbinom(N2, size = 10, inv_logit(2 + S2 - 2 * X))
# D <- ifelse(X > 1, 1, 0)
D <- ifelse(abs(X) < 1, 1, 0)
Hm4 <- H4
Hm4[D == 1] <- NA
d <- data.frame(S = S2, H = H4, Hm = Hm4)
check_co(d, "m.dog.3.var.co")
check_cc(d, "m.dog.3.var.cc")
```

As expected (see the text) missingness makes the inference for `bS` worse than with complete
observability. We've changed the missingness function to remove small values rather than large
values. When we remove large values, the remaining observations are farther from a ceiling and
therefore the influence of predictors seems larger, which is what we want when we have an unobserved
variable. When we remove small values, the remaining observations are closer to a ceiling or a
floor and the influence of predictors seems smaller.

In the fourth scenario dogs eat bad homework. Little can be done to get a good inference:

```{code-cell} r
S.4 <- rnorm(N)
H.4 <- rbinom(N, size = 10, inv_logit(S.4))
D.4 <- ifelse(H.4 < 5, 1, 0)
Hm.4 <- H.4
Hm.4[D.4 == 1] <- NA
d <- data.frame(S = S.4, H = H.4, Hm = Hm.4)
check_cc(d, "m.dog.4.cc")
```
