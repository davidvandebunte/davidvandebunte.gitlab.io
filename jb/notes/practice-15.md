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
  ), cmdstan=TRUE, data=dat_list, chains=4, cores=4, start=list(B_impute=rep(0.7,12))
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
  cmdstan = TRUE, data = dlist, chains = 4, cores = 4
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
  cmdstan = TRUE, data = dlist, chains = 4, cores = 4
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
  cmdstan = TRUE, data = dlist, chains = 4, cores = 4
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
  cmdstan = TRUE, data = dlist, chains = 4, cores = 4
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
  ), cmdstan = TRUE, data=dat_list, chains=4, cores=4
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
  cmdstan = TRUE, data = dat, chains = 4, cores = 4
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
    ), cmdstan = TRUE, data=dat.co, cores=4, chains=4
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
    ), cmdstan = TRUE, data=dat.cc, cores=4, chains=4
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

**15H1.** The data in `data(elephants)` are counts of matings observed for bull elephants of
differing ages. There is a strong positive relationship between age and matings. However, age is not
always assessed accurately. First, fit a Poisson model predicting `MATINGS` with `AGE` as a
predictor. Second, assume that the observed `AGE` values are uncertain and have a standard error of
±5 years. Re-estimate the relationship between `MATINGS` and `AGE`, incorporating this measurement
error. Compare the inferences of the two models.

**Answer.** The full `elephants` data.frame:

```{code-cell} r
data(elephants)
display(elephants)

q15.h1.a <- function(d) {
  dat <- list(
    M = as.integer(d$MATINGS),
    A = as.numeric(standardize(d$AGE))
  )
  m15.h1.a <- ulam(
    alist(
      M ~ dpois(lambda),
      lambda <- exp(a + bA*A),
      a ~ dnorm(0, 1),
      bA ~ dnorm(0, 1)
    ), cmdstan = TRUE, data=dat, cores = 4, chains = 4, log_lik = TRUE
  )
  display_precis(m15.h1.a, "m15.h1.a", 4.0)
  return(m15.h1.a)
}
q15.h1.b <- function(d, error=5.0) {
  set.seed(31)
  stdA = standardize(d$AGE)
  dat <- list(
    M = as.integer(d$MATINGS),
    A_obs = as.numeric(stdA),
    A_sd = error / attr(stdA, "scaled:scale"),
    N = nrow(d)
  )
  m15.h1.b <- ulam(
    alist(
      M ~ dpois(lambda),
      A_obs ~ dnorm(A_true, A_sd),
      lambda <- exp(a + bA*A_true[i]),
      vector[N]:A_true ~ dnorm(0, 1),
      a ~ dnorm(0, 1),
      bA ~ dnorm(0, 1)
    ), cmdstan = TRUE, data=dat, cores = 4, chains = 4, log_lik = TRUE
  )
  display_precis(m15.h1.b, "m15.h1.b", 0.8)
  return(m15.h1.b)
}

# m15.h1.a <- q15.h1.a(elephants)
# m15.h1.b <- q15.h1.b(elephants)
#
# iplot(function() {
#   plot(coeftab(m15.h1.b, m15.h1.a), pars=c("a", "bA"), main="Parameter comparison for elephant models")
# }, ar=3.0)
```

The second model infers both a larger and more uncertain estimate (wider credible intervals) for
`bA`.

**15H2.** Repeat the model fitting problem above, now increasing the assumed standard error on
`AGE`. How large does the standard error have to get before the posterior mean for the coefficient
on `AGE` reaches zero?

**Answer.** The coefficient's uncertainty gets large enough to cover zero when we get to roughly
20-25 years of age uncertainty:

```{code-cell} r
q15.h1.b(elephants, error=25)
```

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

```{code-cell} r
r.code.15.32 <- function() {
  set.seed(100)
  x <- c(rnorm(10), NA)
  y <- c(rnorm(10, x), 100)
  d <- list(x = x, y = y)
  display(d)
  return(data.frame(d))
}
d.15.h3 <- r.code.15.32()
```

