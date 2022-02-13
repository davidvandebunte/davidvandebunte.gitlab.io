source("iplot.R")
library(rethinking)

display_markdown(r"(
**16E1.** What are some disadvantages of generalized linear models (GLMs)?

**Answer.** Parameters are often not interpretable, and therefore it is difficult to set priors on
them.

When predictions disagree with observations, an understanding of the model provides a path to
improving it rather than simply tuning epicycles. That is, we have a path to do something about
errors.
)")
display_markdown(r"(
**16E2.** Can you think of one or more famous scientific models which do not have the additive
structure of a GLM?

**Answer.** All of Maxwell's equations, which are based on differential equations.
)")
display_markdown(r"(
**16E3.** Some models do not look like GLMs at first, but can be transformed through a logarithm
into an additive combination of terms. Do you know any scientific models like this?

**Answer.** Theories that are based on addition can be modeled directly in a GLM. Theories that are
based on multiplication would require a logarithm. Newton's law of universal gravitation is based on
the multiplication of two masses.
)")

source('practice-cylinder-exponent.R')
q16m1()
source('practice-cylinder-prior-predictive.R')
source('practice-lynx-hare-prior-predictive.R')
q16m3()
source('practice-spherical-man.R')
q16m4()

source('practice-panda-nut.R')
source('practice-autoregressive.R')
source('practice-mites.R')
