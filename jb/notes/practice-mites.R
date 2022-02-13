library(rethinking)

source('iplot.R')

ask.mites <- r"(
**16H5.** Population dynamic models are typically very difficult to fit to empirical data. The
lynx-hare example in the chapter was easy, partly because the data are unusually simple and partly
because the chapter did the difficult prior selection for you. Here’s another data set that will
impress upon you both how hard the task can be and how badly Lotka-Volterra fits empirical data in
general. The data in `data(Mites)` are numbers of predator and prey mites living on fruit. Model
these data using the same Lotka-Volterra ODE system from the chapter. These data are actual counts
of individuals, not just their pelts. You will need to adapt the Stan code in
`data(Lynx_Hare_model)`. Note that the priors will need to be rescaled, because the outcome
variables are on a different scale. Prior predictive simulation will help. Keep in mind as well that
the time variable and the birth and death parameters go together. If you rescale the time dimension,
that implies you must also rescale the parameters.
)"

load.mites <- function() {
  data(Mites)
  display_markdown("The `Mites` data:")
  display(Mites)
  return(Mites)
}
mites.simple.model <- r"(
Notice the observations are usually 6-7 days apart. For modeling simplicity, we'll assume the
observations are evenly spaced. The raw data with this simpler x-axis is:
)"
plot.mites <- function(d) {
  display_markdown("<br/> The `Mites` data on a plot:")
  iplot(function() {
    plot(d$day, d$prey,
      main = "Mites", pch = 16,
      xlim = c(0, max(d$day)*1.05),
      ylim = c(0, max(d$prey)*1.05),
      xlab = "day", ylab = "population"
    )
    points(d$day, d$predator, col = rangi2, pch = 16)
  })
  display_markdown(mites.simple.model)
  iplot(function() {
    N = length(d$day)
    plot(1:N, d$prey,
      main = "Mites", pch = 16,
      ylim = c(0, max(d$prey)*1.05),
      xlab = "observation", ylab = "population"
    )
    points(1:N, d$predator, col = rangi2, pch = 16)
  })
}
english.mite.plot <- r"(
The cyclical trend is less clear than in the Lynx-Hare data (compare to Figure 16.6).
)"
plot.mite.prior <- function(init, theta) {
  iplot(function() {
    par(mar = c(4.0, 4.0, 0.2, 0.2))
    n_sim <- 3.5e4
    dt <- 0.001
    z <- sim.pred.prey(n_sim, as.numeric(init), as.numeric(theta), dt=dt)
    t <- dt*(1:n_sim)
    display(init) 
    display(theta) 
    plot(t, z[, 2],
      type = "l", ylim = c(0, max(z[,])), lwd = 2,
      xlab="observation", ylab="population"
    )
    lines(t, z[, 1], col = rangi2, lwd = 2)
  }, ar=2)
}
english.mites.decouple.pop <- r"(
<br/>
The two populations are starting to hit extreme values, unacceptable in a population model. To fix
this, let's reduce the two parameters associated with the coupling between the populations,
$m_{Prey}$ and $b_{Pred}$. If we were to decrease these parameters to zero we would completely
decouple the populations; we'll pick something less extreme:
)"
english.mite.birth.rates <- r"(
<br/>
We've recovered more normal cycles, but the prediction scale is still low. Let's increase birth
rates to further increase the implied predictions:
)"
english.mite.cycles <- r"(
<br/>
[nr]: https://en.wikipedia.org/wiki/Nyquist_rate
[lve]: https://en.wikipedia.org/w/index.php?title=Lotka%E2%80%93Volterra_equations&oldid=1057972095

At this point we're getting predictions on about the right output scale but this prior assumes mite
populations change too quickly. If you look at the raw data you'll see what looks like at most 5-6
cycles over the course of the 35 observations; if there were many more cycles we'd fail to capture
them with data at this frequency anyways (see [Nyquist rate][nr]).

To decrease the rate at which the populations change, let's inspect the original differential
equations. Using the variable names on [Lotka-Volterra equations][lve], we want to decrease both
$dx/dt$ and $dy/dt$. These rates are direct functions of all four parameters; to decrease them we
can decrease our four main parameters:
)"

