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

# Exercise 7.77

+++

<!-- ![x](raster/2023-10-25T19-49-19.png) delete-me -->

> Show that a subset $𝑈 ⊆ ℝ$ is open in the subspace topology of $ℝ ⊆ 𝕀ℝ$ iff $𝑈 ∩ ℝ$ is open in the usual topology on $ℝ$ defined in Example 7.26.

+++

## Alternative answer

+++

Every point in $ℝ_s$ (for ℝ as a **s**ubspace of 𝕀ℝ) is effectively an open ball in the sense of [Ball (mathematics)](https://en.wikipedia.org/wiki/Ball_(mathematics)) (an open line, in this case). That is, we define it as $[d,u] \in 𝕀ℝ$ where $d = u$. That means the basic open sets are:

$$
\begin{align}
𝑜_{[𝑎,𝑏]} &≔ \{[𝑑,𝑢] ⊆ 𝕀ℝ \enspace | \enspace a < 𝑑 ≤ 𝑢 < b\} \\
𝑜_{[𝑎,𝑏]} &≔ \{[d,d] ⊆ 𝕀ℝ \enspace | \enspace a < 𝑑 < b\}
\end{align}
$$

+++

Then $𝑜_{[𝑎,𝑏]}$ is equivalent to the open line $(a,b)$; we can take $d$ to be any point between $a$ and $b$. Since these two topological spaces share an essentially equivalent basis, they should be otherwise equivalent.

+++

## Author's solution

+++

> A subset $𝑈 ⊆ ℝ$ is open in the subspace topology of $ℝ ⊆ 𝕀ℝ$ iff there is an open set $𝑈' ⊆ 𝕀ℝ$ with $𝑈 = 𝑈' ∩ ℝ$. We want to show that this is the case iff $𝑈$ is open in the usual topology.
>
> Suppose that $𝑈$ is open in the subspace topology. Then $𝑈 = 𝑈' ∩ ℝ$, where $𝑈' ⊆ 𝕀ℝ$ is the union of some basic opens, $𝑈' = \bigcup_{𝑖∈𝐼} 𝑜_{[𝑎_𝑖,𝑏_𝑖]}$, where $𝑜_{[𝑎_𝑖,𝑏_𝑖]} = \{[𝑑,𝑢] ∈ 𝕀ℝ \enspace | \enspace 𝑎_𝑖 < 𝑑 < 𝑢 < 𝑏_𝑖\}$. Since $ℝ = \{[𝑥, 𝑥] ∈ 𝕀ℝ\}$, the intersection $𝑈' ∩ ℝ$ will then be:
>
> $$
𝑈 = \bigcup_{i \in I} \{𝑥 ∈ ℝ \enspace | \enspace 𝑎_𝑖 < 𝑥 < 𝑏_𝑖\}
$$
>
> and this is just the union of open balls $𝐵(𝑚_𝑖, 𝑟_𝑖)$ where $𝑚_𝑖 := \frac{𝑎_𝑖+𝑏_1}{2}$ is the midpoint and $r_i = \frac{b_𝑖-a_i}{2}$ is the radius of the interval $(𝑎_𝑖, 𝑏_𝑖)$. The open balls $𝐵(𝑚_𝑖, 𝑟_𝑖)$ are open in the usual topology on ℝ and the union of opens is open, so 𝑈 is open in the usual topology.
>
> Suppose that $𝑈$ is open in the usual topology. Then $𝑈 = \bigcup_{j \in J} 𝐵(𝑚_𝑗, 𝜖_𝑗)$ for some set $𝐽$. Let $𝑎_𝑗 := 𝑚_𝑗 − 𝜖_𝑗$ and $𝑏_𝑗 := 𝑚_𝑗 + 𝜖_𝑗$. Then:
>
> $$
𝑈 = \bigcup_{𝑗∈𝐽} \{𝑥 ∈ ℝ \enspace | \enspace 𝑎_𝑗 < 𝑥 < 𝑏_𝑗 \} = \bigcup_{𝑗∈𝐽} (𝑜_{[𝑎_𝑗, 𝑏_𝑗]} ∩ ℝ) = \left(­\bigcup_{𝑗∈𝐽} 𝑜_{[𝑎_𝑗, 𝑏_𝑗]}\right) ∩ ℝ
$$
>
> which is open in the subspace topology.
