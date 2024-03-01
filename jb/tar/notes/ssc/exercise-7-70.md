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

# Exercise 7.70

+++

<!-- ![x](raster/2023-11-25T15-14-50.png) delete-me -->

> Suppose $𝑗: \Omega → \Omega$ is a morphism of sheaves on $𝑋$, such that $𝑝 ≤ 𝑗(𝑝)$ holds for all $𝑈 ⊆ 𝑋$ and $𝑝 ∈ \Omega(𝑈)$. Show that for all $𝑞 ∈ \Omega(𝑈)$ we have $𝑗(𝑗(𝑞)) ≤ 𝑗(𝑞)$ iff $𝑗(𝑗(𝑞)) = 𝑗(𝑞)$.

+++

## Author's solution

+++

> It is clear that if $𝑗(𝑗(𝑞)) = 𝑗(𝑞)$ then $𝑗(𝑗(𝑞)) ≤ 𝑗(𝑞)$ by reflexivity. On the other hand, assume the hypothesis, that $𝑝 ≤ 𝑗(𝑝)$ for all $𝑈 ⊆ 𝑋$ and $𝑝 ∈ \Omega(𝑈)$. If $𝑗(𝑗(𝑞)) ≤ 𝑗(𝑞)$, then letting $𝑝 ≔ 𝑗(𝑞)$ we have both $𝑗(𝑝) ≤ 𝑝$ and $𝑝 ≤ 𝑗(𝑝)$. This means $p ≅ j(p)$, but $\Omega$ is a poset (not just a preorder) so $𝑝 = 𝑗(𝑝)$, i.e. $𝑗(𝑗(𝑞)) = 𝑗(𝑞)$ as desired.

+++

## Alternative answer

+++

Assume $j(j(q)) ≤ j(q)$; we must show $j(j(q)) = j(q)$. Call $r = j(q)$ so that we know $j(r) ≤ r$. We were also given $p ≤ j(p)$ for any $p$, so substituting $r$ for $p$ we know $r ≤ j(r)$. Therefore $r = j(r)$ or $j(q) = j(j(q))$.

+++

We must also show that with the assumption $j(j(q)) = j(q)$ we also have that $j(j(q)) ≤ j(q)$. This is rather trivial; if the two terms are equal then they are also less than or equal to each other (in either direction).
