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

# Practice: Chp. 9

```{code-cell} r
source("iplot.R")
suppressPackageStartupMessages(library(rethinking))

options(mc.cores = parallel::detectCores())
```

**9E1.** Which of the following is a requirement of the simple Metropolis algorithm?
1. The parameters must be discrete.
2. The likelihood function must be Gaussian.
3. The proposal distribution must be symmetric.

**Answer.** The parameters do not need to be discrete; see the top of **9.2. Metropolis algorithms** and a
specific example of a non-discrete parameter in section **2.4.5. Markov chain Monte Carlo**.

The likelihood function does not need to be Gaussian, see the example in section **2.4.5. Markov
chain Monte Carlo**.

[mha]: https://en.wikipedia.org/wiki/Metropolis%E2%80%93Hastings_algorithm

The proposal distribution needs to be symmetric. See [Metropolis-Hastings algorithm][mha] and the
top of **9.2. Metropolis algorithms**.

+++

**9E2.** Gibbs sampling is more efficient than the Metropolis algorithm. How does it achieve this
extra efficiency? Are there any limitations to the Gibbs sampling strategy?

**Answer.** Gibbs sampling allows asymmetric proposals, which it takes advantage of by introducing
adaptive proposals. An adaptive proposal is one in which the distribution of proposed parameter
values adjusts intelligently. To achieve adaptive proposals it relies on conjugate priors.

One limitation to this approach is that some conjugate priors are pathological in shape. A second
limitation is that these conjugate-prior based adaptive proposals don't perform as well as HMC
adaptive proposals when there are a large number of dimensions.

+++

**9E3.** Which sort of parameters can Hamiltonian Monte Carlo not handle? Can you explain why?

**Answer.** HMC cannot handle discrete parameters. I'd guess this is because these parameters would
not be differentiable. If you're running a physics simulation, you need to be able to stop at any
point.

+++

**9E4.** Explain the difference between the effective number of samples, n_eff as calculated by
Stan, and the actual number of samples.

[mcmc]: https://en.wikipedia.org/wiki/Markov_chain_Monte_Carlo

**Answer.** All MCMC algorithms (Metropolis, Gibbs, HMC) naturally produce autocorrelated samples;
see [Markov chain Monte Carlo][mcmc]. The 'Leapfrog steps' and 'Step size' settings as described in
the text help avoid this autocorrelation. The effective number of parameters reported by Stan is an
estimate of the length of a Markov chain with no autocorrelation that would provide the same quality
of estimate as your chain.

+++

**9E5.** Which value should Rhat approach, when a chain is sampling the posterior distribution
correctly?

**Answer.** 1.00 from above.

+++

**9E6.** Sketch a good trace plot for a Markov chain, one that is effectively sampling from the
posterior distribution. What is good about its shape? Then sketch a trace plot for a malfunctioning
Markov chain. What about its shape indicates malfunction?

[sta]: https://en.wikipedia.org/wiki/Stationary_process

**Answer.** The good features of the traces in the upper plot are [Stationarity][sta], good mixing
to e.g. avoid autocorrelated samples, and that all three chains stick to the same regions.

The bad features of the lower plot are just the opposite.

```{code-cell} r
display_svg(file="good_trace_plot.svg", width=20, height=20)
```

+++

**9E7.** Repeat the problem above, but now for a trace rank plot.

**Answer.** The good feature of the top plot is that all three chains have about the same rank
histogram; they are exploring the same space.

The bad feature of the lower plot is that different chains are spending different amounts of time on
the same sample values.

```{code-cell} r
display_svg(file="good_trank_plot.svg", width=20, height=20)
```

```{code-cell} r
source("practice-debug-mcmc-inference.R")
```

**9H3.** Sometimes changing a prior for one parameter has unanticipated effects on other parameters.
This is because when a parameter is highly correlated with another parameter in the posterior, the
prior influences both parameters. Here’s an example to work and think through.

Go back to the leg length example in Chapter 6 and use the code there to simulate height and leg
lengths for 100 imagined individuals. Below is the model you fit before, resulting in a highly
correlated posterior for the two beta parameters. This time, fit the model using ulam:

R code 9.29

```R
m5.8s <- ulam(
 alist(
  height ~ dnorm( mu , sigma ) ,
  mu <- a + bl*leg_left + br*leg_right ,
  a ~ dnorm( 10 , 100 ) ,
  bl ~ dnorm( 2 , 10 ) ,
  br ~ dnorm( 2 , 10 ) ,
  sigma ~ dexp( 1 )
 ) , data=d, chains=4,
 start=list(a=10,bl=0,br=0.1,sigma=1) )
```

Compare the posterior distribution produced by the code above to the posterior distribution produced
when you change the prior for br so that it is strictly positive:

R code 9.30

```R
m5.8s2 <- ulam(
 alist(
  height ~ dnorm( mu , sigma ) ,
  mu <- a + bl*leg_left + br*leg_right ,
  a ~ dnorm( 10 , 100 ) ,
  bl ~ dnorm( 2 , 10 ) ,
  br ~ dnorm( 2 , 10 ) ,
  sigma ~ dexp( 1 )
 ) , data=d, chains=4,
 constraints=list(br='lower=0'),
 start=list(a=10,bl=0,br=0.1,sigma=1) )
```

