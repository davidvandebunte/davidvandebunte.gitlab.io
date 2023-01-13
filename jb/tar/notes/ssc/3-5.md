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

# 3.5. Bonus: limits and colimits

## 3.5.1. Terminal objects and products

Prerequisite to [Initial and terminal objects](
https://en.wikipedia.org/wiki/Initial_and_terminal_objects).

*Exercise* 3.81.

No object in the preorder will have a unique morphism for every object C in 𝓒 to it, except the top
object, because there will be no morphism at all from the top object to it. The top object will be a
terminal object because every other object in a preorder will have only one morphism to it (there is
at most one morphism between any two objects in a preorder category).

+++

*Exercise* 3.82.

The category **1**. In **Cat** the objects are categories and the morphisms are functors, and there
will be one unique functor "!" to every category as given in Eq. (3.75).

+++

*Exercise* 3.83.

The category with two objects and two parallel morphisms between them. There are only two candidate
objects for the terminal object. The object with two morphisms out of it is not the terminal object
because there is no unique morphism between the object and it (there are zero morphisms). The object
with two morphisms into it is not the terminal object because the only other object has two
morphisms to it rather than one.

+++

*Exercise* 3.88.

Only the elements c in 𝓒 where c ≤ x and c ≤ y are candidates for the product of x and y because
they are the only elements that will have a $p_X$ and $p_Y$ (in the language of Definition 3.86)
that point to x and y. These other elements will not satisfy the definition of a product, however,
because there will be no $〈f,g〉$ between the element and the meet x ∧ y (since the meet is the
greatest element that is less than both x and y). For the meet x ∧ y, the $〈f,g〉$ morphism is the
only morphism that exists between all the lesser elements and it.

+++

*Exercise* 3.90.

The identity morphisms in a product category are the pairs of identity morphisms in the two
composing categories.

Composition in a product category is associative because composition in each of the composing
categories is.

The product category **1** × **2** has two objects (1,1) and (1,2). The only non-identity morphism
is $(id_{1}, p_{12})$.

The product category when P and Q are preorders is the "product" preorder, as described in Example
1.56. and Exercise 1.57.

+++

## 3.5.2. Limits

Prerequisite to [Limit (category theory)](https://en.wikipedia.org/wiki/Limit_(category_theory)) and
[Cone (category theory)](https://en.wikipedia.org/wiki/Cone_(category_theory)).

*Exercise* 3.91.

Notice the symmetry between the last diagram of Definition 3.86 and the diagram immediately above
Exercise 3.91; both of these diagrams depict two cones but with different labels on the graph
elements. In the first, we are claiming that for all cones centered on C there is a unique morphism
to the cone centered on the product X × Y. Thinking in terms of a terminal object in **Cone**(X,Y),
this is equivalent to claiming that there exists a unique morphism !: C → Z = (X ← X × Y → Y) which
is referred to as 〈f,g〉 for each object C of 𝓒.

+++

*Definition* 3.92.

Example 3.87 is Definition 3.92 where 𝓙 specifically points to the objects $X=\{1,2,3,4,5,6\}$ and
$Y=\{1,2,3,4\}$ in **Set**. While 𝓙 may be abstract, D points to specific objects in 𝓒. This can be
confusing if you think of D as a "diagram" and conflate it with 𝓙.

It can be tempting to think that two indexes are necessary; one that indexes the objects in 𝓙 and
one that indexes all the ways that 𝓙 can map onto 𝓒. The latter index is not necessary for the
reason given above. In some sense, though, the category **Cone**(D) provides a second level of
indexing.

In the last paragraph, the term "projections" is chosen with the products in mind. See the picture
at the bottom of Example 3.87 for a visualization; the product relation can be "projected" into
either X or Y.

## 3.5.3. Finite limits in Set

+++

*Exercise* 3.97.

Call $v$ and $w$ in the diagram in Example 3.94 $v_1$ and $v_2$ to make that application of the
definition easier. With this, it's easier to see how the set-builder notation being used in Theorem
3.95 boils down to the set-builder notation used at the start of Example 3.87 (notice $A$ is empty).

+++

*Exercise* 3.98.

Call the one element in $1$ by $v_1$ to make the application of the definition easier, and use the
name $X$ for the target of the functor D. The limit is just the set itself. Looking at Definition
3.92 one can think any other set that has the set $X$ as the codomain (target) as a cone in
**Cone**(D), and the projection map of the limit as $id_X$.

+++

*Example* 3.99.

Prerequisite to [Pullback (category theory)](
https://en.wikipedia.org/wiki/Pullback_(category_theory)).

+++

## 3.5.4. A brief note on colimits

*Example* 3.101.

We can have $F^{op}$ map the same objects and morphisms to the same objects and morphisms that $F$
did.