sel.mite.priors <- function(d) {
  display_markdown("Let's select Mites priors starting from the Lynx-Hare model priors:")
  theta <- list(bPrey=1, mPrey=0.05, bPred=0.05, mPred=1)
  init <- list(initPred=10, initPrey=10)
  plot.mite.prior(init, theta)
  init <- list(initPred=100, initPrey=100)
  display_markdown("Scaling initial values:")
  plot.mite.prior(init, theta)
  display_markdown(english.mites.decouple.pop)
  theta <- list(bPrey=1, mPrey=0.02, bPred=0.02, mPred=1)
  plot.mite.prior(init, theta)
  display_markdown(english.mite.birth.rates)
  theta <- list(bPrey=5, mPrey=0.02, bPred=0.02, mPred=5)
  plot.mite.prior(init, theta)
  display_markdown(english.mite.cycles)
  theta <- list(bPrey=0.5, mPrey=0.002, bPred=0.002, mPred=0.5)
  plot.mite.prior(init, theta)
}
english.select.mites.prior.uncertainties <- r"(
<br/>
We've selected reasonable location parameters for our priors. Selecting the scale parameters is less
difficult; we'll skip those details and confirm that the combination of our scale and location
parameters (with a reasonable initial value prior) produces reasonable overall results. The next
five plots sample from the fully-specified prior:
)"

sim.mites.priors <- function() {
  display_markdown(english.select.mites.prior.uncertainties)
  set.seed(7)
  N <- 5
  iPred_sim <- rlnorm(N, meanlog=log(150), sdlog=1)
  iPrey_sim <- rlnorm(N, meanlog=log(150), sdlog=1)
  bPrey_sim <- abs(rnorm(N, mean=0.5, sd=0.2))
  mPrey_sim <- abs(rnorm(N, mean=0.002, sd=0.002))
  bPred_sim <- abs(rnorm(N, mean=0.002, sd=0.002))
  mPred_sim <- abs(rnorm(N, mean=0.5, sd=0.2))
  for (i in 1:length(bPrey_sim)) {
    init <- list(initPred=iPred_sim[i], initPrey=iPrey_sim[i])
    theta <- list(bPrey=bPrey_sim[i], mPrey=mPrey_sim[i], bPred=bPred_sim[i], mPred=mPred_sim[i])
    plot.mite.prior(init, theta)
  }
}
english.plot.mites.together <- r"(
<br/>
If we plot many posterior predictions (pairs of predator/prey traces) on a single plot as in the
text, it can be hard to identify which belong together:
)"
plot.combined.mites.posteriors <- function(d, prey_pred, pred_pred) {
  iplot(function() {
    N = length(d$day)
    plot(1:N, d$prey,
      main = "Combined Mites Posterior Predictions", pch = 16,
      ylim = c(0, max(d$prey)*1.05),
      xlab = "observation", ylab = "population"
    )
    points(1:N, d$predator, col = rangi2, pch = 16)
    for (s in 1:20) {
      lines(1:N, prey_pred[s,], col = col.alpha("black", 0.2), lwd = 2)
      lines(1:N, pred_pred[s,], col = col.alpha(rangi2, 0.3), lwd = 2)
    }
  })
}
english.plot.mites.separate <- r"(
<br/>
Let's take five snapshots of individual pairs instead:
)"
plot.separate.mites.posteriors <- function(d, prey_pred, pred_pred) {
  N = length(d$day)
  for (s in 1:5) {
    iplot(function() {
      plot(1:N, d$prey,
        main = paste("Mites Posterior Predictions #", s, sep=""), pch = 16,
        ylim = c(0, max(d$prey)*1.05),
        xlab = "observation", ylab = "population"
      )
      points(1:N, d$predator, col = rangi2, pch = 16)
      lines(1:N, prey_pred[s,], col = col.alpha("black", 0.2), lwd = 2)
      lines(1:N, pred_pred[s,], col = col.alpha(rangi2, 0.3), lwd = 2)
    })
  }
}
fit.mites.model <- function(d) {
  dat_list <- list(
    N = nrow(d),
    pelts = d[, 3:2]
  )
  m.mites <- stan(
    file = "mites.stan", data = dat_list,
    chains = 4, cores = 4, seed = 14,
    control = list(adapt_delta = 0.95)
  )
  display_markdown("A `pairs` plot: ")
  iplot(function() {
    pairs(m.mites, pars=c("theta", "pop_init", "sigma"))
  })
  flush.console()
  post <- extract.samples(m.mites)
  prey_pred = post$pop_pred[,,2]
  pred_pred = post$pop_pred[,,1]
  display_markdown(english.plot.mites.together)
  plot.combined.mites.posteriors(d, prey_pred, pred_pred)
  display_markdown(english.plot.mites.separate)
  plot.separate.mites.posteriors(d, prey_pred, pred_pred)
}
english.mites.summary <- r"(
As expected, the Lotka-Volterra model doesn't fit nearly as well to this data as it did to the
Lynx-Hare data.
)"
ask.answer.mites <- function() {
  display_markdown(ask.mites)
  display_markdown("**Answer.** Let's start by inspecting the data.")
  d <- load.mites()
  plot.mites(d)
  display_markdown(english.mite.plot)
  sel.mite.priors(d)
  sim.mites.priors()
  fit.mites.model(d)
  display_markdown(english.mites.summary)
}
ask.answer.mites()
