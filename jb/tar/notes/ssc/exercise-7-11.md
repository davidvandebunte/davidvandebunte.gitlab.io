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

# Exercise 7.11

+++

![x](raster/2023-09-13T00-28-26.png)

+++

## What must we show?

+++

For `1.`, what must we show? That is, how does this "cartesian closed" requirement i.e. Equation (7.10) translate to the context of preordered sets? In short:

$$
A∧C ≤ D ≅ A ≤ C⊸D
$$

Why this translation? We replace × with ∧ by Exercise 3.88 (which says the categorical product in a preorder is the meet). We replace instances of 𝒞(X,Y) with $X ≤ Y$ because the hom-set in a preordered set is a hom-element (one element rather than a set), namely a boolean.

The author mentions Definition 2.79 not far above this question. See something similar to the equation presented here in Equation (2.80), which defines a monoidal closed preorder (the preorder version of a [Closed monoidal category](https://en.wikipedia.org/wiki/Closed_monoidal_category)). The same equation appears in [Heyting algebra](https://en.wikipedia.org/wiki/Heyting_algebra):

> In [mathematics](https://en.wikipedia.org/wiki/Mathematics "Mathematics"), a **Heyting algebra** (also known as **pseudo-Boolean algebra**) is a [bounded lattice](https://en.wikipedia.org/wiki/Lattice_(order)#Bounded_lattice "Lattice (order)") (with join and meet operations written ∨ and ∧ and with least element 0 and greatest element 1) equipped with a binary operation *a* → *b* of *implication* such that (*c* ∧ *a*) ≤ *b* is equivalent to *c* ≤ (*a* → *b*).

Definition 2.90 defines a unital commutative quantale as a symmetric monoidal closed preorder, so this structure should already have an element C⊸D that satisfies the currying condition (per Definition 2.79). So there's actually not really much to show regarding this equation.

+++

### Define "Cartesian category"

+++

So what makes a cartesian closed category different than a closed monoidal category? The key word is that "Cartesian"  adjective. These could arguably be called "cartesian closed monoidal" categories, but aren't because the "Cartesian" operator actually replaces the "monoidal" operator (the cartesian operator is the monoidal operator).

Some articles on Wikipedia might lead you to believe that the ⊗ operator that's required to make a category a [Monoidal category](https://en.wikipedia.org/wiki/Monoidal_category) must actually be the [Cartesian product](https://en.wikipedia.org/wiki/Cartesian_product) for a category to be a cartesian monoidal category. For example, quoting from [Closed monoidal category](https://en.wikipedia.org/wiki/Closed_monoidal_category):

> When the tensor product on $\mathcal{C}$ is the cartesian product, the usual notation is $B^A$ and this object is called the [exponential object](https://en.wikipedia.org/wiki/Exponential_object "Exponential object").

This is not correct; a "Cartesian" category is much more commonly defined as one in which ⊗ is the [Product (category theory)](https://en.wikipedia.org/wiki/Product_(category_theory)). From [Cartesian monoidal category](https://en.wikipedia.org/wiki/Cartesian_monoidal_category):

> In [mathematics](https://en.wikipedia.org/wiki/Mathematics "Mathematics"), specifically in the field known as [category theory](https://en.wikipedia.org/wiki/Category_theory "Category theory"), a [monoidal category](https://en.wikipedia.org/wiki/Monoidal_category "Monoidal category") where the monoidal ("tensor") product is the [categorical product](https://en.wikipedia.org/wiki/Product_(category_theory) "Product (category theory)") is called a **cartesian monoidal category**. Any [category](https://en.wikipedia.org/wiki/Category_(mathematics) "Category (mathematics)") with finite products (a "finite product category") can be thought of as a cartesian monoidal category. In any cartesian monoidal category, the [terminal object](https://en.wikipedia.org/wiki/Initial_and_terminal_objects "Initial and terminal objects") is the monoidal unit.

A [Cartesian closed category](https://en.wikipedia.org/wiki/Cartesian_closed_category) is then a category in which:

> Any two objects *X* and *Y* of *C* have a [product](https://en.wikipedia.org/wiki/Product_(category_theory) "Product (category theory)") *X* ×*Y* in *C*.

Notice that even the symbol for the categorical product (×) is the same as the symbol for the cartesian product. Could we come up with a better name? It may make sense to call a "cartesian closed category" a "product closed category" instead, or even an "exponential object closed category" to be completely clear.

+++

### All objects

+++

How do we show that we have all binary/finite categorical products? Having a monoidal product defined on all objects doesn't mean that it satisfies the properties of a categorical product. See Proposition 2.96.

How do we show we have all exponential objects? It seems like Definition 2.79 also claims that these exist for all pairs of elements. Ignore the notation, however: the ⊸ is only an internal hom functor because Definition 2.79 is equivalent to [Closed monoidal category](https://en.wikipedia.org/wiki/Closed_monoidal_category). It may look like the ⊸ that is standard to all Heyting algebras, but it hasn't been shown to be that yet. It may exist on all pairs of objects, but that doesn't mean it has the required properties of an exponential object (i.e. it relates to the categorical product in a certain way).

+++

## What do we have?

+++

Can the first bullet point be taken to mean bounded? From the top, at least. It could also be taken to mean that the preorder has a terminal object; all objects have exactly one morphism to $I$.

Can we see the second bullet point as saying that ⊗ is the same as ∧? See [Product (category theory)](https://en.wikipedia.org/wiki/Product_(category_theory)). If $v⊗w$ is the product, then there's always a morphism from $v⊗w$ to $v$ and from $v⊗w$ to $w$. That is, these are the two projection morphisms. The third bullet point is then the two morphisms that are unique to the product. However, see [Product (category theory) § Equational definition](https://en.wikipedia.org/wiki/Product_(category_theory)#Equational_definition). The mere existence of these morphisms doesn't make this a product. Or does it, in a preordered set? We don't need to satisfy anything regarding uniqueness, because there's always only one.

Can the second bullet point be taken to mean that a proposition becomes either equally or less likely to be true if you ask it to be true alongside a second proposition? Yes; in terms of the BHK interpretation (replacing ⊗ with ∧) this would say that given a construction of both $v$ and $w$, we can produce a construction of $v$. Because the categorical product is symmetric, given a construction of both $w$ and $v$ we can produce a construction of $v$.

The third bullet point looks rather similar to the definition of join, below (1.5). In terms of the BHK interpretation (replacing ⊗ with ∧) this would say that given a construction of $x$ we can produce either $v$ or $w$ or both.
