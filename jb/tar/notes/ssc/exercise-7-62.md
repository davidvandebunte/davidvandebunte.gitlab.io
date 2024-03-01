---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.1
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Exercise 7.62

+++

<!-- ![x](raster/2023-11-25T14-57-07.png) -->

> Just now we described how a predicate $𝑝: 𝑆 → Ω$, such as “... likes the weather” acts on sections $𝑠 ∈ 𝑆(𝑈)$, say $𝑠 = Bob$. But by Definition 7.12, any predicate $𝑝: 𝑆 → Ω$ also defines a subobject of $\{𝑆\;|\;𝑝\} ⊆ 𝑆$. Describe the sections of this subsheaf.

+++

## Author's solution

+++

<!-- Image('raster/solution-7-62.png') delete-me -->

> 𝑆 is the sheaf of people, the set of which changes over time: a section in 𝑆 over any interval of time is a person who is alive throughout that interval. A section in the subobject {𝑆 | 𝑝} over any interval of time is a person who is alive *and likes the weather* throughout that interval of time.

+++

## Alternative answer

+++

Based on discussions in [Section 7.3](./7-3.md) it may be tempting to given an answer similar to:

> This subsheaf represents all the possible combinations of times and people where everyone likes the weather. The sections of this subsheaf represent specific combinations of times and people (who like the weather).

+++

This answer clashes with the author's answer. The author uses a more restrictive definition of a section for this "people sheaf" extended example, in particular one that requires that a person exist *throughout* (q.v. [throughout - Wiktionary](https://en.wiktionary.org/wiki/throughout)) the *interval* (q.v. [Interval (mathematics)](https://en.wikipedia.org/wiki/Interval_(mathematics))). Both these words imply the exclusion of a [disconnected space](https://en.wikipedia.org/wiki/Connected_space) such as April 2018 and May 2019. These are still seemingly allowed as truth-values.

In Example 7.65 the author adds even more emphasis to *throughout* by adding whole:

> ... a person that lasts throughout the *whole* of $𝑈$.

+++

Yet in Exercise 7.67, the author uses the language of "throughout the interval $U$" where $U$ is clearly an open subset (which must be allowed to be disconnected). In the [solution to Exercise 7.72](exercise-7-72.md) the author uses the term "throughout" without implying an interval.

+++

So in a world with only three timestamps, with Alice existing only at the first and Bob at the third timestamp, what are the sections of the people sheaf $S$ for the open set consisting of only the first and third timestamp? No one person exists *throughout* the *whole interval* because the open subset is not even an interval.

+++

Notice the "interval domain" of [Section 7.5](./7-5.md) uses "interval" in the name. One possible explanation for all of this back-and-forth is that the author is sometimes thinking in terms of the much more "general" interval domain, where sections aren't required to glue together. From [Temporal type theory](https://arxiv.org/pdf/1710.10258.pdf):

> We say a behavior type has composable sections when, for any two overlapping time window, behaviors over the first that match behaviors over the second can be glued to form a behavior over the union time window.

For example, one could define the set of sections for $o_{0,5}$ to include Alice and the set of sections for $o_{4,8}$ to include Bob, but the open set $𝑜_{[0,5]} ∪ 𝑜_{[4,8]}$ to include neither. This particular behavior type would simply not be based on composable sections.
