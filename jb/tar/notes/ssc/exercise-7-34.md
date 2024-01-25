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

# Exercise 7.34

+++

![x](raster/2023-10-24T18-20-34.png)

+++

![x](raster/2023-10-24T18-21-04.png)

+++

How is the partial order of open sets of a topological space a quantale? A topological space has binary intersections and arbitrary unions, by definition. Is this the same as saying it has all meets and all joins? On its own, that is not enough. However, see [Exercise 2.94](exercise-2-94.md). The fact that the definition of a topological space includes the empty set and full set means that it is bounded and therefore is a complete lattice. See also [Example of a bounded lattice that is NOT complete (MSE)](https://math.stackexchange.com/questions/800429/example-of-a-bounded-lattice-that-is-not-complete), and [Difference between lattice and complete lattice (MSE)](https://math.stackexchange.com/questions/16129/difference-between-lattice-and-complete-lattice?rq=1).

+++

This question seems related to [Exercise 2.62](exercise-2-62.md) in particular (which effectively considers the discrete topology). Exercise 7.34 is similar to 2.62, just with a subset (sublattice) of the power set. So you can't connect two nodes by just anything, but only by an open set i.e. a measure of connectedness. That is, we are limiting the possibilities. So this restricts connections to those allowed by the topological space.

+++

For example, imagine that you allow multiple modes of transportation between nodes but if one mode is available then others won't be. If e.g. you could take a bike from point A to B, then you would never bother to walk. While it may seem trivial to simply not include any arrows labeled {bike,walk} on a graph, if a computer is doing a model search (e.g. randomly) then being able to restrict possibilities could help come up with a solution orders of magnitude faster. For example, if you know that a particular friend never walks if they can bike, then you can likely deduce that they biked to get somewhere, letting you conclude that e.g. they had more time at home than they are willing to admit.
