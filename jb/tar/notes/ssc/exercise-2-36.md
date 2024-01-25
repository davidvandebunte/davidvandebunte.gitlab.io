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

# Exercise 2.36

+++

![x](raster/2023-10-27T15-54-17.png)

+++

Let's build a list of example statements (including those that were already made) that may be made in this language. This is a "symbolization key" as defined in [Chapter 4 § Atomic sentences](https://forallx.openlogicproject.org/html/Ch4.html#S3):

- $Q$: n is prime
- $R$: n is even
- $S$: $0 \leq n$
- $T$: $n = 15$

Clearly $S \leq P$ for all $P$ in $n \in ℕ$, but $T$ is only true for a single $P$. If we use
"and" as our monoidal product, we must pick something that is always true (like $S$) as our monoidal
unit. If we had chosen "or" then we'd have to come up with a statement that is always false.

An "and" operation is clearly already associative and commutative. It's also order-preserving, which
we can use in the following proof (in a style suggested by Example 1.123):

![x](./ssc-exercise-2-36.svg)
