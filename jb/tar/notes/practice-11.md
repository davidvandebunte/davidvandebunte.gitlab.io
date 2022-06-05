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

# Practice: Chp. 11

```{code-cell} r
source("iplot.R")
suppressPackageStartupMessages(library(rethinking))
```

[odds]: https://en.wikipedia.org/wiki/Odds

**11E1.** If an event has probability 0.35, what are the log-odds of this event?

**Answer.** The odds are $0.35 / (1 - 0.35) = 0.35/0.65$ or about a half. The
odds ([Odds][odds]) in favor of the event are about one to two. On the `log2`
scale we should expect the log-odds to be about negative one:

$$
log2\left(\frac{p}{1-p}\right) = log2(0.35 / (1 - 0.35)) = -0.893
$$

For a logarithmic base of `e` contract the log scale by `log(2)` or about 0.7:

$$
log\left(\frac{p}{1-p}\right) = log(0.35 / (1 - 0.35)) = -0.619
$$

**11E2.** If an event has log-odds 3.2, what is the probability of the event?

**Answer.** Expect a log2-odds of about 3.2/0.7 or around 4.6. That is, the
odds in favor of the event should be about `2**4.6` to one, perhaps around 25:1.

$$
\frac{1}{1+e^{-x}} = \frac{1}{1+e^{-3.2}} = 0.961
$$

**11E3.** Suppose that a coefficient in a logistic regression has value 1.7.
What does this imply about the proportional change in odds of the outcome?

**Answer.** The 'proportional odds' is about five:

$$
q = e^{\beta} = e^{1.7} = 5.47
$$

The 'proportional odds' is the change in odds for a unit increase in the predictor variable. So when
the predictor variable increases by one, we can expect the odds $p/(1-p)$ to increase by about a
factor of five.

**11E4.** Why do Poisson regressions sometimes require the use of an *offset*? Provide an example.

**Answer.** We use an offset in a Poisson regression (see section **11.2.3**) when we have counts
that were collected at varying densities. For example, counts collected over varying:
- Lengths of observation
- Area of sampling
- Intensity of sampling

The offset lets us include all the data in the same model while still accounting for the differences
in measurement.

A specific example would be collecting the number of visitors to a restaurant. Some counts may be
collected on a daily basis, and others on a weekly basis.

**11M1.** As explained in the chapter, binomial data can be organized in aggregated and
disaggregated forms, without any impact on inference. But the likelihood of the data does change
when the data are converted between the two formats. Can you explain why?

**Answer.** The likelihood changes when you move from the disaggregated to aggregated format because
now there is no longer exactly one trial associated with every event.

**11M2.** If a coefficient in a Poisson regression has value 1.7, what does this imply about the
change in outcome?

**Answer.** Assuming the Poisson regression uses a log link, for a unit increase in the predictor
variable we should see an increase in the rate (or mean) $\lambda$ of about five:

$$
q = \frac{exp(\alpha + \beta (x + 1))}{exp(\alpha + \beta x)} = exp(\beta) = exp(1.7) \approx 5.47
$$

**11M3.** Explain why the logit link is appropriate for a binomial generalized linear model.

**Answer.** The binomial distribution takes a probability parameter (between zero and one) and the
logit link constrains a parameter to this range.

**11M4.** Explain why the log link is appropriate for a Poisson generalized linear model.

**Answer.** The Poisson distribution takes a positive real-valued parameter and the log link
constrains a parameter to this range.

**11M5.** What would it imply to use a logit link for the mean of a Poisson generalized linear model?
Can you think of a real research problem for which this would make sense?

**Answer.** It would imply the mean $\lambda$ is between zero and one, rather than simply positive
and real-valued. If the researcher knows the maximum number of times (e.g. one) an event can occur,
it seems like it would be more appropriate to use the binomial distribution in many cases and infer
`p` instead.

**11M6.** State the constraints for which the binomial and Poisson distributions have maximum
entropy. Are the constraints different at all for binomial and Poisson? Why or why not?

[mepd]: https://en.wikipedia.org/wiki/Maximum_entropy_probability_distribution#Other_examples
[pa]: https://en.wikipedia.org/wiki/Binomial_distribution#Poisson_approximation

