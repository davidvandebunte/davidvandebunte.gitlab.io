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

# Exercise 7.67

+++

> Suppose $𝑠$ is a person alive throughout the interval $𝑈$. Apply the above definition to the example $𝑝(𝑠,𝑡)$ = “person $𝑠$ is worried about news $𝑡$” from
Example 7.65. Here, $𝑇(𝑉)$ is the set of items that are in the news throughout the interval $𝑉$.
> 1. What open subset of $𝑈$ is $∀(𝑡: 𝑇). 𝑝(𝑠,𝑡)$ for a person $𝑠$?
> 2. Does it have the semantic meaning you’d expect, given the less formal description in Section 7.4.4?

<!-- ![x](raster/2023-11-25T15-06-48.png) delete-me -->

+++

## Author's solution

+++

> 1. The formula says that $∀(𝑡: 𝑇). 𝑝(𝑠,𝑡)$ “returns the largest open set $V ⊆ U$ for which $p(s|_V,t) = V$ holds for all $t ∈ T(V)$.” Note that $𝑇(𝑉)$ is the set of items that are in the news throughout the interval $𝑉$. Substituting, this becomes “the largest interval of time $𝑉 ⊆ 𝑈$ over which person $𝑠$ is worried
about news $𝑡$ for every item $𝑡$ that is in the news throughout $𝑉$.” In other words, for $𝑉$ to be nonempty, the person $𝑠$ would have to be worried about every single item of news throughout $𝑉$. My guess is that there's a festival happening or a happy kitten somewhere that person $𝑠$ is not worried about, but maybe I’m assuming that person $𝑠$ is sufficiently mentally “normal.” There may be people who are sometimes worried about literally everything in the news; we ask you to please be kind to them.
> 2. Yes, it is exactly the same description.

+++

## Alternative answer

+++

It returns the largest open set $V ⊆ U$ for which $p(s|_V,t) = V$ holds for all $t ∈ T(V)$. That is, it returns the largest open set where restricting the person $s$ to the interval $V$ is still the whole interval $V$ for all active news items. As in Example 7.65, this corresponds to when the person is worried about *everything* in the news (rather than just *something* i.e. *at least one thing*).
