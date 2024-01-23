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

# Exercise 7.34

+++

![x](raster/2023-10-24T18-20-34.png)

+++

![x](raster/2023-10-24T18-21-04.png)

+++ {"tags": []}

## What must we show?

+++

Should we first prove that this is actually a quantale? The author points to the definition of a closed monoidal preorder rather than the definition of a quantale, suggesting a mistake. Even if the author meant to point to definition 2.79 somehow, they failed to include the ⊸ at the end of (**Op**,⊆,X,∩). In the actual question, the author also only refers to sections of Chp 2 where these concepts aren't even defined yet.

The partial order of open sets a topological space defines has binary intersections and arbitrary unions, by definition. Is this the same as saying it has all meets and all joins?

And that it has all finite limits and colimits? Or is a complete lattice? How many of these things are the exact same? Isn't a quantale defined in the same way, by having all joins?

+++

## What do we have?

+++

This question seems related to [Exercise 2.62](exercise-2-62.md) in particular (which effectively considers the discrete topology). Exercise 7.34 is similar to 2.62, just with a subset (sublattice) of the power set. So you can't connect two nodes by just anything, but only by an open set i.e. a measure of connectedness. That is, we are limiting the possibilities. So this restricts connections to those allowed by the topological space.

For example, imagine that you allow multiple modes of transportation between nodes but if one mode is available then others won't be. If e.g. you could take a bike from point A to B, then you would never bother to walk.

See also Exercise 2.35.

It will likely help to work from an example in [Finite topological space](https://en.wikipedia.org/wiki/Finite_topological_space).
