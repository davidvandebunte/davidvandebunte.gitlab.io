source("iplot.R")
library(rethinking)

display_markdown(r"(
**14H3.** Modify any models from 14H2 that contained that children variable and model the variable now
as a monotonic ordered category, like education from the week we did ordered categories. Education
in that example had 8 categories. Children here will have fewer (no one in the sample had 8
children). So modify the code appropriately. What do you conclude about the causal influence of each
additional child on use of contraception?

**ERROR:** The author uses the term *week* above as if he has a syllabus for the book.

**Answer.** Fitting the model:
)")

data(bangladesh)
bc_df <- bangladesh
bc_df$district_id <- as.integer(as.factor(bc_df$district))

bc_dat <- list(
  UseContraception = bc_df$use.contraception,
  DistrictId = bc_df$district_id,
  Urban = bc_df$urban,
  Age = standardize(bc_df$age.centered),
  Children = as.integer(bc_df$living.children),
  alpha = rep(2, 3)
)
m_bc_ordered_children <- ulam(
  alist(
    UseContraception ~ dbinom(1, p),
    logit(p) <- bC*sum(delta_j[1:Children]) + a_district[DistrictId] + b_district[DistrictId] * Urban + bAge * Age,
    c(a_district, b_district)[DistrictId] ~ multi_normal(c(a, b), Rho, sigma_intercepts_slopes),
    bC ~ normal(0, 1),
    a ~ normal(0, 2),
    b ~ normal(0, 0.5),
    bAge ~ normal(0, 0.5),
    sigma_intercepts_slopes ~ exponential(1),
    Rho ~ lkj_corr(2),
    vector[4]: delta_j <<- append_row( 0 , delta ),
    simplex[3]: delta ~ dirichlet( alpha )
  ),
  data = bc_dat, chains = 4, cores = 4, log_lik = TRUE
)
display(precis(m_bc_ordered_children, depth=3), mimetypes="text/plain")
iplot(function() {
  plot(precis(m_bc_ordered_children, depth=3), main="m_bc_ordered_children")
}, ar=0.4)

display_markdown(r"(
Notice in the `summary` of this data frame, above, that the women surveyed had a minimum of one and
a maximum of four children. It appears the maximum jump in likelihood of a woman using contraception
occurs after having the second child.
)")
