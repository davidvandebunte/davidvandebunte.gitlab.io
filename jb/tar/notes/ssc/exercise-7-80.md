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

# Exercise 7.80

+++

<!-- ![x](raster/2023-12-09T14-55-26.png) delete-me -->

> Let's check that Example 7.79 makes sense. Fix any topological space $(𝑋, \textbf{Op}_𝑋)$ and any subset $𝑅 ⊆ 𝕀ℝ$ of the interval domain. Define $H_𝑋(𝑈) := \{ 𝑓 : 𝑈 ∩ R → 𝑋 \enspace | \enspace \text{𝑓 is continuous}\}$.
> 1. Is $𝐻_𝑋$ a presheaf? If not, why not; if so, what are the restriction maps?
> 2. Is $𝐻_𝑋$ a sheaf? Why or why not?

+++

## Author's solution

+++

> 1. $𝐻_𝑋$ is a presheaf: given $𝑉 ⊆ 𝑈$ the restriction map sends the continuous function $𝑓 : 𝑈 ∩ 𝑅 → 𝑋$ to its restriction along the subset $𝑉 ∩ 𝑅 ⊆ 𝑈 ∩ 𝑅$.
> 2. It is a sheaf: given any family $𝑈_𝑖$ of open sets with $𝑈 = \bigcup_i 𝑈_𝑖$ and a continuous function $𝑓_𝑖: 𝑈_𝑖 ∩ 𝑅 → 𝑋$ for each $𝑖$, agreeing on overlaps, they can be glued together to give a continuous function on all of $𝑈 ∩ 𝑅$, since $𝑈 ∩ 𝑅 = (\bigcup 𝑈_𝑖) ∩ 𝑅 = \bigcup_𝑖 (𝑈_𝑖 ∩ 𝑅)$.

+++

## Alternative answer

+++

Regarding `1.`, for $H_X$ to be a presheaf we need it to preserve identities and composition. The restriction maps are given by restricting a continuous function $f$ on $U ∩ R$ to a smaller open subset $V ∩ R$, which again is a continuous function. These restriction maps should preserve identities because there will be no change in the continuous functions when they are restricted from $U$ to $U$, i.e. from a domain of $𝑈 ∩ R$ to $𝑈 ∩ R$. They should preserve composition because restricting a function from $U ∩ R$ to $W ∩ R$ should be no different than restricting it from $U ∩ R$ to $V ∩ R$ to $W ∩ R$ where $W ⊆ V ⊆ U$.

+++

Regarding `2.`, for $H_X$ to be a sheaf there must be a unique gluing $f$ of the continuous functions $f_i$ and $f_j$ that agree on the overlap of their domains $U_i$ and $U_j$. Since the functions are continuous, agreement on their overlap means that at the boundary between their definitions they will be equal, and hence any gluing will be continuous as well. An additional restriction from $U$ to $U ∩ R$ before or after the gluing should not change the fact that there is a unique gluing.
