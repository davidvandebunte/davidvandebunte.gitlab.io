library(rethinking)
library(IRdisplay)

source("iplot.R")

display_markdown("
**7M4.** What happens to the effective number of parameters, as measured by PSIS or WAIC, as a prior
becomes more concentrated? Why? Perform some experiments, if you are not sure.

**ERROR**: There is no 'effective number of parameters' associated with PSIS. Also, section 7.4.2
recommends using the term 'overfitting penalty' rather than 'effective number of parameters', which
exists for historical reasons.

**Answer.** An informative prior will reduce the effect of the sample on the posterior, but will in
general lead to a posterior that is more concentrated (like the prior). A more concentrated
posterior will lead to lower variance, decreasing the penalty term.

The first of these experiments has vague priors; the second has informative priors:
")

data(cars)

cm1 <- quap(
  alist(
    dist ~ dnorm(mu, sigma),
    mu <- a + b * speed,
    a ~ dnorm(0, 100),
    b ~ dnorm(0, 10),
    sigma ~ dexp(1)
  ),
  data = cars
)

cm2 <- quap(
  alist(
    dist ~ dnorm(mu, sigma),
    mu <- a + b * speed,
    a ~ dnorm(-20, 5),
    b ~ dnorm(4, 1),
    sigma ~ dexp(1)
  ),
  data = cars
)
display(WAIC(cm1))
display(WAIC(cm2))

display_markdown("
**7M5.** Provide an informal explanation of why informative priors reduce overfitting.

[pcr]: https://github.com/stan-dev/stan/wiki/Prior-Choice-Recommendations

**Answer.** An informative prior reduces the influence of the sample on the posterior; the influence
of the sample is what causes overfitting.

See also [Prior Choice Recommendations][pcr].
")
display_markdown("
**7M6.** Provide an informal explanation of why overly informative priors result in underfitting.

**Answer.** An overly informative prior is overly skeptical; it claims to know more about the
problem at hand than the data does.
")

display_markdown("
**7H1.** In 2007, The Wall Street Journal published an editorial (“We’re Number One, Alas”) with a
graph of corporate tax rates in 29 countries plotted against tax revenue. A badly fit curve was
drawn in (reconstructed at right), seemingly by hand, to make the argument that the relationship
between tax rate and tax revenue increases and then declines, such that higher tax rates can
actually produce less tax revenue. I want you to actually fit a curve to these data, found in
`data(Laffer)`. Consider models that use tax rate to predict tax revenue. Compare, using WAIC or
PSIS, a straight-line model to any curved models you like. What do you conclude about the
relationship between tax rate and tax revenue?

**Answer.**

[wnoa]: https://www.wsj.com/articles/SB118428874152665452
[lc]: https://en.wikipedia.org/wiki/Laffer_curve

Related articles:
- [We're Number One, Alas (WSJ)][wnoa]
- [Laffer curve (Wikipedia)][lc]

The raw data “unbiased” by a line or curve:
")

data(Laffer)
iplot(function() plot(tax_revenue ~ tax_rate, Laffer))

display_markdown("A straight line model:")

lf1 <- quap(
  alist(
    tax_revenue ~ dnorm(mu, sigma),
    mu <- a + b * tax_rate,
    a ~ dnorm(0, 5),
    b ~ dnorm(0.1, 0.5),
    sigma ~ dexp(1)
  ),
  data = Laffer
)
post <- extract.samples(lf1)
tax_rate_seq <- seq(from = min(Laffer$tax_rate), to = max(Laffer$tax_rate), length.out = 100)
l <- link(lf1, data = list(tax_rate = tax_rate_seq))
mu <- apply(l, 2, mean)
ci <- apply(l, 2, PI)
iplot(function() {
  plot(tax_revenue ~ tax_rate, data = Laffer)
  lines(tax_rate_seq, mu)
  shade(ci, tax_rate_seq)
})
display(WAIC(lf1))
display(PSIS(lf1))

display_markdown("A curved (second order polynomial) model:")

lf2 <- quap(
  alist(
    tax_revenue ~ dnorm(mu, sigma),
    mu <- a + b[1] * tax_rate + b[2] * tax_rate^2,
    a ~ dnorm(0, 5),
    b ~ dnorm(0, 5),
    sigma ~ dexp(1)
  ),
  data = Laffer, start = list(b = rep(0, 2))
)
post <- extract.samples(lf2)
tax_rate_seq <- seq(from = min(Laffer$tax_rate), to = max(Laffer$tax_rate), length.out = 100)
l <- link(lf2, data = list(tax_rate = tax_rate_seq))
mu <- apply(l, 2, mean)
ci <- apply(l, 2, PI)
iplot(function() {
  plot(tax_revenue ~ tax_rate, data = Laffer)
  lines(tax_rate_seq, mu)
  shade(ci, tax_rate_seq)
})
display(WAIC(lf2))
display(PSIS(lf2))

iplot(function() plot(compare(lf1, lf2)), ar = 4)

display_markdown("
The curved model appears to be a better fit. The difference in WAIC between the two models is
significant but not definitive.
")

display_markdown("
**7H2.** In the Laffer data, there is one country with a high tax revenue that is an outlier. Use
PSIS and WAIC to measure the importance of this outlier in the models you fit in the previous
problem. Then use robust regression with a Student’s t distribution to revisit the curve fitting
problem. How much does a curved relationship depend upon the outlier point?

**Answer.** There are two major outliers:
")

PSIS_lf2 <- PSIS(lf2, pointwise = TRUE)
WAIC_lf2 <- WAIC(lf2, pointwise = TRUE)
iplot(function() {
  plot(PSIS_lf2$k, WAIC_lf2$penalty,
    xlab = "PSIS Pareto k",
    ylab = "WAIC penalty", col = rangi2, lwd = 2
  )
})

display_markdown(
  "The curved relationship flattens when this prior is adjusted:"
)

lf3 <- quap(
  alist(
    tax_revenue ~ dstudent(5, mu, sigma),
    mu <- a + b[1] * tax_rate + b[2] * tax_rate^2,
    a ~ dnorm(0, 5),
    b ~ dnorm(0, 5),
    sigma ~ dexp(1)
  ),
  data = Laffer, start = list(b = rep(0, 2))
)
post <- extract.samples(lf3)
tax_rate_seq <- seq(from = min(Laffer$tax_rate), to = max(Laffer$tax_rate), length.out = 100)
l <- link(lf3, data = list(tax_rate = tax_rate_seq))
mu <- apply(l, 2, mean)
ci <- apply(l, 2, PI)
iplot(function() {
  plot(tax_revenue ~ tax_rate, data = Laffer)
  lines(tax_rate_seq, mu)
  shade(ci, tax_rate_seq)
})
