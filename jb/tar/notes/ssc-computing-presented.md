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

# 2.5. Computing presented

## 2.5.1. Monoidal closed preorders

See also [Closed monoidal category](https://en.wikipedia.org/wiki/Closed_monoidal_category).

*Exercise* 2.82.

For `1.` let's define:

$$
f(s) ≔ s \otimes v
$$

Given $x_1 \leq y_1$ where $x_1, y_1 \in \mathcal{V}$, we must show that:

$$
f(x_1) \leq f(x_2) ↔ x_1 \otimes v \leq y_1 \otimes v
$$

If we set:

$$
v ≔ x_2 ≔ y_2
$$

Then we have by reflexivity:

$$
x_2 \leq y_2
$$

And can use (a) in Definition 2.2. to conclude:

$$
x_1 \otimes v \leq y_1 \otimes v ↔ x_1 \otimes x_2 \leq y_1 \otimes y_2
$$

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

For `3.` let's define:

$$
g(s) ≔ v ⊸ s
$$

Given $x \leq y$ where $x, y \in \mathcal{V}$, we must show that:

$$
g(x) \leq g(x) ↔ (v ⊸ x) \leq (v ⊸ y)
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

For `4.`, notice that in `2.` and `3.` we only showed the reverse; that being monoidal closed
implies that (v ⊸ -) is a monotone map. A quick review of Definition 1.95 makes it clear that this
means (v ⊸ -) is a right adjoint however, and this definition has the same structure as Definition
2.79.

+++

*Exercise* 2.84.

![x](ssc-exercise-2-84.svg)

+++

## 2.5.2. Quantales

See also [Infimum and supremum](https://en.wikipedia.org/wiki/Infimum_and_supremum) and [Complete
lattice](https://en.wikipedia.org/wiki/Complete_lattice).

*Exercise* 2.92.

1a. False
1b. ∞
2a. The usual logical or
2b. The minimum of the numbers (using the usual order of the reals)

+++

*Exercise* 2.93.

We already defined the join for the empty set. For the singleton sets {T} and {F} the join is simply
the same element of the set. For the set {T,F} the join is T.

+++

*Exercise* 2.94.

Yes; the join of the empty set will be the empty set (the least element). The join of any singleton
set (e.g. $\{\{T\}\}$ or $\{\{F\}\}$ in **Bool**) will be the same element. All sets of subsets will
have a join that is the union of the included subsets.

+++

## 2.5.3. Matrix multiplication in a quantale

*Exercise* 2.103.

$$
\begin{pmatrix}
1 & 0\\\
0 & 1
\end{pmatrix}
$$

$$
\begin{pmatrix}
true  & false\\\
false & true
\end{pmatrix}
$$

$$
\begin{pmatrix}
0 & ∞\\\
∞ & 0
\end{pmatrix}
$$

+++

*Exercise* 2.104.

For `1.` we have:

$$
(I * M)(w,y) ≔ \bigvee_{x \in X} I(w,x) \otimes M(x,y) \\
(I * M)(w,y) ≔ I(w,w) \otimes M(w,y) \vee \bigvee_{x \in X \setminus \{w\}} 0 \otimes M(x,y)
$$

Using Definition 2.2. part (a), any $0 \otimes x$ term is always $0$, so this reduces to:

$$
(I * M)(w,y) ≔ M(w,y)
$$

For `2.` we have:

$$
((M * N) * P)(w,z) = \bigvee_{y \in Y} \big( \bigvee_{x \in X} M(w,x) ⊗ N(x,y) \big) ⊗ P(y,z)
$$

Using symmetry, part (b) of Proposition 2.87, and symmetry again:

$$
((M * N) * P)(w,z) = \bigvee_{y \in Y} \bigvee_{x \in X} M(w,x) ⊗ N(x,y) ⊗ P(y,z)
$$

Pulling out $M(w,x)$ with part (b) of Proposition 2.87 again, we have:

$$
\bigvee_{x \in X} M(w,x) ⊗ \big( \bigvee_{y \in Y} N(x,y) ⊗ P(y,z) \big) = (M * (N * P))(w,z)
$$

+++

*Exercise* 2.105.

```{code-cell}
import numpy as np

inf = float("inf")
M1 = np.array([[0, inf, 3, inf], [2, 0 , inf, 5], [inf, 3, 0 , inf], [inf, inf, 6, 0]])

# See https://stackoverflow.com/a/55986817/622049
M2 = np.min(M1[:,:,None] + M1[None,:,:], axis=1)
M3 = np.min(M2[:,:,None] + M1[None,:,:], axis=1)
M4 = np.min(M2[:,:,None] + M2[None,:,:], axis=1)

M1, M2, M3, M4
```
