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

# Exercise 7.11

+++

![x](raster/2023-09-13T00-28-26.png)

+++

## What must we show?

+++

For `1.`, what must we show? That is, how does this "cartesian closed" requirement i.e. Equation (7.10) translate to the context of preordered sets? In short:

$$
A∧C ≤ D ≅ A ≤ D⊸C
$$

Why is this the translation? We replace × with ∧ by Exercise 3.88 (which says the categorical product in a preorder is the meet). We replace instances of 𝒞(X,Y) with $X ≤ Y$ because the hom-set in a preordered set is a hom-element (one element rather than a set). Namely, a boolean.

In the context of a **Bool**-category, the ⊸ operation will produce a single boolean. In the context of a **Cost**-category, the ⊸ operation will produce a single value on the non-negative [Projectively extended real line](https://en.wikipedia.org/wiki/Projectively_extended_real_line).

See something similar in Equation (2.80), which defines a monoidal closed preorder (the preorder version of a [Closed monoidal category](https://en.wikipedia.org/wiki/Closed_monoidal_category)).

We assume the internal hom-element operator $⊸$ is the operator that will be right adjoint to the categorical product ∧, but must show that as part of this proof. We know how to show that two functions are adjoint from Chp. 1; we likely need to use these three properties to show that we have adjoint functors using the same strategy.

+++

## What do we have?

+++

Can the first statement be taken to mean bounded? From the top, at least. It could also be taken to mean that the preorder has a terminal object; all objects have exactly one morphism to $I$.

Can the second statement be taken to mean that a proposition becomes either equally or less likely to be true if you ask it to be true alongside a second proposition?

The third statement looks rather similar to the definition of join, below (1.5).