Fitting a model to complete cases, using the same model in the question minus the $x_i$ prior:

```{code-cell} r
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
    ), cmdstan = TRUE, data=dat, cores=4, chains=4, log_lik=TRUE
  )
  display_precis(m15.h3.a, "m15.h3.a", 4.5)
  return(m15.h3.a)
}
m15.h3.a <- q.15.h3.a(d.15.h3)
```

Fitting a model to all the data, with the imputation model suggested in the question:

```{code-cell} r
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
    ), cmdstan = TRUE, data=dat, cores=4, chains=4, log_lik=TRUE
  )
  display_precis(m15.h3.b, "m15.h3.b", 4.0)
  return(m15.h3.b)
}
m15.h3.b <- q.15.h3.b(d.15.h3)
```

Notice the model has imputed a value near zero for the single missing value. This point is extremely
influential because of the large value of `y` associated with it (the `100`) so it dominates the
inference results. A value of zero associated with `100` implies almost no relationship between `x`
and `y` so the model infers that `sigma` is large instead.

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

Now I’ll make up some standard errors for $B$ and $M$, assuming error is 10% of the measurement.

R code 15.34
```R
Bse <- B*0.1
Mse <- M*0.1
```

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
 ) , cmdstan = TRUE, data=dat_list )
```

Your job is to add the measurement errors to this model. Use the divorce/marriage example in the
chapter as a guide. It might help to initialize the unobserved true values of $B$ and $M$ using the
observed values, by adding a list like this to `ulam`:

R code 15.36
```R
start=list( M_true=dat_list$M , B_true=dat_list$B )
```

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

```{code-cell} r
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
    ), cmdstan = TRUE, data=dat_list, chains=4, cores=4
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
    ), cmdstan = TRUE, data=dat_list, chains=4, cores=4, log_lik=TRUE
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
```

Little has changed with the update. It looks like `sigma` is slightly smaller, perhaps because more
uncertainty in the data has naturally led to more confidence in the model.

**15H5.** Now consider missing values - this data set is lousy with them. You can ignore measurement
error in this problem. Let’s get a quick idea of the missing values by counting them in each
variable: R code

R code 15.37
```
library(rethinking)
data(Primates301)
d <- Primates301
colSums( is.na(d) )
```

We’ll continue to focus on just brain and body, to stave off insanity. Consider only those species
with measured body masses:

R code 15.38
```
cc <- complete.cases( d$body )
M <- d$body[cc]
M <- M / max(M)
B <- d$brain[cc]
B <- B / max( B , na.rm=TRUE )
```

You should end up with 238 species and 56 missing brain values among them.

First, consider whether there is a pattern to the missing values. Does it look like missing values
are associated with particular values of body mass? Draw a DAG that represents how missingness works
in this case. Which type (MCAR, MAR, MNAR) is this?

Second, impute missing values for brain size. It might help to initialize the 56 imputed variables
to a valid value:

R code 15.39
```
start=list( B_impute=rep(0.5,56) )
```

This just helps the chain get started.

Compare the inferences to an analysis that drops all the missing values. Has anything changed? Why
or why not? Hint: Consider the density of data in the ranges where there are missing values. You
might want to plot the imputed brain sizes together with the observed values.

**ERROR:**

> by counting them in each variable: R code

```{code-cell} r
load.d15h5 <- function() {
  data(Primates301)
  d <- Primates301
  display_markdown("**Answer.** The `colSums` output:")
  display(colSums(is.na(d)), mimetypes="text/plain")

  cc <- complete.cases( d$body )
  M <- d$body[cc]
  M <- M / max(M)
  B <- d$brain[cc]
  B <- B / max( B , na.rm=TRUE )
  d15h5 <- data.frame(B = B, M = M)
  display_markdown("<br/> To confirm there are 238 species, preview the data.frame:")
  display(d15h5)
  display_markdown("<br/> To confirm there are 56 missing brain values, check the `summary`:")
  display(summary(d15h5))
  return(d15h5)
}

