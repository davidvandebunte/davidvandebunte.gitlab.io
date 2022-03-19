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

# Practice: Chp. 6

```{code-cell} r
source("iplot.R")
suppressPackageStartupMessages(library(rethinking))
```

**6E1.** List three mechanisms by which multiple regression can produce false inferences about
causal effects.

**Answer.** Multicollinearity, Post-treatment bias, and Collider bias (the Chapter's section
titles).

+++

**6E3.** List the four elemental confounds. Can you explain the conditional dependencies of each?

**Answer.** From the beginning of Section 6.4 (Confronting confounding):
- The Fork
- The Pipe
- The Collider
- The Descendant

[dswt]: http://dagitty.net/learn/dsep/index.html

For practice understanding which variables are 'connected' (dependent, covariate) without the help
of automatic tools, see the DAGitty tutorial [d-Separation Without Tears][dswt].

The Fork and Pipe actually have one and the same conditional dependency:

$$
X \perp \!\!\! \perp Y | Z
$$

The Collider has no conditional dependencies, but $X \perp Y$ unconditionally.

The Descendant is similar to the Collider. It still has $X \perp Y$ unconditionally, but has the
additional conditional dependencies:

$$
\begin{align}
X \perp \!\!\! \perp D | Z \\
Y \perp \!\!\! \perp D | Z
\end{align}
$$

Notice `X -> Z -> D` and `Y -> Z -> D` are Pipes in themselves.

+++

**6E4.** How is a biased sample like conditioning on a collider? Think of the example at the open of
the chapter.

**Answer.** In a biased sample you're presumably unaware of the additional variable; it's simply not
in your tables and generally not on your radar (e.g. in your causal diagram).

When you condition on a collider you are aware of the variable but instead choose to sample from the
part of your table that is biased toward a particular realization of the variable.

```{code-cell} r
source("practice-deconfound-chp6-models.R")
```

All three problems below are based on the same data. The data in `data(foxes)` are 116 foxes from 30
different urban groups in England. These foxes are like street gangs. Group size varies from 2 to 8
individuals. Each group maintains its own urban territory. Some territories are larger than others.
The area variable encodes this information. Some territories also have more avgfood than others. We
want to model the weight of each fox. For the problems below, assume the following DAG:

```{code-cell} r
source('load-fox-models.R')
iplot(function() plot(dag_foxes), scale=10)
display_markdown("Implied Conditional Dependencies:")
display(impliedConditionalIndependencies(dag_foxes))
```

**6H3.** Use a model to infer the total causal influence of area on weight. Would increasing the area
available to each fox make it heavier (healthier)? You might want to standardize the variables.
Regardless, use prior predictive simulation to show that your model’s prior predictions stay within
the possible outcome range.

**Answer.** We have nothing to condition on if we only care about the total causal effect of area on
weight:

```{code-cell} r
display(adjustmentSets(dag_foxes, exposure="area", effect="total"))
```

**Answer.** Assume the average area corresponds to the average weight in the priors ($\beta_0$):

```{code-cell} r
prior <- extract.prior(mfox_Weight_Area)
mu <- link(mfox_Weight_Area, post=prior , data=list( Area=c(-2,2) ) )
iplot(function() {
    plot( NULL , ylab="Weight", xlab="Area", xlim=c(-2,2) , ylim=c(-2,2) )
    for ( i in 1:50 ) lines( c(-2,2) , mu[i,] , col=col.alpha("black",0.4) )
})
```

Presumably because a larger area implies both more food (increasing weight) and a larger group
(decreasing weight, more mouths to feed) the total causal effect of area on weight is nearly zero:

```{code-cell} r
iplot(function() plot(coeftab(mfox_Weight_Area)), ar=3)
```

**6H4.** Now infer the causal impact of adding food to a territory. Would this make foxes heavier?
Which covariates do you need to adjust for to estimate the total causal influence of food?"

**Answer.** We have nothing to condition on if we only care about the total causal effect of food
on weight:

```{code-cell} r
display(adjustmentSets(dag_foxes, exposure="avgfood", effect="total"))
```

"**Answer.** Presumably because food also affects group size, and a larger group means more mouths
to feed, there appars to be no noticeable impact of more food on weight:

```{code-cell} r
iplot(function() plot(coeftab(mfox_Weight_Avgfood)), ar=3.5)
```

It's more interesting to look at the direct affect of food on weight. To see this we'll need to
adjust for groupsize:

```{code-cell} r
display(adjustmentSets(dag_foxes, exposure="avgfood", effect="direct"))
```

As expected, food has a positive influence on weight (`bAvgfood` is positive):

```{code-cell} r
iplot(function() plot(coeftab(mfox_Weight_AvgfoodGroupsize)), ar=3)
```

**6H5.** Now infer the causal impact of group size. Which covariates do you need to adjust for?
Looking at the posterior distribution of the resulting model, what do you think explains these data?
That is, can you explain the estimates for all three problems? How do they go together?

**Answer.** We need to adjust for only avgfood assuming we are interested in the total causal
effect of groupsize (otherwise avgfood would be a confounder):

```{code-cell} r
display(adjustmentSets(dag_foxes, exposure="groupsize", effect="total"))
```

See the model `mfox_Weight_AvgfoodGroupsize` above for a model that already includes only groupsize
and avgfood. As expected, groupsize has a negative influence on weight (`bGroupsize` is negative)
presumably because a bigger group means more mouths to feed.
