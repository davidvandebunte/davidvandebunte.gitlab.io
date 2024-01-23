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

# Exercise 2.20

+++

![x](raster/2023-10-27T15-19-11.png)

+++

Using reflexivity, we have that $u \leq u$. Add this to the first of the equations in (2.16), using
`(a)` (monotonicity) in the definition of a symmetrical monoidal preorder:

$$
\begin{align} \\
t & \leq v + w \\
u & \leq u \\
t + u & \leq (v + w) + u \\
\end{align}
$$

Similarly for the second equation:

$$
\begin{align} \\
w + u & \leq x + z \\
v & \leq v \\
v + (w + u) & \leq v + (x + z) \\
\end{align}
$$

And the third equation:

$$
\begin{align} \\
v + x & \leq y \\
z & \leq z \\
(v + x) + z & \leq y + z \\
\end{align}
$$

Using associativity and transitivity, we can combine all three of these equations to get Equation (2.18) in the text.

+++

To answer `3.`, the symmetry axiom does not need to be invoked because wires do not cross.
