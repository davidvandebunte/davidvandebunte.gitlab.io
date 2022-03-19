source('iplot.R')
library(rethinking)

display_markdown("
**8H5.** Consider the `data(Wines2012)` data table. These data are expert ratings of 20 different
French and American wines by 9 different French and American judges. Your goal is to model `score`,
the subjective rating assigned by each judge to each wine. I recommend standardizing it. In this
problem, consider only variation among judges and wines. Construct index variables of `judge` and
`wine` and then use these index variables to construct a linear regression model. Justify your
priors. You should end up with 9 judge parameters and 20 wine parameters. How do you interpret the
variation among individual judges and individual wines? Do you notice any patterns, just by plotting
the differences? Which judges gave the highest/lowest ratings? Which wines were rated worst/best on
average?

**Answer.** Because we've centered and scaled `score`, both the `aj` and `aw` priors are also
centered at zero with a standard deviation of one. About 95% of the range of the output is within
two standard deviations of the mean, and since SD=1, we want to cover an absolute output range of
about 4. To allow selecting a wine or judge to select any score in this most probable output range,
we allow the intercepts to sit anywhere in this most probable output range.

John Foy gave the highest scores; Robert Hodgson gave the lowest. The white wine B2 got the highest
scores and the red wine I2 got the lowest.
")

data(Wines2012)
wines <- Wines2012
wines$jid <- as.integer(factor(wines$judge))
wines$wid <- as.integer(factor(wines$wine))
wines$score_std <- standardize(wines$score)

m_judges_wines <- quap(
  alist(
    score_std ~ dnorm(mu, sigma),
    mu ~ aj[jid] + aw[wid],
    aj[jid] ~ dnorm(0, 1),
    aw[wid] ~ dnorm(0, 1),
    sigma ~ dexp(1)
  ),
  data = wines
)

lab1 <- paste("aj[", 1:9, "]: ", levels(wines$judge), sep="")
lab2 <- paste("aw[", 1:20, "]: ", levels(wines$wine), sep="")
iplot(function() {
  plot(
    precis(m_judges_wines, depth=2),
    main="precis: m_judges_wines",
    labels=c(lab1, lab2, "sigma"),
    xlab="expected score (std)"
  )
})

display_markdown("
**8H6.** Now consider three features of the wines and judges:

1. `flight`: Whether the wine is red or white.
2. `wine.amer`: Indicator variable for American wines.
3. `judge.amer`: Indicator variable for American judges.

Use indicator or index variables to model the influence of these features on the scores. Omit the
individual judge and wine index variables from Problem 1. Do not include interaction effects yet.
Again justify your priors. What do you conclude about the differences among the wines and judges?
Try to relate the results to the inferences in the previous problem.

**Answer.** Priors were selected as in the previous problem, to cover the range of the output.

There is minor support for the hypothesis that American judges slightly prefer American wines, or
that French judges slightly prefer French wines. There is also minor support for the hypothesis that
French wines generally do better, suggesting the French judges prefer French wines.

John Foy and Linda Murphy gave the highest scores and were also American, so the bias may be coming
from their general optimism if they also preferred American wines. The highest scoring wines (B2 and
J2) were both French, and the lowest scoring was American (I2) so it may come down to individual
wines as well.
")

wines$fid <- as.integer(factor(wines$flight))
wines$awid <- as.integer(factor(wines$wine.amer))
wines$ajid <- as.integer(factor(wines$judge.amer))

m_flight_amer <- quap(
  alist(
    score_std ~ dnorm(mu, sigma),
    mu ~ af[fid] + aaw[awid] + aaj[ajid],
    af[fid] ~ dnorm(0, 1),
    aaw[awid] ~ dnorm(0, 1),
    aaj[ajid] ~ dnorm(0, 1),
    sigma ~ dexp(1)
  ),
  data = wines
)

lab1 <- paste("af[", 1:2, "]: ", levels(wines$flight), sep="")
lab2 <- paste("aaw[", 1:2, "]: ", as.integer(levels(factor(wines$wine.amer))), sep="")
lab3 <- paste("aaj[", 1:2, "]: ", as.integer(levels(factor(wines$judge.amer))), sep="")
iplot(function() {
  plot(
    precis(m_flight_amer, depth=2),
    main="precis: m_flight_amer",
    labels=c(lab1, lab2, lab3, "sigma"),
    xlab="expected score (std)"
  )
}, ar=3.2)
