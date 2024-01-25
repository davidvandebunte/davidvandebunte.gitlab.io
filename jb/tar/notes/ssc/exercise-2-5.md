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

# Exercise 2.5

+++

![x](raster/2023-10-26T21-05-42.png)

+++

This won't work, because the monoidal product doesn't satisfy requirement `(a)`. Consider the
example:

+++

$$
\begin{align}
x_1 & = -2 \\
x_2 & = -2 \\
y_1 & = 1 \\
y_2 & = 1 \\
x_1 \leq y_1 & = true \\
x_2 \leq y_2 & = true \\
x_1 \otimes x_2 & = 4 \not\leq 1 = y_1 \otimes y_2 \\
\end{align}
$$
