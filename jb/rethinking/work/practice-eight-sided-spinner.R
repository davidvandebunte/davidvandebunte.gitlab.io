source("iplot.R")
library(rethinking)
library(data.table)

e15h7a <- r"(
**15H7.** Some lad named Andrew made an eight-sided spinner. He wanted to know if it is fair. So he
spun it a bunch of times, recording the counts of each value. Then he accidentally spilled coffee
over the 4s and 5s. The surviving data are summarized below.
)"
load.d15h7 <- function() {
  V = seq(8)
  Freq = c(18, 19, 22, NA, NA, 19, 20, 22)
  d <- data.frame(Value = V, Frequency = Freq)
  t_d <- transpose(d)
  colnames(t_d) <- rownames(d)
  rownames(t_d) <- colnames(d)
  display(t_d)
  return(d)
}
e15h7b <- r"(
Your job is to impute the two missing values in the table above. Andrew doesn’t remember how many
times he spun the spinner. So you will have to assign a prior distribution for the total number of
spins and then marginalize over the unknown total. Andrew is not sure the spinner is fair (every
value is equally likely), but he’s confident that none of the values is twice as likely as any
other. Use a Dirichlet distribution to capture this prior belief. Plot the joint posterior
distribution of 4s and 5s.
)"

e15h7c <- r"(
**Answer.** We could model this as a categorical distribution where we predict the category i.e. the
spinner value from no data; we don't need a predictor to spin. To do this, we'd have to expand the
given table into many trials. How would we model a variable number of observations, though?

To model a variable number of observations, it seems like we'd need to use the multinomial
distribution. It doesn't look like this distribution is available through `ulam`. It's also not
clear how we'd deal with what is essentially a single observation in this case.

What if you took the $Value$ as a categorical predictor? The assumption that no value is twice as
likely as any other would become the variance on a prior. But the Dirichlet distribution strongly
implies either a categorical or multinomial.

To plot the joint posterior distribution, use `pairs` on the model.

Skipping this question for now.
)"
q15h7 <- function() {
  display_markdown(e15h7a)
  d <- load.d15h7()
  display_markdown(e15h7b)
  display_markdown(e15h7c)
}
q15h7()
