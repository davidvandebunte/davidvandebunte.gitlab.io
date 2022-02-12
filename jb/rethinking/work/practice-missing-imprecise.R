source("iplot.R")
library(rethinking)

display_markdown(r"(
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
)")

display_markdown(r"(
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
)")

display_markdown(r"(
**15M1.** Using the mathematical form of the imputation model in the chapter, explain what is being
assumed about how the missing values were generated.

**ERROR.** It's not clear what the author means by 'the imputation model'; there are several models
in the text.

**Answer.** In section **15.2.2.** the first imputation model assumes a normal distribution for
brain sizes. This is somewhat unreasonable, as explained in the text, because these values should be
bounded between zero and one.

In the second model for this primate example we still assume a normal distribution, but now
correlated with body mass.
)")

display_markdown(r"(
**15M2.** Reconsider the primate milk missing data example from the chapter. This time, assign $B$ a
distribution that is properly bounded between zero and 1. A beta distribution, for example, is a
good choice.

**Answer.** This question requires a `start=` list to run at all, which isn't suggested for these
imputation models until a later question. We use the `dbeta2` parameterization provided by `ulam` to
make the parameters a bit more understandable (as opposed to `dbeta). Fitting the model:
)")

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

display_markdown(r"(
Without bounds on the parameters to the beta distribution, this model produces a significant number
of divergent transitions. To avoid these errors, we are using uniform priors on the two parameters
to the beta distribution. Checking the `pairs` and `traceplot`:
)")
sel_pars=c("a", "bM", "bB", "sigma", "p", "theta", "B_impute[1]", "B_impute[5]")
iplot(function() {
  pairs(m_milk_beta@stanfit, pars=sel_pars)
})
iplot(function() {
  traceplot(m_milk_beta, pars=sel_pars)
})

display_markdown(r"(
<br/>
The `precis` results:
)")
display(precis(m_milk_beta, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m_milk_beta, depth=3), main="m_milk_beta")
}, ar=2)

display_markdown(r"(
The `theta` parameter to the beta distribution is highly uncertain because there are simply too many
values that are compatible with these observations. The imputed values are essentially nothing more
than the mean of the non-NA observations of brain size. That is, any gentle tilt of the imputed
values we'd expect from using the observed mass seems to have disappeared.

Let's zoom in on some parameters of interest:
)")
iplot(function() {
  plot(precis(m_milk_beta, depth=3), main="m_milk_beta", pars=c("a", "bM", "bB", "sigma"))
}, ar=4.5)

display_markdown(r"(
Compare these results to the figure produced from R code 15.20 in the chapter. The inference for
`bM` has shrunk even further. It's likely `bB` has shrunk as well, though in this new model `bB` is
multiplied by a probability rather than a standardized value so we can expect it to be smaller.
)")

source('practice-double-divorce.R')
source('practice-simulate-confound.R')
source('practice-singing-birds.R')
source('practice-four-dogs.R')

source('practice-elephant-error.R')
source('practice-unintuitive-flow.R')
source('practice-primates-error.R')
source('practice-primates-missing.R')
source('practice-error-divorce.R')
source('practice-eight-sided-spinner.R')
