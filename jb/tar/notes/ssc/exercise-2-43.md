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

# Exercise 2.43

+++

![x](raster/2023-10-27T16-16-28.png)

+++

To show this is indeed a monotone map, we must show $x ≤_B y$ implies $f(x) ≥_{Cost} f(y)$ for all
$x,y \in B$. There are only four cases to check:

$$
\begin{align} \\
false \leq false & \to \infty \geq \infty \\
false \leq true & \to \infty \geq 0 \\
true \leq false & \to 0 \geq \infty \\
true \leq true & \to 0 \geq 0 \\
\end{align}
$$

Checking condition `(a)` of Definition 2.41:

$$
0 \leq g(true) = 0
$$

Checking condition `(b)` of Definition 2.41:

$$
\begin{align} \\
\infty + \infty \leq g(false) = \infty \\
\infty + 0 \leq g(false) = \infty \\
0 + \infty \leq g(false) = \infty \\
0 + 0 \leq g(true) = 0 \\
\end{align}
$$

Yes, $g$ is a strict monoidal monotone.
