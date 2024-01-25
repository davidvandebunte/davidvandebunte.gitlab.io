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

# Exercise 2.8

+++

![x](raster/2023-10-26T21-08-03.png)

+++

The element $e$ in the monoid $(M, \ast, e)$ serves as $I$ in the discrete preorder $(\bf{Disc}_M, =,
\ast, e)_{}$. The monoid multiplication $\ast$ serves as the monoidal product $\otimes$ and
satisfies properties `(b)`, `(c)`, and `(d)` by definition of being a monoid. By virtue of being a
discrete preorder, it satisfies `(a)` because $x_1$ will always equal $y_1$ and therefore with "="
as the order operator this condition comes down to $x_1 \otimes x_2 = x_1 \otimes x_2$.