**Answer.** The maximum entropy constraint for both these distributions is that the expected value
is a constant. See [Maximum entropy probability distribution][mepd].

These constraints are the same because the Poisson distribution is an approximation of the binomial
when `p` is small and `N` is large. See [Poisson approximation][pa].

**11M7.** Use `quap` to construct a quadratic approximate posterior distribution for the chimpanzee
model that includes a unique intercept for each actor, `m11.4` (page 330). Compare the quadratic
approximation to the posterior distribution produced instead from MCMC. Can you explain both the
differences and the similarities between the approximate and the MCMC distributions? Relax the prior
on the actor intercepts to Normal(0, 10). Re-estimate the posterior using both `ulam` and `quap`. Do
the differences increase or decrease? Why?

**Answer.** The quadratic approximation assumes a symmetric Gaussian posterior, so it may produce
posterior inferences that are more symmetric (unlike MCMC). In this case, the algorithms produce
marginally different results.

When we move to the flat prior, `quap` struggles to produce a decent result because it is starting
with a prior that is completely non-symmetric. It may pick either the left or the right peak of the
prior to optimize from.

```{code-cell} r
source('practice11/load-chimp-models.R')
flush.console()

m11.4_flat_prior <- ulam(
  alist(
    pulled_left ~ dbinom(1, p),
    logit(p) <- a[actor] + b[treatment],
    a[actor] ~ dnorm(0, 10),
    b[treatment] ~ dnorm(0, 0.5)
  ),
  data = dat_list, chains = 4, log_lik = TRUE
)

m11.4_quap_flat_prior <- quap(
  m11.4_flat_prior@formula,
  data = dat_list
)
flush.console()

iplot(function() {
  plot(compare(m11.4, m11.4_quap, m11.4_flat_prior, m11.4_quap_flat_prior))
}, ar=3)
```

**11M8.** Revisit the `data(Kline)` islands example. This time drop Hawaii from the sample and refit
the models. What changes do you observe?

**Answer.** The results of inference are significantly different, essentially changing the nature of
the answer. The 'outlier' is relevant to what we conclude for both low and high contact cultures.

