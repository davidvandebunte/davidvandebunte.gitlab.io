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

# Exercise 7.66

+++

<!-- ![x](raster/2023-11-25T15-05-08.png) delete-me -->

> In the topos $\textbf{Set}$, where $Ω = 𝔹$, consider the predicate $p: ℕ×ℤ\to 𝔹$ given by
>
> $$
\begin{align*}
p(n, z) &= \begin{cases}
\text{true} & \text{if } n \leq |z| \\
\text{false} & \text{if } n > |z|
\end{cases}
\end{align*}
$$
>
> 1. What is the set of $n \in ℕ$ for which the predicate $\forall(z: ℤ). p(n, z)$ holds?
> 1. What is the set of $n \in ℕ$ for which the predicate $\exists(z: ℤ). p(n, z)$ holds?
> 1. What is the set of $z \in ℤ$ for which the predicate $\forall(n: ℕ). p(n, z)$ holds?
> 1. What is the set of $z \in ℤ$ for which the predicate $\exists(n: ℕ). p(n, z)$ holds?

+++

## Author's solution

+++

<!-- Image('raster/solution-7-66.png', metadata={'description': "7S answer"}) delete-me -->

> We have the predicate $𝑝 : ℕ × ℤ → 𝔹$ given by $𝑝(𝑛, 𝑧)$ iff $𝑛 ≤ |𝑧|$.
> 1. The predicate $∀(𝑧 : ℤ). 𝑝(𝑛, 𝑧)$ holds for $\{0\} ⊆ ℕ$.
> 2. The predicate $∃(𝑧 : ℤ). 𝑝(𝑛, 𝑧)$ holds for $ℕ ⊆ ℕ$.
> 3. The predicate $∀(𝑛 : ℕ). 𝑝(𝑛, 𝑧)$ holds for $∅ ⊆ ℤ$.
> 4. The predicate $∃(𝑛 : ℕ). 𝑝(𝑛, 𝑧)$ holds for $ℤ ⊆ ℤ$.

+++

## Alternative answer

+++

1. {0}
2. ℕ
3. {∞} (but see [Does the set of natural numbers contain infinity? - MSE](https://math.stackexchange.com/questions/1482992/does-the-set-of-natural-numbers-contain-infinity/1483032#1483032))
4. ℤ
