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

# Practice: Chp. 12

```{code-cell} r
source("iplot.R")
suppressPackageStartupMessages(library(rethinking))
```

[bt]: https://en.wikipedia.org/wiki/Blood_type
[cv]: https://en.wikipedia.org/wiki/Categorical_variable
[ls]: https://en.wikipedia.org/wiki/Likert_scale
[od]: https://en.wikipedia.org/wiki/Ordinal_data

**12E1.** What is the difference between an ordered categorical variable and an unordered one?
Define and then give an example of each.

**Answer.** An ordered categorical variable is one in which the categories are ranked, but the
distance between the categories is not necessarily constant. An example of an ordered categorical
variable is the [Likert scale][ls]; an example of an unordered categorical variable is the [Blood
type][bt] of a person.

See also [Categorical variable][cv] and [Ordinal data][od].

**12E2.** What kind of link function does an ordered logistic regression employ? How does it differ
from an ordinary logit link?

**Answer.** It employs a cumulative link, which maps the probability of a category or any category
of lower rank (the cumulative probability) to the log-cumulative-odds scale. The major difference
from the ordinary logit link is the type of probabilties being mapped; the cumulative link maps
cumulative probabilities to log-cumulative-odds and the ordinary logit link maps absolute
probabilities to log-odds.

**12E3.** When count data are zero-inflated, using a model that ignores zero-inflation will tend to
induce which kind of inferential error?

**Answer.** A 'zero' means that nothing happened; nothing can happen either because the rate of
events is low because the process that generates events failed to get started. We may incorrectly
infer the rate of events is lower than it is in reality, when in fact it never got started.

+++

[ovd]: https://en.wikipedia.org/wiki/Overdispersion

**12E4.** Over-dispersion is common in count data. Give an example of a natural process that might
produce over-dispersed counts. Can you also give an example of a process that might produce
under-dispersed counts?

**Answer.** The sex ratios of families actually skew toward either all boys or girls; see [Overdispersion][ovd].

In contexts where the waiting time for a service is bounded (e.g. a store is only open a short time)
but the model still uses a Poisson distribution you may see underdispersed counts because large
values are simply not possible. If one queue feeds into another, and the first queue has a limited
number of workers, the waiting times for the second queue may be underdispersed because of the
homogeneity enforced by the bottleneck in the first queue.
")