```{code-cell} r
## R code 11.36
library(rethinking)
data(Kline)
d <- Kline

## R code 11.37
d$P <- scale(log(d$population))
d$contact_id <- ifelse(d$contact == "high", 2, 1)

## R code 11.45
dat <- list(
  T = d$total_tools,
  P = d$P,
  cid = d$contact_id
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
flush.console()

k <- PSIS(m11.10, pointwise = TRUE)$k

iplot(function() {
  par(mfrow=c(1,2))
  ## R code 11.47
  plot(dat$P, dat$T,
    xlab = "log population (std)", ylab = "total tools",
    col = rangi2, pch = ifelse(dat$cid == 1, 1, 16), lwd = 2,
    ylim = c(0, 75), cex = 1 + normalize(k)
  )

  # set up the horizontal axis values to compute predictions at
  ns <- 100
  P_seq <- seq(from = -1.4, to = 3, length.out = ns)

  # predictions for cid=1 (low contact)
  lambda <- link(m11.10, data = data.frame(P = P_seq, cid = 1))
  lmu <- apply(lambda, 2, mean)
  lci <- apply(lambda, 2, PI)
  lines(P_seq, lmu, lty = 2, lwd = 1.5)
  shade(lci, P_seq, xpd = TRUE)

  # predictions for cid=2 (high contact)
  lambda <- link(m11.10, data = data.frame(P = P_seq, cid = 2))
  lmu <- apply(lambda, 2, mean)
  lci <- apply(lambda, 2, PI)
  lines(P_seq, lmu, lty = 1, lwd = 1.5)
  shade(lci, P_seq, xpd = TRUE)

  ## R code 11.48
  plot(d$population, d$total_tools,
    xlab = "population", ylab = "total tools",
    col = rangi2, pch = ifelse(dat$cid == 1, 1, 16), lwd = 2,
    ylim = c(0, 75), cex = 1 + normalize(k)
  )

  ns <- 100
  P_seq <- seq(from = -5, to = 3, length.out = ns)
  # 1.53 is sd of log(population)
  # 9 is mean of log(population)
  pop_seq <- exp(P_seq * 1.53 + 9)

  lambda <- link(m11.10, data = data.frame(P = P_seq, cid = 1))
  lmu <- apply(lambda, 2, mean)
  lci <- apply(lambda, 2, PI)
  lines(pop_seq, lmu, lty = 2, lwd = 1.5)
  shade(lci, pop_seq, xpd = TRUE)

  lambda <- link(m11.10, data = data.frame(P = P_seq, cid = 2))
  lmu <- apply(lambda, 2, mean)
  lci <- apply(lambda, 2, PI)
  lines(pop_seq, lmu, lty = 1, lwd = 1.5)
  shade(lci, pop_seq, xpd = TRUE)
}, ar=1.8)

d_drop_hawaii <- subset(d, culture!='Hawaii')

# For some reason, we need to rescale and log to include the 'scale' attributes in the call to ulam.
d_drop_hawaii$P <- scale(log(d_drop_hawaii$population))
d_drop_hawaii$contact_id <- ifelse(d_drop_hawaii$contact == "high", 2, 1)

dat_drop_hawaii <- list(
  T = d_drop_hawaii$total_tools,
  P = d_drop_hawaii$P,
  cid = d_drop_hawaii$contact_id[1:9]
)

# interaction model
m_drop_hawaii <- ulam(
  alist(
    T ~ dpois(lambda),
    log(lambda) <- a[cid] + b[cid] * P,
    a[cid] ~ dnorm(3, 0.5),
    b[cid] ~ dnorm(0, 0.2)
  ),
  data = dat_drop_hawaii, chains = 4, log_lik = TRUE
)
flush.console()

k <- PSIS(m_drop_hawaii, pointwise = TRUE)$k

iplot(function() {
  par(mfrow=c(1,2))
  ## R code 11.47
  plot(dat_drop_hawaii$P, dat_drop_hawaii$T,
    xlab = "log population (std)", ylab = "total tools",
    col = rangi2, pch = ifelse(dat_drop_hawaii$cid == 1, 1, 16), lwd = 2,
    ylim = c(0, 75), cex = 1 + normalize(k)
  )

  # set up the horizontal axis values to compute predictions at
  ns <- 100
  P_seq <- seq(from = -1.4, to = 3, length.out = ns)

  # predictions for cid=1 (low contact)
  lambda <- link(m_drop_hawaii, data = data.frame(P = P_seq, cid = 1))
  lmu <- apply(lambda, 2, mean)
  lci <- apply(lambda, 2, PI)
  lines(P_seq, lmu, lty = 2, lwd = 1.5)
  shade(lci, P_seq, xpd = TRUE)

  # predictions for cid=2 (high contact)
  lambda <- link(m_drop_hawaii, data = data.frame(P = P_seq, cid = 2))
  lmu <- apply(lambda, 2, mean)
  lci <- apply(lambda, 2, PI)
  lines(P_seq, lmu, lty = 1, lwd = 1.5)
  shade(lci, P_seq, xpd = TRUE)

  ## R code 11.48
  plot(d_drop_hawaii$population, d_drop_hawaii$total_tools,
    xlab = "population", ylab = "total tools",
    col = rangi2, pch = ifelse(dat_drop_hawaii$cid == 1, 1, 16), lwd = 2,
    ylim = c(0, 75), cex = 1 + normalize(k)
  )

  ns <- 100
  P_seq <- seq(from = -5, to = 3, length.out = ns)
  # 1.53 is sd of log(population)
  # 9 is mean of log(population)
  pop_seq <- exp(P_seq * 1.53 + 9)

  lambda <- link(m_drop_hawaii, data = data.frame(P = P_seq, cid = 1))
  lmu <- apply(lambda, 2, mean)
  lci <- apply(lambda, 2, PI)
  lines(pop_seq, lmu, lty = 2, lwd = 1.5)
  shade(lci, pop_seq, xpd = TRUE)

  lambda <- link(m_drop_hawaii, data = data.frame(P = P_seq, cid = 2))
  lmu <- apply(lambda, 2, mean)
  lci <- apply(lambda, 2, PI)
  lines(pop_seq, lmu, lty = 1, lwd = 1.5)
  shade(lci, pop_seq, xpd = TRUE)
}, ar=1.8)
```