Note the `constraints` list. What this does is constrain the prior distribution of br so that it has
positive probability only above zero. In other words, that prior ensures that the posterior
distribution for br will have no probability mass below zero. Compare the two posterior
distributions for m5.8s and m5.8s2. What has changed in the posterior distribution of both beta
parameters? Can you explain the change induced by the change in prior?

**ERROR**: These model names should be based on `m6.1` rather than `m5.8`.

```{code-cell} r
source('simulate-height-leg-lengths.R')

## R code 9.29
m5.8s <- ulam(
  alist(
    height ~ dnorm(mu, sigma),
    mu <- a + bl * leg_left + br * leg_right,
    a ~ dnorm(10, 100),
    bl ~ dnorm(2, 10),
    br ~ dnorm(2, 10),
    sigma ~ dexp(1)
  ),
  data = d, chains = 4, cores = 4,
  log_lik = TRUE,
  start = list(a = 10, bl = 0, br = 0.1, sigma = 1)
)

## R code 9.30
m5.8s2 <- ulam(
  alist(
    height ~ dnorm(mu, sigma),
    mu <- a + bl * leg_left + br * leg_right,
    a ~ dnorm(10, 100),
    bl ~ dnorm(2, 10),
    br ~ dnorm(2, 10),
    sigma ~ dexp(1)
  ),
  data = d, chains = 4, cores = 4,
  log_lik = TRUE,
  constraints = list(br = "lower=0"),
  start = list(a = 10, bl = 0, br = 0.1, sigma = 1)
)

iplot(function() {
  plot(precis(m5.8s), main="m5.8s")
}, ar=4.0)

iplot(function() {
  plot(precis(m5.8s2), main="m5.8s2")
}, ar=4.0)
```

**Answer.** The $\beta_l$ parameter inference has adjusted to the $\beta_r$ prior by becoming
negative.

+++

**9H4.** For the two models fit in the previous problem, use WAIC or PSIS to compare the effective
numbers of parameters for each model. You will need to use `log_lik=TRUE` to instruct `ulam` to
compute the terms that both WAIC and PSIS need. Which model has more effective parameters? Why?

**Answer.** The first model (`m5.8s`) has more effective parameters. The number of effective
parameters is based on variance in the posterior. By adding a prior we've apparently limited the
overfitting to noise that happens in the first model, leading to less variance in both $\beta_l$ and
$\beta_r$ and therefore less variance in the posterior.

```{code-cell} r
iplot(function() {
  plot(compare(m5.8s, m5.8s2))
}, ar=4.5)

display_markdown("m5.8s:")
display(WAIC(m5.8s), mimetypes="text/plain")

display_markdown("<br/> m5.8s2:")
display(WAIC(m5.8s2), mimetypes="text/plain")

# post <- extract.samples(m5.8s2)
# n_samples <- 1000
# logprob <- sapply(1:n_samples,
#   function(s) {
#     mu <- post$a[s] + post$bl[s]*d$leg_left + post$br[s]*d$leg_right
#     dnorm(d$height, mu, post$sigma[s], log=TRUE)
#   }
# )
# n_cases <- nrow(d)
# pWAIC <- sapply(1:n_cases, function(i) var(logprob[i,]) )
# display(sum(pWAIC))
```

```{code-cell} r
source('practice-metropolis-islands.R')
source('practice-metropolis-globe-tossing.R')
```

**9H7.** Can you write your own Hamiltonian Monte Carlo algorithm for the globe tossing data, using
the R code in the chapter? You will have to write your own functions for the likelihood and
gradient, but you can use the `HMC2` function.

**Answer.** The probability mass function for the binomial distribution is defined as:

$$
f(p, k, n) = \binom{n}{k}p^k(1-p)^{n-k}
$$

Taking the logarithm:
$$
\begin{align}
g(p, k, n) & = log(f(p, k, n)) = log\left(\binom{n}{k}p^k(1-p)^{n-k}\right) \\
g(p, k, n) & = log\left(\binom{n}{k}\right) + k·log(p) + (n-k)·log(1-p)
\end{align}
$$

And the derivative with respect to $p$:
$$
\begin{align}
\frac{\partial g(p, k, n)}{\partial p} & = \frac{\partial log\left(\binom{n}{k}\right)}{\partial p} + \frac{\partial k·log(p)}{\partial p} + \frac{\partial z(p,k,n)}{\partial p} \\
z(p, k, n) & = (n -k)·log(y) \\
y(p) & = 1 - p \\
\end{align}
$$

Notice that:
$$
\begin{align}
\frac{\partial z(p, k, n)}{\partial y} & = \frac{n -k}{y} \\
\frac{\partial y(p)}{\partial p} & = -1
\end{align}
$$

So that:
$$
\begin{align}
\frac{\partial g(p, k, n)}{\partial p} & = 0 + k/p + \frac{\partial z}{\partial y}\frac{\partial y}{\partial p} \\
\frac{\partial g(p, k, n)}{\partial p} & = k/p + \frac{n - k}{p - 1}
\end{align}
$$

To partially verify the above in sympy:
```python
p, n, k = symbols('p n k')
diff(log(p**k) - log((1-p)**(n-k)), p)
```

```{code-cell} r
source('practice-hmc-globe-tossing.R')
```
