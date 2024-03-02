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

# Exercise 7.76

+++

<!-- ![x](raster/2023-10-25T19-19-01.png) delete-me -->

> 1. Explain why [2, 6] ∈ $𝑜_{[0,8]}$
> 2. Explain why [2, 6] ∉ $𝑜_{[0,5]} ∪ 𝑜_{[4,8]}$

+++

## Alternative answer

+++

Notice that $o_{[a,b]}$ is an infinite set of finite closed intervals, not just a finite closed interval. When we form $o_{[0,5]} ∪ o_{[4,8]}$ we'll only "deduplicate" all the closed intervals in $o_{[4,5]}$ (roughly speaking).

+++

## Author's solution

+++

> We have $𝑜_{[𝑎,𝑏]} := \{[𝑑, 𝑢] ∈ 𝕀ℝ \enspace | \enspace 𝑎 < 𝑑 ≤ 𝑢 < 𝑏\}$.
> 1. Since $0 ≤ 2 ≤ 6 ≤ 8$, we have $[2, 6] ∈ 𝑜_{[0,8]}$ by the above formula.
> 2. In order to have $[2, 6] ∈^? 𝑜_{[0,5]} ∪ 𝑜_{[4,8]}$, we would need to have either $[2, 6] ∈^? 𝑜_{[0,5]}$ or $[2, 6] ∈^? 𝑜_{[4,8]}$.
But the formula does not hold in either case.

<!-- raster/2023-10-25T19-20-21.png delete-me -->