**11H1.** Use WAIC to compare the chimpanzee model that includes a unique intercept for each actor,
m11.4 (page 330), to the simpler models fit in the same section. Interpret the results.

**Answer.** The last model (`m11.4`) does the best by far because it includes the `actor` predictor.
The `actor` variable is highly predictive of the output; the big story of this experiment is
handedness.

```{code-cell} r
iplot(function() {
  plot(compare(m11.1, m11.2, m11.3, m11.4))
}, ar=3)
```

**11H2.** The data contained in `library(MASS);data(eagles)` are records of salmon pirating attempts
by Bald Eagles in Washington State. See `?eagles` for details. While one eagle feeds, sometimes
another will swoop in and try to steal the salmon from it. Call the feeding eagle the “victim” and
the thief the “pirate.” Use the available data to build a binomial GLM of successful pirating
attempts.

(a) Consider the following model:
$$
\begin{align} \\
y_i & \sim Binomial(n_i, p_i) \\
logit(p_i) & = \alpha + \beta_P P_i + \beta_V V_i + \beta_A A_i \\
α & \sim Normal(0, 1.5) \\
\beta_P, \beta_V, \beta_A & \sim Normal(0, 0.5) \\
\end{align}
$$

where $y$ is the number of successful attempts, $n$ is the total number of attempts, $P$ is a dummy
variable indicating whether or not the pirate had large body size, $V$ is a dummy variable
indicating whether or not the victim had large body size, and finally $A$ is a dummy variable
indicating whether or not the pirate was an adult. Fit the model above to the `eagles` data, using
both `quap` and `ulam`. Is the quadratic approximation okay?

**Answer.** The quadratic approximation is OK because this model includes pre-selected reasonable
priors.

```{code-cell} r
library(rethinking)
library(MASS)
data(eagles)
eag <- eagles
eag$Pi <- ifelse(eagles$P == "L", 1, 0)
eag$Vi <- ifelse(eagles$V == "L", 1, 0)
eag$Ai <- ifelse(eagles$A == "A", 1, 0)

mq_pirate_success <- quap(
  alist(
    y ~ dbinom(n, p),
    logit(p) <- a + b_P*Pi + b_V*Vi + b_A*Ai,
    a ~ dnorm(0, 1.5),
    b_P ~ dnorm(0, 0.5),
    b_V ~ dnorm(0, 0.5),
    b_A ~ dnorm(0, 0.5)
  ),
  data = eag
)

dat_eag <- list(
  n = eag$n,
  y = eag$y,
  Pi = eag$Pi,
  Vi = eag$Vi,
  Ai = eag$Ai
)

mu_pirate_success <- ulam(
  mq_pirate_success@formula,
  data = dat_eag, chains=4, cores=4, log_lik=TRUE
)

iplot(function() {
  plot(compare(mq_pirate_success, mu_pirate_success))
}, ar=4.5)
```

(b) Now interpret the estimates. If the quadratic approximation turned out okay, then it’s okay to
use the `quap` estimates. Otherwise stick to `ulam` estimates. Then plot the posterior predictions.
Compute and display both (1) the predicted **probability** of success and its 89% interval for each
row (i) in the data, as well as (2) the predicted success **count** and its 89% interval. What
different information does each type of posterior prediction provide?

**Answer.** The `eagles` data frame:

```{code-cell} r
display(eagles)
```

This graph is from `postcheck`, as mentioned in the text. The documentation on this function isn't
too helpful; it's easier to read the source code. In the following figure, the open circles
(**`$mean`** in the raw data) represent the predicted probability of success and the vertical lines
the 89% interval (**`$PI`**). The crosshairs represent the 89% interval of the predicted success
count (**`$outPI`**). The purple dots are observed outcomes from the `eagles` data frame above.
Notice outcomes are scaled to between zero and one; in case #1 the purple dot is at $17/24 \approx
0.7083$.

