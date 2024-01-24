---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.1
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

+++ {"tags": []}

# Exercise 2.82

+++

![x](raster/2023-10-28T15-49-34.png)

+++

For `1.` let's define:

$$
f(s) ≔ s \otimes v
$$

Given $x_1 \leq y_1$ where $x_1, y_1 \in \mathcal{V}$, we must show that:

$$
f(x_1) \leq f(y_1) \\
x_1 \otimes v \leq y_1 \otimes v
$$

If we set:

$$
v ≔ x_2 ≔ y_2
$$

Then we have by reflexivity:

$$
x_2 \leq y_2
$$

And can use `(a)` (monotonicity) in Definition 2.2. to conclude:

$$
x_1 \otimes v \leq y_1 \otimes v \\
x_1 \otimes x_2 \leq y_1 \otimes y_2
$$

+++

For `2.` let's define:

$$
m ≔ v ⊸ w
$$

By reflexivity:

$$
m ≤ v ⊸ w
$$

Using the fact that $\mathcal{V}$ is closed we have:

$$
m ⊗ v ≤ w
$$

Which is what we intended to show. See nearly the same answer in part (c) of Proposition 2.87.

+++

For `3.` let's define:

$$
g(s) ≔ v ⊸ s
$$

Given $x \leq y$ where $x, y \in \mathcal{V}$, we must show that:

$$
g(x) \leq g(y) ↔ (v ⊸ x) \leq (v ⊸ y)
$$

Starting with:

$$
x \leq y
$$

Including the result from `2.` with $x$ replacing $w$:

$$
(v ⊸ x) ⊗ v \leq x \leq y
$$

Then using the fact that $\mathcal{V}$ is closed, we have what we intended to show:

$$
((v ⊸ x) ⊗ v) \leq y ↔ (v ⊸ x) \leq (v ⊸ y)
$$

+++

For `4.`, notice that in `2.` and `3.` we only showed the reverse; that being monoidal closed
implies that (v ⊸ -) is a monotone map. A quick review of Definition 1.95 makes it clear that this
means (v ⊸ -) is a right adjoint however, and this definition has the same structure as Definition
2.79.
