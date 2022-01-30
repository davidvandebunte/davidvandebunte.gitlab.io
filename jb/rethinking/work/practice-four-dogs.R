source("iplot.R")
library(rethinking)
library(data.table)

display_markdown(r"(
**15M6.** Return to the four dog-eats-homework missing data examples. Simulate each and then fit one
or more models to try to recover valid estimates for $S \rightarrow H$.

**Answer.** A model fit to completely observed (`co`) data and a model fit to complete cases (`cc`)
for the first scenario, where dogs eat homework at random:
)")

N <- 100
S <- rnorm(N)
H <- rbinom(N, size = 10, inv_logit(S))

D <- rbern(N) # dogs completely random
Hm <- H
Hm[D == 1] <- NA

d <- data.frame(S = S, H = H, Hm = Hm)
check_co <- function(d, name) {
  set.seed(27)
  dat.co <- list(
    S = d$S,
    H = d$H
  )
  m.dog.co <- ulam(
    alist(
      H ~ dbinom(10, p),
      logit(p) <- a + bS*S,
      a ~ dnorm(0, 1),
      bS ~ dnorm(0, 1)
    ), data=dat.co, cores=4, chains=4
  )
  display(precis(m.dog.co, depth=2), mimetypes="text/plain")
  iplot(function() {
    plot(precis(m.dog.co, depth=2), main=name)
  }, ar=4.0)
}
check_co(d, "m.dog.1.co")

check_cc <- function(d, name) {
  # browser()
  set.seed(27)
  d_cc <- d[complete.cases(d$Hm), ]
  # t_d <- transpose(d_cc)
  # colnames(t_d) <- rownames(d_cc)
  # rownames(t_d) <- colnames(d_cc)
  # display(t_d)
  dat.cc <- list(
    S = d_cc$S,
    Hm = d_cc$Hm
  )
  display_markdown("Sample of data remaining for 'complete case' analysis: ")
  display(head(d_cc))
  m.dog.cc <- ulam(
    alist(
      Hm ~ dbinom(10, p),
      logit(p) <- a + bS*S,
      a ~ dnorm(0, 1),
      bS ~ dnorm(0, 1)
    ), data=dat.cc, cores=4, chains=4
  )
  display(precis(m.dog.cc, depth=2), mimetypes="text/plain")
  iplot(function() {
    plot(precis(m.dog.cc, depth=2), main=name)
  }, ar=4.0)
}
check_cc(d, "m.dog.1.cc")

display_markdown(r"(
As expected (explained in the chapter) we are able to infer `bS` both with and without all the data.

In the second scenario, dogs of hard-working students eat homework. We don't need to fit a new
completely observed (`co`) model because it shouldn't be any different from `m.dog.1.co`. A model
fit to complete cases (`cc`):
)")

D2 <- ifelse(S > 0, 1, 0)
Hm2 <- H
Hm2[D2 == 1] <- NA
d <- data.frame(S = S, H = H, Hm = Hm2)
check_cc(d, "m.dog.2.cc")

display_markdown(r"(
As expected (explained in the chapter) we are able to infer `bS` both with and without all the data.

The text suggests a variation on scenario 2 where the function $S \rightarrow H$ is nonlinear
and unobserved only in the domain of the function where it is non-linear. Let's simulate this
scenario and attempt to infer the coefficient of the (wrong) linear function with and without all
the data:
)")
H3 <- ifelse(S > 0, H, 0)
Hm3 <- H3
Hm3[D2 == 1] <- NA
d <- data.frame(S = S, H = H3, Hm = Hm3)
check_co(d, "m.dog.2.var.co")
check_cc(d, "m.dog.2.var.cc")

display_markdown(r"(
As expected (explained in the chapter) both these inferences are wrong. The `cc` inference is wrong
because despite complete observability our model was linear when the function was non-linear. The
`co` inference is extra wrong because our sampling is also biased. The data going into this second
model is completely uninformative; all the `S` are random negative numbers and the `H` are 0. Notice
that we confusingly still get a positive inference for `bS`. The model wants to push everything in
the log link as negative as possible, but `a` is already as negative as it can be given our thin
tailed (normal) prior on it. We can push everything farther negative by making `bS` positive, since
all the `S` values are negative. Be skeptical of models that have any parameter inferences that are
extreme relative to the parameter's priors (like `a`)! These mean that either your prior is wrong,
your data, or your model.

The third scenario, where some unobserved variable like the noise level in the student's house
affects both the homework quality and whether dogs eat homework, is already partially covered in the
chapter. Let's consider the variation suggested in R code 15.14, however:
)")

N2 <- 1000
X <- rnorm(N2)
S2 <- rnorm(N2)
H4 <- rbinom(N2, size = 10, inv_logit(2 + S2 - 2 * X))
# D <- ifelse(X > 1, 1, 0)
D <- ifelse(abs(X) < 1, 1, 0)
Hm4 <- H4
Hm4[D == 1] <- NA
d <- data.frame(S = S2, H = H4, Hm = Hm4)
check_co(d, "m.dog.3.var.co")
check_cc(d, "m.dog.3.var.cc")

display_markdown(r"(
As expected (see the text) missingness makes the inference for `bS` worse than with complete
observability. We've changed the missingness function to remove small values rather than large
values. When we remove large values, the remaining observations are farther from a ceiling and
therefore the influence of predictors seems larger, which is what we want when we have an unobserved
variable. When we remove small values, the remaining observations are closer to a ceiling or a
floor and the influence of predictors seems smaller.

In the fourth scenario dogs eat bad homework. Little can be done to get a good inference:
)")

S.4 <- rnorm(N)
H.4 <- rbinom(N, size = 10, inv_logit(S.4))
D.4 <- ifelse(H.4 < 5, 1, 0)
Hm.4 <- H.4
Hm.4[D.4 == 1] <- NA
d <- data.frame(S = S.4, H = H.4, Hm = Hm.4)
check_cc(d, "m.dog.4.cc")