```{code-cell} r
iplot(function() {
  result <- postcheck(mu_pirate_success)
  display_markdown("The raw data:")
  display(result)
})
```

In part (1) we're visualizing model parameters (including uncertainty). In part (2) we're
visualizing implied predictions on the outcome scale (including uncertainty) which indirectly
includes the uncertainty in model parameters from the first part.

(c) Now try to improve the model. Consider an interaction between the pirate’s size and age
(immature or adult). Compare this model to the previous one, using WAIC. Interpret.

**Answer.** The non-interaction model appears to do slightly better, but generally speaking the
performance is almost the same. The interaction model is more complex (has more parameters) and that
might slightly hurt its score.

```{code-cell} r
eag$PirateTreatment <- 1 + eag$Pi + eag$Ai

dat_eag_inter <- list(
  n = eag$n,
  y = eag$y,
  PirateTreatment = eag$PirateTreatment,
  Vi = eag$Vi
)

mu_pirate_success_inter <- ulam(
  alist(
    y ~ dbinom(n, p),
    logit(p) <- a + b_t[PirateTreatment] + b_V*Vi,
    a ~ dnorm(0, 1.5),
    b_t[PirateTreatment] ~ dnorm(0, 0.5),
    b_V ~ dnorm(0, 0.5)
  ),
  data = dat_eag_inter, chains=4, cores=4, log_lik=TRUE
)

iplot(function() {
  plot(compare(mu_pirate_success_inter, mu_pirate_success))
}, ar=4.5)
```

[gc]: https://en.wikipedia.org/wiki/Groundcover

**11H4.** The data contained in `data(salamanders)` are counts of salamanders (*Plethodon
elongatus*) from 47 different 49-m² plots in northern California. The column `SALAMAN` is the count in
each plot, and the columns `PCTCOVER` and `FORESTAGE` are percent of [ground cover][gc] and age of trees
in the plot, respectively. You will model `SALAMAN` as a Poisson variable.

(a) Model the relationship between density and percent cover, using a log-link (same as the example
in the book and lecture). Use weakly informative priors of your choosing. Check the quadratic
approximation again, by comparing `quap` to `ulam`. Then plot the expected counts and their 89%
interval against percent cover. In which ways does the model do a good job? In which ways does it do
a bad job?

**Answer.** The `salamanders` data frame:

```{code-cell} r
data(salamanders)
display(salamanders)
sal <- salamanders
sal$StdPctCover <- scale(sal$PCTCOVER)

sal_dat <- list(
  S = sal$SALAMAN,
  StdPctCover = sal$StdPctCover
)

mq_sal <- quap(
  alist(
    S ~ dpois(lambda),
    log(lambda) <- a + b*StdPctCover,
    a ~ dnorm(3, 0.5),
    b ~ dnorm(0, 0.2)
  ), data = sal_dat
)

mu_sal <- ulam(
  mq_sal@formula,
  data = sal_dat, chains=4, cores=4, log_lik=TRUE
)
```

There doesn't seem to be a difference between `quap` and `ulam` in inference:

```{code-cell} r
iplot(function() {
  plot(compare(mu_sal, mq_sal))
}, ar=4.5)

pctc <- list(StdPctCover=scale(seq(0, 100)))
sims <- sim(mq_sal, data=pctc)

expectedSalCount.mu <- apply(sims, 2, mean)
expectedSalCount.PI <- apply(sims, 2, PI)
display_markdown("The raw data:")
display(expectedSalCount.mu)
display(expectedSalCount.PI)

iplot(function() {
  plot(pctc$StdPctCover, expectedSalCount.mu, ylim=c(0,12))
  shade(expectedSalCount.PI, pctc$StdPctCover)
  title("Expected salamander count")
})
```

The model does well (is more certain) when it needs to guess lower numbers; when there are fewer
salamanders when the ground cover is low. In general, though, it is uncertain about most of its
predictions.

