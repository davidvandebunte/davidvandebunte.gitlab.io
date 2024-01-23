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

# Exercise 2.40

+++

![x](raster/2023-10-27T16-03-52.png)

+++

As a preorder $\bf{Cost}^{op}$ is $([0, ∞], \leq)$. In this preorder smaller numbers are "better"
(greater) as in golf.

The monoidal unit remains 0, and the monoidal product remains +.

Note that (confusingly) we use the symbol $≤_{X^{op}}$ to mean the same as ≥ (where ≥ has its normal meaning in a linear order); see the first example in [Opposite category](https://en.wikipedia.org/wiki/Opposite_category). See also "is parent of" as discussed in [Relation (mathematics)](https://en.wikipedia.org/wiki/Relation_(mathematics)). Given an arrow, the source is the first argument to the operator (e.g. ≤) and the target is the second argument. Visually:

![x](exercise-2-40.svg)

+++

It's not enough to draw a diagram with arrows to communicate (by definition non-commutative) relationships. Let's say you were planning a gift exchange with family members, and you sent out this list:

George → Mary \
Mary → Sandeep \
Sandeep → George

Does George buy a gift for Mary, or Mary buy a gift for George? Without the giver and receiver labeled, there's no way to know which is correct. If you send out this list, someone may end up without a gift while someone else gets two! Only one arrow needs to be labeled, in the style of a legend:

$$
Giver \; \underrightarrow{buys for} \; Receiver
$$

Looking ahead, you can see this graph as describing morphisms in **Set** where the sets are singletons (see [Singleton (mathematics)](https://en.wikipedia.org/wiki/Singleton_(mathematics))).
