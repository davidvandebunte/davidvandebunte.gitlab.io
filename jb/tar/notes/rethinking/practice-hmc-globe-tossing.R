source('iplot.R')
library(rethinking)

set.seed(7)
Water <- 6
Land <- 3
U_globe <- function(q) {
  p <- q[1]
  U_globe <- dbinom(Water, Water + Land, p, log=TRUE)
  return (-U_globe)
}

U_globe_gradient <- function(q) {
  p <- q[1]
  grad_p = Water/p + Land/(p-1)
  return (-grad_p)
}

Q_globe <- list()
Q_globe$q <- c(0.5)
n_samples <- 1000
step <- 0.02
L <- 4

p = iplot(function() {
  p <- rep(NA, n_samples)
  plot(NULL, ylab = "p", main = "HMC2 chain", xlab = "sample", xlim = c(1,n_samples), ylim = c(0, 1))
  p[1] <- Q_globe$q[1]
  points(1, p[1], pch = 4, col = "black")
  for (i in 2:n_samples) {
    Q_globe <- HMC2(U_globe, U_globe_gradient, step, L, Q_globe$q)
    p[i] = Q_globe$q
    points(i, p[i],
      pch = ifelse(Q_globe$accept == 1, 16, 1),
      col = ifelse(abs(Q_globe$dH) > 0.1, "red", "black")
    )
  }
  return (p)
})

iplot(function() {
  par(mfrow=c(1,2))
  plot(1:100, p[1:100], main="Samples from posterior", xlab="sample", ylab="p")
  dens(p, xlim = c(0, 1))
  curve(dbeta(x, Water + 1, Land + 1), lty = 2, add = TRUE)
  title(main="Sampled/analytical posterior")
}, ar=1.8)