(b) Can you improve the model by using the other predictor, `FORESTAGE`? Try any models you think
useful. Can you explain why `FORESTAGE` helps or does not help with prediction?

**Answer.** It doesn't seem forest age helps much with prediction; it may be that forest age only
predicts ground cover and so adds no extra information.

```{code-cell} r
sal$StdForestAge <- scale(sal$FORESTAGE)
sal_dat <- list(
  S = sal$SALAMAN,
  StdPctCover = sal$StdPctCover,
  StdForestAge = sal$StdForestAge
)

mq_sal_forest_age <- quap(
  alist(
    S ~ dpois(lambda),
    log(lambda) <- a + b_c*StdPctCover + b_f*StdForestAge,
    a ~ dnorm(3, 0.5),
    b_c ~ dnorm(0, 0.2),
    b_f ~ dnorm(0, 0.2)
  ), data = sal_dat
)

iplot(function() {
  plot(compare(mq_sal, mq_sal_forest_age))
}, ar=4.5)
```

```{code-cell} r
library(dagitty)
```

**11H4.** The data in `data(NWOgrants)` are outcomes for scientific funding applications for the
Netherlands Organization for Scientific Research (NWO) from 2010-2012 (see van der Lee and Ellemers
(2015) for data and context). These data have a very similar structure to the `UCBAdmit` data
discussed in the chapter. I want you to consider a similar question: What are the total and indirect
causal effects of gender on grant awards? Consider a mediation path (a pipe) through `discipline`.
Draw the corresponding DAG and then use one or more binomial GLMs to answer the question. What is
your causal interpretation? If NWO's goal is to equalize rates of funding between men and women,
what type of intervention would be most effective?

**Answer.** The `NWOGrants` data.frame:

```{code-cell} r
data(NWOGrants)
display(NWOGrants)
nwo <- NWOGrants
```

Reproduce the DAG from the text, where `D` now means `discipline` rather than department:

```{code-cell} r
nwo_dag <- dagitty('
dag {
    bb="0,0,1,1"
    A [pos="0.500,0.400"]
    D [pos="0.300,0.300"]
    G [pos="0.100,0.400"]
    D -> A
    G -> A
    G -> D
}')
iplot(function() plot(nwo_dag), scale=10)
```

For the total causal effect of gender on grant awards, do not condition on discipline:

```{code-cell} r
nwo_dat <- list(
  awards = nwo$awards,
  applications = nwo$applications,
  gid = ifelse(as.character(nwo$gender) == "m", 1, 2)
)
m_nwo_tot <- quap(
  alist(
    awards ~ dbinom(applications, p),
    logit(p) <- a[gid],
    a[gid] ~ dnorm(0, 1.5)
  ),
  data = nwo_dat
)
iplot(function() {
  display_markdown("Raw data:")
  x <- precis(m_nwo_tot, depth = 2)
  display(x)
  plot(x, main="m_nwo_tot")
}, ar=4.5)
```

[ct]: https://en.wikipedia.org/wiki/Contrast_(statistics)

These two coefficients are on the log-odds (parameter) scale, so the odds of a male getting an award
from an application is about $exp(-1.53) = 0.217$ and the odds of a female about $exp(-1.74) =
0.176$. If it helps you can convert these absolute odds to probabilities with $p = o/(1+o)$.

Lets also look at the relative performance of males to females (see [Contrast (statistics)][ct]). As
in the text we'll do so on the logit and probability scale:

```{code-cell} r
post <- extract.samples(m_nwo_tot)
diff_a <- post$a[,1] - post$a[,2]
diff_p <- inv_logit(post$a[,1]) - inv_logit(post$a[,2])
iplot(function() {
  display_markdown("Raw data:")
  x <- precis(list(diff_a=diff_a, diff_p=diff_p))
  display(x)
  plot(x, main="m_nwo_tot: contrast")
}, ar=4.5)
```

For the direct causal effect of gender on grant awards, condition on discipline:

```{code-cell} r
nwo_dat$disc_id <- rep(1:9, each = 2)
m_nwo_dir <- quap(
  alist(
    awards ~ dbinom(applications, p),
    logit(p) <- a[gid] + delta[disc_id],
    a[gid] ~ dnorm(0, 1.5),
    delta[disc_id] ~ dnorm(0, 1.5)
  ),
  data = nwo_dat
)
iplot(function() {
  display_markdown("Raw data:")
  x <- precis(m_nwo_dir, depth = 2)
  display(x)
  plot(x, main="m_nwo_dir")
}, ar=3)

post <- extract.samples(m_nwo_dir)
diff_a <- post$a[,1] - post$a[,2]
diff_p <- inv_logit(post$a[,1]) - inv_logit(post$a[,2])
iplot(function() {
  display_markdown("Raw data:")
  x <- precis(list(diff_a=diff_a, diff_p=diff_p))
  display(x)
  plot(x, main="m_nwo_dir: contrast")
}, ar=4.5)
```

Although the advantage for males has decreased, there is still some evidence for it.

One possible intervention is to increase funding to topics considered more valuable by females,
assuming they prefer to do research in the areas they are applying. Another is to encourage females
to get more involved (probably at a younger age) in the topics with more funding.

**11H5.** Suppose that the NWO Grants sample has an unobserved confound that influences both choice of
discipline and the probability of an award. One example of such a confound could be the career stage
of each applicant. Suppose that in some disciplines, junior scholars apply for most of the grants.
In other disciplines, scholars from all career stages compete. As a result, career stage influences
discipline as well as the probability of being awarded a grant. Add these influences to your DAG
from the previous problem. What happens now when you condition on discipline? Does it provide an
un-confounded estimate of the direct path from gender to an award? Why or why not? Justify your
answer with the backdoor criterion. If you have trouble thinking this though, try simulating fake
data, assuming your DAG is true. Then analyze it using the model from the previous problem. What do
you conclude? Is it possible for gender to have a real direct causal influence but for a regression
conditioning on both gender and discipline to suggest zero influence?

**Answer.** Reproducing the DAG from the text (where U is now career stage):

```{code-cell} r
nwo_career_stage_dag <- dagitty('
dag {
    bb="0,0,1,1"
    A [pos="0.500,0.400"]
    D [pos="0.300,0.300"]
    G [pos="0.100,0.400"]
    U [latent,pos="0.500,0.300"]
    D -> A
    G -> A
    G -> D
    U -> D
    U -> A
}')
iplot(function() plot(nwo_career_stage_dag), scale=10)
```

If we condition on `D` then we open the backdoor path 'G -> D <- U -> A', which could confound any
causal inferences we make about the effect of gender on award. That is, we will induce a statistical
association between `G` and `A`. This association could cancel out any direct causal influence of
`G` on `A`.

```{code-cell} r
# set.seed(145)
# n <- 100
# U <- rnorm(n)
# gid <- rbinom(n, 1, 0.5) + 1
# gender_to_disc_log_odds <- c(-0.2, 0.2)
# p_disc <- inv_logit(gender_to_disc_log_odds[gid] + U)
# disc_id <- rbinom(n, 1, p_disc) + 1
# gender_to_award_log_odds <- c(-1.5, -2)
# disc_to_award_log_odds <- c(0, 0)
# p_award <- inv_logit(gender_to_award_log_odds[gid] + U + disc_to_award_log_odds[disc_id])
# awards <- rbinom(n, 1, p_award)
#
# display_markdown("
# Imagine there are only two disciplines. Researchers with more scholarly experience tend to work in
# the second discipline, and females tend to work in the second discipline. If we know you're in the
# second discipline, and you got an award, then it's likely you got the award because you're
# experienced.
#
#
# We're assuming that discipline has no influence on award in this case; this assumption is not
# necessary for conditioning on discipline to connect (d-connect) gender and scholarly experience.
#
# G D U
# m 1 2
# f 1
# m 2 2
# f 2
```

**11H6.** The data in `data(Primates301)` are 301 primate species and associated measures. In this
problem, you will consider how brain size is associated with social learning. There are three parts.

(a) Model the number of observations of `social_learning` for each species as a function of the log
`brain` size. Use a Poisson distribution for the `social_learning` outcome variable. Interpret the
resulting posterior.

