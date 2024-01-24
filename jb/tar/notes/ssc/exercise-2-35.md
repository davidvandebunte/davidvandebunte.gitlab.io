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

# Exercise 2.35

+++

![x](raster/2023-10-27T15-52-47.png)

+++

[ist]: https://en.wikipedia.org/wiki/Intersection_(set_theory)

It should satisfy the identity/unitality condition because $S \cap X$ for any $X$ that is a subset
of $S$ should be $X$. See also [Intersection (set theory)][ist]; the intersection operation is
associative, and commutative.

To see the monotonicity condition is satisfied we'll use as an inference rule that a
partially-applied $\cap$ is order-preserving. That is, if we have that $a_1 \leq a_2$ (that is, $a_1
\subset a_2$), it follows that $a_1 \cap b \leq a_2 \cap b$. Then, starting from these two premises:

$$
\begin{align} \\
x_1 & \leq y_1 \\
x_2 & \leq y_2 \\
\end{align}
$$

Applying $\_ \cap y_2$ to the first premise:

$$
\begin{equation} \\
x_1 \cap y_2 \leq y_1 \cap y_2 \\
\label{eq:35a} \tag{a}
\end{equation}
$$

Applying $x_1 \cap \_$ to the second premise:

$$
\begin{equation} \\
x_1 \cap x_2 \leq x_1 \cap y_2 \\
\label{eq:35b} \tag{b}
\end{equation}
$$

And combining $\eqref{eq:35a}$ and $\eqref{eq:35b}$ with transitivity:

$$
x_1 \cap x_2 \leq x_1 \cap y_2 \leq y_1 \cap y_2
$$
