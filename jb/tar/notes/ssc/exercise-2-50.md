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

# Exercise 2.50

+++

![x](raster/2023-10-27T16-30-36.png)

+++

To answer `1.`, the objects of $\cat{X}$ are simply the elements of the preorder, i.e. $Ob(\cat{X})
= P$. For every pair of objects $(x, y)$ we need an element of $\BB = \{false, true\}$. As before,
simply take $true$ if $x \leq y$ and $false$ otherwise to define the hom-object $\cat{X}(x, y)$.

To go backwards as in Theorem 2.49, let $P := Ob(\cat{X})$. For the $\leq$ relation, let's declare $x
\leq y$ iff $\cat{X}(x, y) = true$. We've clearly gotten back to where we started.

To answer `2.`, let $X := Ob(\cat{X})$. For the $\leq$ relation, let's declare $x \leq y$ iff
$\cat{X}(x, y) = true$.

To go back to a $\Bool$-category, the objects of $\cat{X}$ are simply the elements of the preorder,
i.e. $Ob(\cat{X}) = X$. For every pair of objects $(x, y)$ we need an element of $\BB = \{false,
true\}$. As before, simply take $true$ if $x \leq y$ and $false$ otherwise to define the hom-object
$\cat{X}(x, y)$. We've clearly gotten back to where we started.