**Answer.** The `head` of the `Primates301` data.frame:

```{code-cell} r
data(Primates301)
display(head(Primates301, n = 20L))
prim_inc <- Primates301
prim <- prim_inc[complete.cases(prim_inc$social_learning, prim_inc$brain, prim_inc$research_effort), ]
```

After filtering for complete cases:

```{code-cell} r
display(head(prim, n = 20L))

brain_dat <- list(
  SocialLearning = prim$social_learning,
  LogBrain = log(prim$brain)
)

mq_brain_size <- quap(
  alist(
    SocialLearning ~ dpois(lambda),
    log(lambda) <- a + b * LogBrain,
    a ~ dnorm(3, 0.5),
    b ~ dnorm(0, 0.2)
  ),
  data = brain_dat
)

mu_brain_size <- ulam(
  mq_brain_size@formula,
  data = brain_dat, chains = 4, cores = 4, log_lik = TRUE
)
```

Use `func=PSIS` to generate warnings for high Pareto k values.

If you look at the data, you'll see some classes (e.g. Gorillas and Chimpanzees) have orders of
magnitude more study and more social learning examples than other species.

```{code-cell} r
iplot(function()
  plot(compare(mq_brain_size, mu_brain_size, func=PSIS))
, ar=4.5)

iplot(function() {
  display_markdown("<br/>Raw data:")
  x <- precis(mq_brain_size)
  display(x)
  plot(x, main="mq_brain_size")
}, ar=4.5)
```

Although the model is confident in the `b` coefficient, the wide error bars on the WAIC scores
indicate the out-of-sample performance may be much worse.

Still, in the context of this model it appears there is an association between brain size and social
learning. For every unit increase in `LogBrain` i.e. for every order of magnitude increase in brain
size we should see an exponential increase in examples of social learning. If we let $b = 1.5$ then
for every order of magnitude we'll see about $exp(1.5) \approx 4.5$ more examples of social
learning.

(b) Some species are studied much more than others. So the number of reported instances of
`social_learning` could be a product of research effort. Use the `research_effort` variable,
specifically its logarithm, as an additional predictor variable. Interpret the coefficient for log
`research_effort`. How does this model differ from the previous one?

```{code-cell} r
brain_dat$LogResearchEffort <- log(prim$research_effort)

mq_brain_research <- quap(
  alist(
    SocialLearning ~ dpois(lambda),
    log(lambda) <- a + b * LogBrain + d * LogResearchEffort,
    a ~ dnorm(3, 0.5),
    b ~ dnorm(0, 0.2),
    d ~ dnorm(0, 0.2)
  ),
  data = brain_dat
)

mu_brain_research <- ulam(
  mq_brain_research@formula,
  data = brain_dat, chains = 4, cores = 4, log_lik = TRUE
)
```

Again, use `func=PSIS` to generate warnings for high Pareto k values:

```{code-cell} r
iplot(function()
  plot(compare(mq_brain_research, mu_brain_research, func=PSIS))
, ar=4.5)

iplot(function() {
  display_markdown("<br/>Raw data:")
  x <- precis(mq_brain_research)
  display(x)
  plot(x, main="mq_brain_research")
}, ar=4.5)
```

**Answer.** When we start to condition on research effort, the influence of brain size drops dramatically
(to about 0.2 from 1.5).

(c) Draw a DAG to represent how you think the variables `social_learning`, `brain`, and
`research_effort` interact. Justify the DAG with the measured associations in the two models above
(and any other models you used).

**Answer.** It seems likely we were looking at the total causal effect of LogBrain in the first
model, and the direct causal effect in the second.

```{code-cell} r
brain_social_learning_dag <- dagitty('
dag {
    bb="0,0,1,1"
    LogBrain [pos="0.100,0.400"]
    LogResearchEffort [pos="0.300,0.300"]
    SocialLearning [pos="0.500,0.400"]
    LogBrain -> SocialLearning
    LogBrain -> LogResearchEffort
    LogResearchEffort -> SocialLearning
}')
iplot(function() plot(brain_social_learning_dag), scale=10)
```
