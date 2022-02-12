source("iplot.R")
library(rethinking)
library(dagitty)

display_markdown(r"(
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
)")

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

display_markdown(r"(
Implied conditional independencies:
)")
display(impliedConditionalIndependencies(expected_dag))

display_markdown(r"(
<br/>
We will build two models, as the question suggests. The first will include both predictors, so we
can infer the direct/total causal effect of children on `UseContraception`:
)")
display(adjustmentSets(expected_dag, exposure="Children", outcome="UseContraception", effect="direct"))
display(adjustmentSets(expected_dag, exposure="Children", outcome="UseContraception", effect="total"))

display_markdown(r"(
<br/>
The first model will also predict the direct effect of `Age` on `UseContraception`:
)")
display(adjustmentSets(expected_dag, exposure="Age", outcome="UseContraception", effect="direct"))

display_markdown(r"(
<br/>
The second will include only `Age` so we can infer the total causal effect of `Age` on
`UseContraception`:
)")
display(adjustmentSets(expected_dag, exposure="Age", outcome="UseContraception", effect="total"))

display_markdown(r"(
<br/>
Fitting the first model:
)")

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
    logit(p) <- a_district[DistrictId] + b_district[DistrictId] * Urban + bAge * Age + a_children[Children],
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

display_markdown(r"(
Fitting the second model:
)")

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

display_markdown(r"(
In the first model, we see that with more children the likelihood of using birth control goes up, as
expected. The likelihood of using birth control also goes down with age, as expected if you assume
that younger women are more open to newer ideas like birth control.

In the second model we see the total causal effect of age on whether a woman uses birth control is
positive. That is, the older a woman is the more likely she is to use birth control. That is, the
tendency for a woman to use birth control as she gets older because she has more children is
stronger than the influence of changing acceptance of birth control.
)")