e15h5a <- r"(
The negative intercept `a` merely indicates that most values are 0 rather than 1 in D (not missing).
More interesting is `bM`, which is reliably negative. A negative `bM` indicates that larger values
of `M` are associated with being missing less. That is, brain sizes are missing more often for
species with small masses.

Clearly this is not MCAR. See section **15.2.2** for potential DAGs. If you believe that brain
volumes are only missing because researchers prefer to study species with a larger mass, then this
may be a salvageable MAR situation. If you believe brain volumes are missing because researchers
prefer to study species with larger brains, this is MNAR.
)"
q15h5a <- function(d) {
  dat <- list(
    D = as.integer(is.na(d$B)),
    M = as.numeric(standardize(d$M))
  )
  display_markdown("<br/> Let's check if we can predict `D` (deleted values) from `M`:")
  m15h5a <- ulam(
    alist(
      D ~ dbinom(1, p),
      logit(p) <- a + bM*M,
      c(a, bM) ~ dnorm(0, 1)
    ), cmdstan = TRUE, data=dat, cores=4, chains=4
  )
  display_precis(m15h5a, "m15h5a", ar=4.0)
  display_markdown(e15h5a)
}

q15h5b <- function(d) {
  dat <- list(
    B = d$B,
    M = d$M
  )
  # browser()
  m15h5b <- ulam(
    alist(
      B ~ dlnorm(mu, sigma),
      mu <- a + b * log(M),
      a ~ normal(0, 1),
      b ~ normal(0, 1),
      sigma ~ exponential(1)
    ), cmdstan=TRUE, data=dat, cores=4, chains=4, start=list( B_impute=rep(0.5,56) )
  )
  display_precis(m15h5b, "m15h5b", ar=0.7)
  return(m15h5b)
}

q15h5cc <- function(d) {
  d_cc <- d[complete.cases(d$B),]
  dat <- list(B = d_cc$B, M = d_cc$M)
  m15H4cc <- ulam(
    alist(
      B ~ dlnorm(mu, sigma),
      mu <- a + b * log(M),
      a ~ normal(0, 1),
      b ~ normal(0, 1),
      sigma ~ exponential(1)
    ), cmdstan=TRUE, data=dat, chains=4, cores=4
  )
  display_precis(m15H4cc, "m15H4cc", 4.0)
  return(m15H4cc)
}

e15h5 <- r"(
There doesn't seem to be any change in the inferences for `a`, `b`, and `sigma`. When you impute
output values, the model isn't really doing anything but posterior predictive inference. We haven't
supplied any new assumptions about what the distribution of `B` should look like, other than what we
know from `M` (which we only learned from complete cases).
)"
q15h5 <- function() {
  d15h5 <- load.d15h5()
  q15h5a(d15h5)
  m15h5b <- q15h5b(d15h5)
  m15H4cc <- q15h5cc(d15h5)

  iplot(function() {
    plot(coeftab(m15H4cc, m15h5b), pars=c("a", "b", "sigma"), main="coeftab")
  }, ar=2)
  display_markdown(e15h5)
}
q15h5()
```

**15H6.** Return to the divorce rate measurement error model. This time try to incorporate the full
generative system: $A \rightarrow M \rightarrow D$, $A \rightarrow D$. What this means is that the
prior for $M$ should include $A$ somehow, because it is influenced by $A$.

```{code-cell} r
load.d15h6 <- function() {
  data(WaffleDivorce)
  d <- WaffleDivorce

  dat <- list(
    D_obs = standardize(d$Divorce),
    D_sd = d$Divorce.SE / sd(d$Divorce),
    M_obs = standardize(d$Marriage),
    M_sd = d$Marriage.SE / sd(d$Marriage),
    A = standardize(d$MedianAgeMarriage),
    N = nrow(d)
  )
  return(dat)
}