display_markdown("
**12M1.** At a certain university, employees are annually rated from 1 to 4 on their productivity,
with 1 being least productive and 4 most productive. In a certain department at this certain
university in a certain year, the numbers of employees receiving each rating were (from 1 to 4): 12,
36, 7, 41. Compute the log cumulative odds of each rating.

**Answer.** As a list:

```{code-cell} r
freq_prod <- c(12, 36, 7, 41)
pr_k <- freq_prod / sum(freq_prod)
cum_pr_k <- cumsum(pr_k)
lco = list(log_cum_odds = logit(cum_pr_k))
display(lco)
```

**12M2.** Make a version of Figure 12.5 for the employee ratings data given just above.

```{code-cell} r
iplot(function() {
  off <- 0.04
  plot(
    1:4, cum_pr_k, type="b",
    main="Version of Figure 12.5 for Employee Ratings Data", xlab="response", ylab="cumulative proportion",
    ylim=c(0,1)
  )
  # See `simplehist`
  for (j in 1:4) lines(c(j,j), c(0,cum_pr_k[j]), lwd=3, col="gray")
  for (j in 1:4) lines(c(j,j)+off, c(if (j==1) 0 else cum_pr_k[j-1],cum_pr_k[j]), lwd=3, col=rangi2)
})
```

**12M3.** Can you modify the derivation of the zero-inflated Poisson distribution (ZIPoisson) from
the chapter to construct a zero-inflated binomial distribution?

**Answer.** Call $p_z$ the additional probability of a zero, and $p_b$ the probability of success
associated with the binomial distribution. The likelihood of observing a zero is:

$$
\begin{align}
Pr(0 | p_z,n,p_b) & = p_z + (1-p_z)Pr(0|n,p_b) \\
& = p_z + (1-p_z)\binom{n}{0}p_b^0(1-p_b)^{n-0} \\
& = p_z + (1-p_z)(1-p_b)^n
\end{align}
$$

The likelihood of observing a non-zero value $k$ is:
$$
\begin{align}
Pr(k | k>0,p_z,n,p_b) & = (1-p_z)Pr(k|n,p_b) \\
& = (1-p_z)\binom{n}{k}p_b^k(1-p_b)^{n-k}
\end{align}
$$

To construct a GLM, use a logit link with $p_z$ and $p_b$ (in the typical case where $n$ is known).

**12H1.** In 2014, a paper was published that was entitled “Female hurricanes are deadlier than male
hurricanes.” As the title suggests, the paper claimed that hurricanes with female names have caused
greater loss of life, and the explanation given is that people unconsciously rate female hurricanes
as less dangerous and so are less likely to evacuate.

Statisticians severely criticized the paper after publication. Here, you’ll explore the complete
data used in the paper and consider the hypothesis that hurricanes with female names are deadlier.
Load the data with:

R code 12.38

```R
library(rethinking)
data(Hurricanes)
```

Acquaint yourself with the columns by inspecting the help `?Hurricanes`. In this problem, you’ll
focus on predicting `deaths` using `femininity` of each hurricane’s name. Fit and interpret the
simplest possible model, a Poisson model of `deaths` using `femininity` as a predictor. You can use
`map` or `ulam`. Compare the model to an intercept-only Poisson model of deaths. How strong is the
association between femininity of name and deaths? Which storms does the model fit (retrodict) well?
Which storms does it fit poorly?

**Answer.** The `Hurricanes` data.frame with an index and a standardized femininity:

```{code-cell} r
data(Hurricanes)
hur <- Hurricanes
hur$index = 1:92
hur$StdFem = standardize(hur$femininity)
display(hur)

hur_dat = list(
  Deaths = hur$deaths,
  Femininity = hur$StdFem
)

m_hur_pois <- map(
  alist(
    Deaths ~ dpois(lambda),
    log(lambda) <- a + bFemininity * Femininity,
    a ~ dnorm(3, 0.5),
    bFemininity ~ dnorm(0, 1.0)
  ),
  data = hur_dat
)

m_hur_intercept <- map(
  alist(
    Deaths ~ dpois(lambda),
    log(lambda) <- a,
    a ~ dnorm(3, 0.5)
  ),
  data = hur_dat
)
```

The model with the femininity predictor appears to have inferred a minor but significant association
of deaths with femininity:

```{code-cell} r
iplot(function() {
  plot(precis(m_hur_pois), main="m_hur_pois")
}, ar=4.5)
```

The model with the femininity predictor performs only marginally better on WAIC than the
intercept-only model:

```{code-cell} r
iplot(function() {
  plot(compare(m_hur_pois, m_hur_intercept))
}, ar=4.5)
```

[ovd2]: https://en.wikipedia.org/wiki/Overdispersion

The model is not accurate when it attempts to retrodict the death toll on storms with many deaths.
The predictions it makes are less dispersed than the data, that is, the data are overdispersed
relative to the predictions ([Overdispersion][ovd2]).

```{code-cell} r
iplot(function() {
  result <- postcheck(m_hur_pois, window=92)
  display_markdown("The raw data:")
  display(result)
})
```

**12H2.** Counts are nearly always over-dispersed relative to Poisson. So fit a gamma-Poisson (aka
negative-binomial) model to predict `deaths` using `femininity`. Show that the over-dispersed model
no longer shows as precise a positive association between femininity and deaths, with an 89% interval
that overlaps zero. Can you explain why the association diminished in strength?

```{code-cell} r
data(Hurricanes)
hur <- Hurricanes
hur$index = 1:92
hur$StdFem = standardize(hur$femininity)

hur_dat = list(
  Deaths = hur$deaths,
  Femininity = hur$StdFem
)

m_hur_gamma_pois <- map(
  alist(
    Deaths ~ dgampois(lambda, phi),
    log(lambda) <- a + bFemininity * Femininity,
    a ~ dnorm(3, 0.5),
    bFemininity ~ dnorm(0, 1.0),
    phi ~ dexp(1)
  ),
  data = hur_dat
)
```

**Answer.** The model no longer infers an association of deaths with femininity:

```{code-cell} r
iplot(function() {
  plot(precis(m_hur_gamma_pois), main="m_hur_gamma_pois")
}, ar=4.5)
```

The association has diminished in strength because the influence of outliers are diminished. Notice
the storms with the greatest death toll are female in the original data: Diane, Camille, and Sandy.

**12H3.** In the data, there are two measures of a hurricane’s potential to cause death:
`damage_norm` and `min_pressure`. Consult `?Hurricanes` for their meanings. It makes some sense to
imagine that femininity of a name matters more when the hurricane is itself deadly. This implies an
interaction between femininity and either or both of `damage_norm` and `min_pressure`. Fit a series
of models evaluating these interactions. Interpret and compare the models. In interpreting the
estimates, it may help to generate counterfactual predictions contrasting hurricanes with masculine
and feminine names. Are the effect sizes plausible?

```{code-cell} r
data(Hurricanes)
hur <- Hurricanes
hur$index = 1:92
hur$StdFem = standardize(hur$femininity)
hur$StdDam = standardize(hur$damage_norm)
hur$StdPres = standardize(hur$min_pressure)
```

**Answer.** To get some unreasonable answers, lets go back to the Poisson distribution rather than
the Gamma-Poisson. It's likely this is what the authors of the original paper were using.

```{code-cell} r
hur_dat = list(
  Deaths = hur$deaths,
  StdFem = hur$StdFem,
  StdDam = hur$StdDam
)

m_fem_dam_inter <- quap(
  alist(
    Deaths ~ dpois(lambda),
    log(lambda) <- a + bFem * StdFem + bDam * StdDam + bFemDamInter * StdFem * StdDam,
    a ~ dnorm(3, 0.5),
    bFem ~ dnorm(0, 1.0),
    bDam ~ dnorm(0, 1.0),
    bFemDamInter ~ dnorm(0, 0.4)
  ),
  data = hur_dat
)
```

In the first model, lets assume an interaction between `femininity` and `damage_norm`. Damage is
unsurprisingly associated with more deaths. The model also believes there is a minor interaction
between damage and femininity, where together they increase deaths more than either alone.

```{code-cell} r
iplot(function() {
  plot(precis(m_fem_dam_inter), main="m_fem_dam_inter")
}, ar=4.5)

hur_dat = list(
  Deaths = hur$deaths,
  StdFem = hur$StdFem,
  StdPres = hur$StdPres
)

m_fem_pres_inter <- quap(
  alist(
    Deaths ~ dpois(lambda),
    log(lambda) <- a + bFem * StdFem + bPres * StdPres + bFemPresInter * StdFem * StdPres,
    a ~ dnorm(3, 0.5),
    bFem ~ dnorm(0, 1.0),
    bPres ~ dnorm(0, 1.0),
    bFemPresInter ~ dnorm(0, 0.4)
  ),
  data = hur_dat
)
```

In the second model, lets assume an interaction between `femininity` and `min_pressure`. Pressure is
unsurprisingly negatively associated with more deaths; lower pressure indicates a stronger storm.
There also appears to be a minor interaction between pressure and femininity, though now the
association is in the opposite direction. That is, when both pressure and femininity are positive,
which means the storm is weak and feminine, more deaths occur.

```{code-cell} r
iplot(function() {
  plot(precis(m_fem_pres_inter), main="m_fem_pres_inter")
}, ar=4.5)

hur_dat = list(
  Deaths = hur$deaths,
  StdFem = hur$StdFem,
  StdPres = hur$StdPres,
  StdDam = hur$StdDam
)

m_fem_dam_pres_inter <- quap(
  alist(
    Deaths ~ dpois(lambda),
    log(lambda) <- a + bFem * StdFem + bPres * StdPres + bDam * StdDam +
        bFemPresInter * StdFem * StdPres +
        bFemDamInter * StdFem * StdDam +
        bDamPresInter * StdDam * StdPres +
        bFDPInter * StdPres * StdDam * StdPres,
    a ~ dnorm(3, 0.5),
    bFem ~ dnorm(0, 1.0),
    bDam ~ dnorm(0, 1.0),
    bPres ~ dnorm(0, 1.0),
    bFemPresInter ~ dnorm(0, 0.4),
    bFemDamInter ~ dnorm(0, 0.4),
    bDamPresInter ~ dnorm(0, 0.4),
    bFDPInter ~ dnorm(0, 0.4)
  ),
  data = hur_dat
)
```

In the third model, lets assume interactions between all three predictors. The influence of
femininity has dropped significantly. The three-way interaction term is hard to interpret on the
parameter scale. Lets try to interpret it on the outcome scale.

```{code-cell} r
iplot(function() {
  plot(precis(m_fem_dam_pres_inter), main="m_fem_dam_pres_inter")
}, ar=3.5)
```

[ept]: https://en.wikipedia.org/wiki/Polyptych

To some extent this is a counterfactual plot rather than just a posterior prediction plot because
we're considering extremes of at least some predictors. Still, many of the predictors vary here only
within the range of the data.

In the following [Enneaptych][ept], we hold damage and pressure at typical values and vary
femininity. We observe the effect on deaths. Many of the effect sizes are inplausible. In the
bottom-right plot, notice an implication of the non-negative three-way interaction parameter: when
pressure is high and damage is low femininity has a dramatic effect on deaths.

```{code-cell} r
iplot(function() {
  par(mfrow=c(3,3))
  for (d in -1: 1) {
    for (p in -1:1) {
      sim_dat = data.frame(StdPres=p, StdDam=d, StdFem=seq(from=-2, to=2, length.out=30))
      s <- sim(m_fem_dam_pres_inter, data=sim_dat)
      plot(sim_dat$StdFem, colMeans(s),
        main=paste("StdPres = ", p, ",", "StdDam = ", d),
        type="l", ylab="Deaths", xlab="StdFem")
    }
  }
})
```

Ignoring the known outliers, PSIS believes the full interaction model performs best:

```{code-cell} r
iplot(function() {
  plot(compare(m_fem_dam_pres_inter, m_fem_pres_inter, m_fem_dam_inter, func=PSIS))
}, ar=4.5)
```

**12H4.** In the original hurricanes paper, storm damage (`damage_norm`) was used directly. This
assumption implies that mortality increases exponentially with a linear increase in storm strength,
because a Poisson regression uses a log link. So it’s worth exploring an alternative hypothesis:
that the logarithm of storm strength is what matters. Explore this by using the logarithm of
`damage_norm` as a predictor. Using the best model structure from the previous problem, compare a
model that uses `log(damage_norm)` to a model that uses `damage_norm` directly. Compare their
PSIS/WAIC values as well as their implied predictions. What do you conclude?

**Answer** We'll use the full interaction model as our baseline, though it probably doesn't matter
which model we start from.

```{code-cell} r
data(Hurricanes)
hur <- Hurricanes
hur$index = 1:92
hur$StdFem = standardize(hur$femininity)
hur$StdDam = standardize(hur$damage_norm)
hur$StdLogDam = standardize(log(hur$damage_norm))
hur$StdPres = standardize(hur$min_pressure)

hur_dat = list(
  Deaths = hur$deaths,
  StdFem = hur$StdFem,
  StdPres = hur$StdPres,
  StdDam = hur$StdDam
)

m_fem_dam_pres_inter <- quap(
  alist(
    Deaths ~ dpois(lambda),
    log(lambda) <- a + bFem * StdFem + bPres * StdPres + bDam * StdDam +
        bFemPresInter * StdFem * StdPres +
        bFemDamInter * StdFem * StdDam +
        bDamPresInter * StdDam * StdPres +
        bFDPInter * StdPres * StdDam * StdPres,
    a ~ dnorm(3, 0.5),
    bFem ~ dnorm(0, 1.0),
    bDam ~ dnorm(0, 1.0),
    bPres ~ dnorm(0, 1.0),
    bFemPresInter ~ dnorm(0, 0.4),
    bFemDamInter ~ dnorm(0, 0.4),
    bDamPresInter ~ dnorm(0, 0.4),
    bFDPInter ~ dnorm(0, 0.4)
  ),
  data = hur_dat
)
```

First we'll run `postcheck` on the baseline model. Notice there is more dispersion than in the plain
old Poisson model in **12H1**:

```{code-cell} r
iplot(function() {
  result <- postcheck(m_fem_dam_pres_inter, window=92)
  display_markdown("The raw data:")
  display(result)
})

hur_dat = list(
  Deaths = hur$deaths,
  StdFem = hur$StdFem,
  StdPres = hur$StdPres,
  StdLogDam = hur$StdLogDam
)

m_fem_logdam_pres_inter <- quap(
  alist(
    Deaths ~ dpois(lambda),
    log(lambda) <- a + bFem * StdFem + bPres * StdPres + bDam * StdLogDam +
        bFemPresInter * StdFem * StdPres +
        bFemDamInter * StdFem * StdLogDam +
        bDamPresInter * StdLogDam * StdPres +
        bFDPInter * StdPres * StdLogDam * StdPres,
    a ~ dnorm(3, 0.5),
    bFem ~ dnorm(0, 1.0),
    bDam ~ dnorm(0, 1.0),
    bPres ~ dnorm(0, 1.0),
    bFemPresInter ~ dnorm(0, 0.4),
    bFemDamInter ~ dnorm(0, 0.4),
    bDamPresInter ~ dnorm(0, 0.4),
    bFDPInter ~ dnorm(0, 0.4)
  ),
  data = hur_dat
)
```

Ignoring the known outliers, comparing the models using PSIS, it appears the `log(damage)` model
improves performance:

```{code-cell} r
iplot(function() {
  plot(compare(m_fem_dam_pres_inter, m_fem_logdam_pres_inter, func=PSIS))
}, ar=4.5)
```

Run `postcheck` to visualize how much the model has changed on the outcome scale:

```{code-cell} r
iplot(function() {
  result <- postcheck(m_fem_logdam_pres_inter, window=92)
  display_markdown("The raw data:")
  display(result)
})
```

**12H5.** One hypothesis from developmental psychology, usually attributed to Carol Gilligan,
proposes that women and men have different average tendencies in moral reasoning. Like most
hypotheses in social psychology, it is merely descriptive, not causal. The notion is that women are
more concerned with care (avoiding harm), while men are more concerned with justice and rights.
Evaluate this hypothesis, using the `Trolley` data, supposing that `contact` provides a proxy for
physical harm. Are women more or less bothered by contact than are men, in these data? Figure out
the model(s) that is needed to address this question.

**Answer.** The `head` of the `Trolley` data.frame:

```{code-cell} r
data(Trolley)
d <- Trolley
display(head(Trolley))
```

We'll start from model `m12.5` in the text, converting `bC` and `bIC` to index variables based on
gender. Before doing the conversion, lets reproduce the `precis` summary for `m12.5` in the text:

```{code-cell} r
dat <- list(
  R = d$response,
  A = d$action,
  I = d$intention,
  C = d$contact
)
m12.5 <- ulam(
  alist(
    R ~ dordlogit(phi, cutpoints),
    phi <- bA * A + bC * C + BI * I,
    BI <- bI + bIA * A + bIC * C,
    c(bA, bI, bC, bIA, bIC) ~ dnorm(0, 0.5),
    cutpoints ~ dnorm(0, 1.5)
  ),
  data = dat, chains = 4, cores = min(detectCores(), 4), log_lik=TRUE
)

iplot(function() {
  plot(precis(m12.5), main="m12.5")
}, ar=4)

dat <- list(
  R = d$response,
  A = d$action,
  I = d$intention,
  C = d$contact,
  gid = ifelse(d$male == 1, 2, 1)
)
m_trolley_care <- ulam(
  alist(
    R ~ dordlogit(phi, cutpoints),
    phi <- bA * A + bC[gid] * C + BI * I,
    BI <- bI + bIA * A + bIC[gid] * C,
    c(bA, bI, bIA) ~ dnorm(0, 0.5),
    bC[gid] ~ dnorm(0, 0.5),
    bIC[gid] ~ dnorm(0, 0.5),
    cutpoints ~ dnorm(0, 1.5)
  ),
  data = dat, chains = 4, cores = min(detectCores(), 4), log_lik=TRUE
)
flush.console()
```

The following plot shows the same `precis` summary after converting `bC` and `bIC` to index
variables based on gender. It appears women disapprove of contact more than men from this data and
model, lending some support to the theory:

```{code-cell} r
iplot(function() {
  plot(precis(m_trolley_care, depth=2), main="m_trolley_care")
}, ar=2.5)
```

Comparing the models using PSIS, to check for overfitting or outliers:

```{code-cell} r
iplot(function() {
  plot(compare(m12.5, m_trolley_care, func=PSIS))
}, ar=4.5)
```

**12H6.** The data in `data(Fish)` are records of visits to a national park. See `?Fish` for
details. The question of interest is how many fish an average visitor takes per hour, when fishing.
The problem is that not everyone tried to fish, so the `fish_caught` numbers are zero-inflated. As
with the monks example in the chapter, there is a process that determines who is fishing (working)
and another process that determines fish per hour (manuscripts per day), conditional on fishing
(working). We want to model both. Otherwise we’ll end up with an underestimate of rate of fish
extraction from the park.

You will model these data using zero-inflated Poisson GLMs. Predict `fish_caught` as a function
of any of the other variables you think are relevant. One thing you must do, however, is use a
proper Poisson offset/exposure in the Poisson portion of the zero-inflated model. Then use the
`hours` variable to construct the offset. This will adjust the model for the differing amount of
time individuals spent in the park.

**Answer.** The short documentation on `Fish`:

```{code-cell} r
display(help(Fish))

data(Fish)
```

The `head` of `Fish`:

```{code-cell} r
display(head(Fish))
```

Notice several outliers in the full dataframe (not represented in `head`):

```{code-cell} r
display(summary(Fish))
```

One complication introduced by the question and data is how to infer fish per 'average visitor' when
every observation includes several visitors, both adults and children. This solution disregards
children, assuming any fishing they do is offset by the time they take away from fishing. Addressing
`persons` can be done the same way we address `hours`, by treating it as an exposure. That is:
$$
\begin{align}
log \left(\frac{fish}{person \cdot hour}\right)  & = log(fish) - log(person \cdot hour) \\
                                    & = log(fish) - log(person) - log(hour)
\end{align}
$$

```{code-cell} r
fish_dat <- list(
  FishCaught = Fish$fish_caught,
  LogPersonsInGroup = log(Fish$persons),
  LogHours = log(Fish$hours)
)

m_fish <- ulam(
  alist(
    FishCaught ~ dzipois(p, fish_per_person_hour),
    log(fish_per_person_hour) <- LogPersonsInGroup + LogHours + al,
    logit(p) <- ap,
    ap ~ dnorm(-0.5, 1),
    al ~ dnorm(1, 2)
  ), data = fish_dat, chains = 4
)
flush.console()
```

The precision of the parameters, which is rather hard to interpret. We can take from `ap` that most
visitors who were a part of this survey chose to fish. That is, the probability of not fishing looks
solidly below 0.5, since `ap` is solidly negative and any score less than zero implies a probability
of less than 0.5:

```{code-cell} r
iplot(function() {
  plot(precis(m_fish))
}, ar=4.5)
```

Finally, a posterior check. Despite the large uncertainty in `ap` the model is still surprised by
outliers. An obvious alternative based on this chapter is a Gamma-Poisson, but this solution doesn't
pursue that.

```{code-cell} r
iplot(function() {
  result <- postcheck(m_fish, window=250)
  display_markdown("The raw data:")
  display(result)
})
```

[cd]: https://en.wikipedia.org/wiki/Causality#Counterfactual_theories
[bh]: https://en.wikipedia.org/wiki/Bradford_Hill_criteria
[ci]: https://en.wikipedia.org/wiki/Causal_inference#Definition

**12H7.** In the trolley data — `data(Trolley)` — we saw how education level (modeled as an ordered
category) is associated with responses. But is this association causal? One plausible confound is
that education is also associated with age, through a causal process: People are older when they
finish school than when they begin it. Reconsider the Trolley data in this light. Draw a DAG that
represents hypothetical causal relationships among response, education, and age. Which statical
model or models do you need to evaluate the causal influence of education on responses? Fit these
models to the trolley data. What do you conclude about the causal relationships among these three
variables?

**ERROR:**
> Which statical [sic] model or models do you need

**Answer.** Consider the following DAGs. Implicit in this list of DAGs is that the response would
never influence age or education. Because we already know that education is associated with the
response, we also only include DAGs where `Education` and `Response` are d-connected.

A more difficult question is what arrows to allow between education and age. Getting older does not
necessarily lead to more education, but education always leads to greater age. That is, someone
could stop schooling at any point in their lives. This perspective implies `Education` should cause
`Age`, because the choice to get a particular education is also a choice to get older before
continuing with 'real' work.

The issue with allowing this arrow is it contradicts the following definition of [Causal
dependence][cd] from David Lewis:

> An event E causally depends on C if, and only if, (i) if C had occurred, then E would have
> occurred, and (ii) if C had not occurred, then E would not have occurred.

Said another way, causality is almost always associated with the advancement of time. This is
inherent in the definition of causality above, and in lists (see #4) such as the [Bradford-Hill
criteria][bh]. See also the definition of [Causal inference][ci]. The `Age` covariate is confusingly
a measurement of time. It is perhaps best to think of `Age` as a measurement of the potential to get
education; greater `Age` indicates an individual is 'richer' in terms of time opportunity to get an
education.

Said yet another way, age is not controllable. We will get older regardless of whether we get an
education. Education on the other hand is clearly within our control. The issue seems to be that we
require two things to get a particular educational degree: a personal commitment to do so and an
investment of our time. We talk about investing our time when in the end we are always forced to
invest it in something; we can't choose to stay in a frozen present.

Said yet another way, we should not confuse prediction and causal inference. Someone's education may
help us predict their age, but this does not imply the relationship is causal.

Described as a rule for DAGs, indirect measures of time (like Age) can only have arrows pointing out
of them. A convenient side effect of this rule is that to get the total causal effect of a variable
like `Age` there should never be any back door paths to close.

Do these rules contradict general relativity? If there was a variable for how fast or far someone
had traveled in their life (e.g. if they were an astronaut) couldn't that cause a change in their
Age? Perhaps in this extra special case you'd need to define a standardized time that all other time
measurements were made relative to.

This perspective leads to other questions. Age does not necessarily indicate the level of education
we will eventually achieve. Are people who had a healthy upbringing, e.g. with more material
resources, more or less likely to provide disapproving responses, and also more or less likely to
get an education? There are plenty of possible confounds that could influence both eventual
education level and response, such as temperament. Would a 14 year old who will eventually get a PhD
answer the same way to these questions now and after they finish their PhD?

Practially speaking, based on the wording in the question and the last paragraph of section 12.4, it
seems the author wanted readers to only consider that `Age` influences `Education` (not vice versa).

See also the next question, which adds a few more comments on this issue.

Conditional independencies, if any, are listed under each DAG.

In this first model, education is a mediator between age and response:

```{code-cell} r
library(dagitty)

age_dag <- dagitty('
dag {
    bb="0,0,1,1"
    Age [pos="0.4,0.2"]
    Education [pos="0.6,0.2"]
    Response [pos="0.5,0.3"]
    Age -> Education
    Education -> Response
}')
iplot(function() plot(age_dag), scale=10)
display(impliedConditionalIndependencies(age_dag))
```

In this model, all variables are associated regardless of conditioning:

```{code-cell} r
mediator_dag <- dagitty('
dag {
    bb="0,0,1,1"
    Age [pos="0.4,0.2"]
    Education [pos="0.6,0.2"]
    Response [pos="0.5,0.3"]
    Age -> Education
    Age -> Response
    Education -> Response
}')
iplot(function() plot(mediator_dag), scale=10)
display(impliedConditionalIndependencies(mediator_dag))
```

In this model, education has no direct causal effect on the response:

```{code-cell} r
independent_dag <- dagitty('
dag {
    bb="0,0,1,1"
    Age [pos="0.4,0.2"]
    Education [pos="0.6,0.2"]
    Response [pos="0.5,0.3"]
    Age -> Education
    Age -> Response
}')
iplot(function() plot(independent_dag), scale=10)
display(impliedConditionalIndependencies(independent_dag))
```

This answer will not consider this model because, as stated above, it seems more reasonable to
assume that age leads to education than vice versa. Notice it has the same conditional
independencies as the last model, and we could construct similar models where `Education -> Age` and
with the same conditional independencies as the first and second models. Although that approach
would work for this question, see comments in the next question.

```{code-cell} r
independent_dag <- dagitty('
dag {
    bb="0,0,1,1"
    Age [pos="0.4,0.2"]
    Education [pos="0.6,0.2"]
    Response [pos="0.5,0.3"]
    Education -> Age
    Age -> Response
}')
iplot(function() plot(independent_dag), scale=10)
display(impliedConditionalIndependencies(independent_dag))
```

To test which model is correct, we only need one more model beyond what we learned from `m12.6` in
the text: a model that includes age as a predictor. If we find that the education coefficient `bE`
is near zero in this model, the third causal model is correct. If we find that the age coefficient
is near zero, the first causal model is correct. If both coefficients are non-zero, we can infer the
second causal model is correct. Of course, all causal inferences are limited by the variables we are
considering.

```{code-cell} r
data(Trolley)
d <- Trolley

edu_levels <- c(6, 1, 8, 4, 7, 2, 5, 3)
d$edu_new <- edu_levels[d$edu]

dat <- list(
  R = d$response,
  action = d$action,
  intention = d$intention,
  contact = d$contact,
  E = as.integer(d$edu_new),
  StdAge = standardize(d$age),
  alpha = rep(2, 7)
)

m_trolley_age <- ulam(
  alist(
    R ~ ordered_logistic(phi, kappa),
    phi <- bE * sum(delta_j[1:E]) + bStdAge * StdAge + bA * action + bI * intention + bC * contact,
    kappa ~ normal(0, 1.5),
    c(bA, bI, bC, bE, bStdAge) ~ normal(0, 1),
    vector[8]:delta_j <<- append_row(0, delta),
    simplex[7]:delta ~ dirichlet(alpha)
  ),
  data = dat, chains = 4, cores = min(detectCores(), 4), iter=2000
)

iplot(function() {
  plot(precis(m_trolley_age, depth=2), main="m_trolley_age")
}, ar=1.8)
display_markdown("Raw data (preceding plot):")
display(precis(m_trolley_age, depth = 2), mimetypes="text/plain")
```

As implied in the text, it is not correct to causally infer the associated of education `bE` is
negative based on `m12.6`. In this model, the association of education with response has reversed,
becoming positive. Since the error bars on neither `bStdAge` or `bE` cross zero, we'll infer for now
that the second causal model above is correct.

**12H8.** Consider one more variable in the trolley data: Gender. Suppose that gender might influence
education as well as response directly. Draw the DAG now that includes response, education, age, and
gender. Using only the DAG, is it possible that the inferences from 12H7 above are confounded by
gender? If so, define any additional models you need to infer the causal influence of education on
response. What do you conclude?

**Answer.** First, lets consider a DAG that doesn't work. In the following DAG we assume
`Education -> Age` rather than that `Age -> Gender`:

```{code-cell} r
incorrect_dag <- dagitty('
dag {
    bb="0,0,1,1"
    Education [pos="0.4,0.2"]
    Age [pos="0.6,0.2"]
    Response [pos="0.5,0.3"]
    Gender [pos="0.3,0.3"]
    Education -> Age
    Education -> Response
    Age -> Response
    Gender -> Education
    Gender -> Response
}')
iplot(function() plot(incorrect_dag), scale=10)
display(impliedConditionalIndependencies(incorrect_dag))
```

With the additions implied by this question, this DAG implies that `Gender` will be able to predict
`Age` without conditioning, which is not correct.

Instead, we'll add this question's covariate to the second model from the last question:

```{code-cell} r
gender_dag <- dagitty('
dag {
    bb="0,0,1,1"
    Age [pos="0.4,0.2"]
    Education [pos="0.6,0.2"]
    Response [pos="0.5,0.3"]
    Gender [pos="0.7,0.3"]
    Age -> Education
    Education -> Response
    Age -> Response
    Gender -> Education
    Gender -> Response
}')
iplot(function() plot(gender_dag), scale=10)
display(impliedConditionalIndependencies(gender_dag))
```

This DAG implies `Age` will always be independent of `Gender`, which seems reasonable in this
context, ignoring that females live slightly longer than males. To infer either the direct or total
causal effect of `Education` on `Response` the required adjustment is to condition on both `Age` and
`Gender`:

```{code-cell} r
display(adjustmentSets(gender_dag, exposure="Education", outcome="Response", effect="total"))
```

We can do so by fitting a model that includes all three variables as predictors of `Response`:

```{code-cell} r
data(Trolley)
d <- Trolley

edu_levels <- c(6, 1, 8, 4, 7, 2, 5, 3)
d$edu_new <- edu_levels[d$edu]

dat <- list(
  R = d$response,
  action = d$action,
  intention = d$intention,
  contact = d$contact,
  E = as.integer(d$edu_new),
  StdAge = standardize(d$age),
  gid = ifelse(d$male == 1, 2, 1),
  alpha = rep(2, 7)
)

# This fit takes more than three hours with 4 chains/cores.
m_trolley_gender <- ulam(
  alist(
    R ~ ordered_logistic(phi, kappa),
    phi <- bE * sum(delta_j[1:E]) + bStdAge * StdAge + bGender[gid]
        + bA * action + bI * intention + bC * contact,
    kappa ~ normal(0, 1.5),
    bGender[gid] ~ normal(0, 1),
    c(bA, bI, bC, bE, bStdAge) ~ normal(0, 1),
    vector[8]:delta_j <<- append_row(0, delta),
    simplex[7]:delta ~ dirichlet(alpha)
  ),
  data = dat, chains = 2, cores = min(detectCores(), 2), iter=1600
)
flush.console()

iplot(function() {
  plot(precis(m_trolley_gender, depth=2), main="m_trolley_gender")
}, ar=1.8)
display_markdown("Raw data (preceding plot):")
display(precis(m_trolley_gender, depth = 2), mimetypes="text/plain")
```

At this point, education appears to have no causal effect on response. That is, the mean and HPDI of
`bE` are near zero.
