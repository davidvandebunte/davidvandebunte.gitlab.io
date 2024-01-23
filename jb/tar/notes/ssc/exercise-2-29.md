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

# Exercise 2.29

+++

![x](raster/2023-10-27T15-43-42.png)

+++

The monoidal unit must be $false$ (satisfying the unitality condition `(a)`).

It's not clear that the author is presenting these tables to show they are symmetric (as in
"symmetric" monoidal preorder), but they show that symmetric condition `(d)` is satisfied.

The associative condition `(c)` is satisfied because booleans over $\vee$ are associative.

The monotonicity requirement `(a)` is satisfied because the booleans over $\vee$ are also already
monotone, and this is apparent in the tables as well. See also [Boolean algebra - Monotone laws](
https://en.wikipedia.org/wiki/Boolean_algebra#Monotone_laws) and [Monotonic function -
In Boolean functions](https://en.wikipedia.org/wiki/Monotonic_function#In_Boolean_functions).
