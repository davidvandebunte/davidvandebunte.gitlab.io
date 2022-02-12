library(rethinking)

source('iplot.R')
source('practice-cylinder-exponent.R')

e16m4 <- r"(
**16M4.** Modify the cylinder height model to use a sphere instead of a cylinder. What choices do
you have to make now? Is this a better model, on a predictive basis? Why or why not?

**Answer.** Fitting the previous model, for reference:
)"
e16m4a <- r"(
A spherical man (or cow) doesn't seem as helpful for selecting intelligent priors like `p`. On the
other hand, even the cyclinder model required us to pick a prior for `k` that was based on a fit to
maximums in the data rather than introducing more helpful independent information from our
experiences. When we select priors based on maximums we're only easing the fitting process rather
than potentially improving the model's inferences. Still, the process of scaling inputs based on
maximums improves our ability to interpret model internals like the priors, which we need to
interpret again as the posterior.

The explicitly stated model:
$$
W = kV = k \cdot \frac{4}{3} \pi r^3
$$

Using $h = 2r$:
$$
W = k \cdot \frac{\pi}{6} h^3
$$

We'll use a similar equation to the one in the text (based on maximums) to select the prior for `k`
in this scenario:
$$
1 = k \cdot \frac{\pi}{6} 1^3
$$

Solving for `k`:
$$
k = \frac{6}{\pi}
$$

Fitting the new model:
)"
fmsph <- function(d) {
  msph <- ulam(
    alist(
      w ~ dlnorm(mu, sigma),
      exp(mu) <- 3.141593 * k * h^3,
      k ~ exponential(3.141593 / 6),
      sigma ~ exponential(1)
    ),
    data = d, chains = 4, cores = 4
  )
  display_precis(msph, "msph", ar=4.0)
  vcpp(msph, d)
  return(msph)
}
e16m4b <- r"(
We've replaced the `k` and `p` parameters, which were previously non-identifiable with respect to
one another, with a single parameter. With this change the number of effective samples has improved
dramatically, but the posterior predictions are essentially the same.
)"
q16m4 <- function() {
  display_markdown(e16m4)
  d <- load.d16m1()
  m16.1 <- fm16m1(d)
  display_markdown(e16m4a)
  msph <- fmsph(d)
  display_markdown(e16m4b)
}