a15h6a <- function(dat) {
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
    cmdstan = TRUE, data = dat, chains = 4, cores = 4
  )
  display_precis(m15.2, "m15.2", ar=0.4)
  return(m15.2)
}

q15h6b <- function(dat) {
  m15h6 <- ulam(
    alist(
      D_obs ~ dnorm(D_true, D_sd),
      vector[N]:D_true ~ dnorm(mu, sigma),
      mu <- a + bA * A + bM * M_true[i],
      M_obs ~ dnorm(M_true, M_sd),
      vector[N]:M_true ~ dnorm(mu_M, 1),
      mu_M <- aM + bAM * A,
      aM ~ dnorm(0, 0.2),
      a ~ dnorm(0, 0.2),
      bA ~ dnorm(0, 0.5),
      bM ~ dnorm(0, 0.5),
      bAM ~ dnorm(0, 0.5),
      sigma ~ dexp(1)
    ),
    cmdstan = TRUE, data = dat, chains = 4, cores = 4
  )
  display_precis(m15h6, "m15h6", ar=0.4)
  return(m15h6)
}

e15h6b <- r"(
Notice `bAM` is nonzero. However, most of the original parameters are unchanged, as expected based
on the discussion in section **5.1.4** (`M` adds little predictive power once you know `A`).
)"
q15h6 <- function() {
  dat <- load.d15h6()
  display_markdown("**Answer.** Let's start by reproducing results from the chapter:")
  m15.2 <- a15h6a(dat)
  display_markdown("Fitting the new model:")
  m15h6 <- q15h6b(dat)

  iplot(function() {
    plot(coeftab(m15.2, m15h6), pars=c("a", "bA", "bM", "sigma"), main="coeftab")
  }, ar=2)
  display_markdown(e15h6b)
}
q15h6()
```

**15H7.** Some lad named Andrew made an eight-sided spinner. He wanted to know if it is fair. So he
spun it a bunch of times, recording the counts of each value. Then he accidentally spilled coffee
over the 4s and 5s. The surviving data are summarized below.

```{code-cell} r
library(data.table)

load.d15h7 <- function() {
  V = seq(8)
  Freq = c(18, 19, 22, NA, NA, 19, 20, 22)
  d <- data.frame(Value = V, Frequency = Freq)
  t_d <- transpose(d)
  colnames(t_d) <- rownames(d)
  rownames(t_d) <- colnames(d)
  display(t_d)
  return(d)
}
e15h7b <- r"(
Your job is to impute the two missing values in the table above. Andrew doesn’t remember how many
times he spun the spinner. So you will have to assign a prior distribution for the total number of
spins and then marginalize over the unknown total. Andrew is not sure the spinner is fair (every
value is equally likely), but he’s confident that none of the values is twice as likely as any
other. Use a Dirichlet distribution to capture this prior belief. Plot the joint posterior
distribution of 4s and 5s.
)"

e15h7c <- r"(
**Answer.** We could model this as a categorical distribution where we predict the category i.e. the
spinner value from no data; we don't need a predictor to spin. To do this, we'd have to expand the
given table into many trials. How would we model a variable number of observations, though?

To model a variable number of observations, it seems like we'd need to use the multinomial
distribution. It doesn't look like this distribution is available through `ulam`. It's also not
clear how we'd deal with what is essentially a single observation in this case.

What if you took the $Value$ as a categorical predictor? The assumption that no value is twice as
likely as any other would become the variance on a prior. But the Dirichlet distribution strongly
implies either a categorical or multinomial.

To plot the joint posterior distribution, use `pairs` on the model.

Skipping this question for now.
)"
q15h7 <- function() {
  d <- load.d15h7()
  display_markdown(e15h7b)
  display_markdown(e15h7c)
}
q15h7()
```
