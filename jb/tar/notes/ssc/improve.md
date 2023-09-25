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

# Improve SSiC

+++

## Optimization problems

+++

See [How are universal properties “solutions to optimization problems”?](https://math.stackexchange.com/questions/3239188/how-are-universal-properties-solutions-to-optimization-problems). Example 3.99 (introducing the pullback) seems like a good example of this; we have to construct some object based on constraints the object must satisfy (it literally uses the word "constraint"). See "equality constraints" in [Optimization problem](https://en.wikipedia.org/wiki/Optimization_problem). It would be helpful to add certain "hard" equality constraints to the "soft" objective function minimization/maximization that is often done in an optimization.

See also [Equaliser (mathematics)](https://en.wikipedia.org/wiki/Equaliser_(mathematics)), and the database constraints in Chp. 3.

+++

## 6.2.1 Initial objects

+++

### Exercise 6.7

+++

#### Part `2.`

+++

![x](raster/2023-07-30T19-22-48.png)

+++

For part `2.` can we use a one-element set? See [Field with one element](https://en.wikipedia.org/wiki/Field_with_one_element); at least for a field this isn't a well-defined concept. However, why can't the multiplicative identity equal the [Additive identity](https://en.wikipedia.org/wiki/Additive_identity)? See [Additive identity § Properties](https://en.wikipedia.org/wiki/Additive_identity#Properties); there's no hard reason this isn't possible for a ring. In fact, this is known as the [Zero ring](https://en.wikipedia.org/wiki/Zero_ring).

However, the zero ring cannot serve as an initial object in **Rig** because we can still preserve structure and map the one element in this structure to either the additive or multiplicative identity in many other rigs (such as e.g. the natural numbers). That makes two morphisms (homomorphisms) from the zero ring to the natural numbers, when an initial object must only have one.

Having both a multiplicative and additive element implies (via the distributive property) that some other element 1+1 must exist, and via mathematical induction this implies we must have at least the natural numbers in an initial object. Are the natural numbers an initial object in **Rig**? There is exactly one morphism from them to the zero ring (all elements go to zero).

Without reading it, this solution looks long. For likely solutions to this question (check before checking the back of the book), see:
- [Rig in nLab](https://ncatlab.org/nlab/show/Rig)
- [rig in nLab](https://ncatlab.org/nlab/show/rig)

+++

#### Interpretations of zero

+++

The symbol 0 gets used in higher mathematics for much more than the number zero; see [Zero element](https://en.wikipedia.org/wiki/Zero_element). In part (d) of Definition 5.36 (a dependency of Exercise 6.7) it's specifically identified as an absorbing element, besides being the additive identity. Since we're in a section on initial objects, and have already learned about terminal objects, it may be worth looking at the concept of a [Zero object (algebra)](https://en.wikipedia.org/wiki/Zero_object_(algebra)) (which is both initial and terminal).

All over the article [Zero object (algebra)](https://en.wikipedia.org/wiki/Zero_object_(algebra)#Vector_space), the word "trivial" is used almost as a synonym for zero object. At the start:

> This article is about trivial or zero algebraic structures.

The article [Initial and terminal objects](https://en.wikipedia.org/wiki/Initial_and_terminal_objects) redefines "zero object" but links to [Zero object (algebra)](https://en.wikipedia.org/wiki/Zero_object_(algebra)#Vector_space) and specifically mentions:

> This is the origin of the term "zero object".

In [Initial and terminal objects](https://en.wikipedia.org/wiki/Initial_and_terminal_objects), the symbol 0 is often used for initial objects (though the author uses ∅). It's likely this is because 0 serves as the additive identity and so seems natural alongside the symbol + often used for the coproduct. The symbol 1 is similarly often used for terminal objects because it is the identity with respect to the categorical product. The article also mentions:

> Cat, the category of small categories with functors as morphisms has the empty category, 0 (with no objects and no morphisms), as initial object and the terminal category, 1 (with a single object with a single identity morphism), as terminal object.

While it often works to use 0 for an initial object and 1 for a terminal object, this also not a specific approach. It can also be confusing when a category has a "zero" object that is not initial (as in **Ring**/**Rig**, where the zero ring/rig is terminal).

+++ {"tags": []}

# 6.6 Summary and further reading

+++

![x](raster/2023-09-11T00-43-47.png)

+++

![x](raster/2023-09-11T00-44-20.png)

+++ {"tags": []}

# 7.1 How can we prove our machine is safe?

+++

![x](raster/2023-09-11T17-10-23.png)

+++

![x](raster/2023-09-11T17-10-47.png)

+++

![x](raster/2023-09-11T17-12-22.png)

+++

![x](raster/2023-09-11T17-16-30.png)

+++

![x](raster/2023-09-11T17-18-41.png)

+++

![x](raster/2023-09-11T17-28-44.png)

+++

![x](raster/2023-09-11T17-41-10.png)

+++

![x](raster/2023-09-11T17-41-30.png)

+++

See also [Topos](https://en.wikipedia.org/wiki/Topos).

+++

![x](raster/2023-09-11T17-43-11.png)

+++ {"tags": []}

# 7.2 The category Set as an exemplar topos

+++

![x](raster/2023-09-11T18-55-50.png)

+++

![x](raster/2023-09-11T18-57-02.png)

+++ {"tags": []}

## 7.2.1 Set-like properties enjoyed by any topos

+++

![x](raster/2023-09-11T19-05-23.png)

+++

![x](raster/2023-09-11T19-08-00.png)

+++ {"tags": []}

### Exercise 7.4

+++ {"tags": []}

Labeling the morphisms:

![x](exercise-7-4-labeled-morphisms.svg)

In this context, because the $(B,C,B',C')$ square is a pullback, $(B,b,k)$ is the limit with respect to the cospan $B'→C'←C$.

If the $(A,B,A',B')$ square is a pullback, then the whole rectangle commutes and so $(A,a⨟m,j⨟k)$ is also a cone over $B'→C'←C$ (but not the limit). Because $(A,a⨟m,j⨟k)$ is a cone but not the limit, we know that $j$ is actually the unique morphism such that $j⨟b = a⨟m$.

If the $(A,C,A',C')$ square is a pullback, then $(A,a,j⨟k)$ is the limit with respect to the cospan $A'→C'←C$.

+++ {"tags": []}

### Epi-mono factorizations

+++

![x](raster/2023-09-11T21-44-25.png)

+++

![x](raster/2023-09-11T21-44-58.png)

+++

![x](raster/2023-09-11T21-45-24.png)

+++

See also [Epimorphism](https://en.wikipedia.org/wiki/Epimorphism). Clearly the fact that these diagrams commute doesn't teach us anything useful; we already knew that e.g. $id_A⨟f = id_A⨟f$. Instead, let's draw a second cone (one that is not the limit) over $A→B←A$:

![x](definition-7-5-comment.svg)

+++

This leads us to the more interesting fact that:

$$
u⨟id_A = u = g_1 = g_2
$$

+++

It's this fact that we would not have if the diagram only commuted.

Said another way, the fact that $f$ is a monomorphism (i.e. the diagram is a pullback) and that $g_1⨟f = g_2⨟f$ implies that $g_1 = g_2$. In the article [Monomorphism](https://en.wikipedia.org/wiki/Monomorphism) this is the focus of the points around a monomorphism being a [left-cancellative](https://en.wikipedia.org/wiki/Cancellation_property) morphism. In this understanding, we collapse the $id_A$ arrows into the $A$ object. Renaming A/B/C to X/Y/Z:

![x](https://upload.wikimedia.org/wikipedia/commons/2/2d/Monomorphism_scenarios.svg)

+++

Let's call C/Z the vertex of the monomorphism $f$ (being the vertex of the associated cone).

+++ {"tags": []}

### Exercise 7.6

+++

![x](raster/2023-09-11T21-46-07.png)

+++

See [Injective function](https://en.wikipedia.org/wiki/Injective_function) for the formal requirements to be an injective function, in particular [Injective function § Proving that functions are injective](https://en.wikipedia.org/wiki/Injective_function#Proving_that_functions_are_injective). The general requirement, written in a few different ways:

$$
\begin{align}
f(a) = f(b) & ⇒ a = b \\
f(a()) = f(b()) & ⇒ a = b \\
f∘a = f∘b & ⇒ a = b
\end{align}
$$

+++

In the first equation above, we treat $a$ and $b$ as objects. In the second we make $Z=X^0$ or the empty tuple so that we can see $a$ and $b$ as nullary operations (language from [Pointed set](https://en.wikipedia.org/wiki/Pointed_set)). In the last equation we make it clearer that $f$ is a [left-cancellative](https://en.wikipedia.org/wiki/Cancellation_property) morphism (a monomorphism).

+++ {"tags": []}

### Exercise 7.7

+++

![x](raster/2023-09-11T21-46-40.png)

+++

In the language of [Pullback (category theory) § Properties](https://en.wikipedia.org/wiki/Pullback_(category_theory)#Properties) what we are trying to prove here is worded as isomorphisms being "stable" under pullback.

+++

See the text above Example 6.22 for comments on what it means for some morphism to be the pushout of $g$ along $f$. Presumably similar language is being used here for pullbacks; so when we say that $x$ is the pullback of $y$ along $z$, we mean that $x$ and $y$ are typically drawn parallel to each other on diagram (with $z$ connecting them). For pullbacks, it seems that $z$ connects the targets (for pushbacks $z$ connects the sources).

+++ {"tags": []}

To show that $i'$ is an isomorphism, we must show that $i'⨟q = id_{A'}$ and $q⨟i' = id_A$ for some morphism $q$. How do we come up with any morphism $q: A→A'$, much less one that is an inverse? If $A$ was the vertex of a cone over $A→B←B'$ then we could use the universal property of the pullback to generate at least one morphism. It is in fact a cone; the outer square in the following diagram commutes because $id_A⨟f = f⨟i^{-1}⨟i = f$:

![x](exercise-7-7-part1-vertex-A.svg)

+++ {"tags": []}

So we've generated some $u$ that may be able to serve as the inverse $q$ we are looking for. Because of the universal property:

$$
\begin{align}
u⨟i' & = id_A \\
u⨟f' & = f⨟i^{-1}
\end{align}
$$

+++ {"tags": []}

We can ignore the second equation, but the first equation is half of what we are trying to show. How do we also show that $i'⨟u = id_{A'}$? Recall that $A'$ is also a cone over $A→B←B'$, and in fact the limiting cone:

![x](exercise-7-7-part1-vertex-A-prime.svg)

+++ {"tags": []}

This means that there is at most one morphism from $A'$ to $A'$ where the source ($A'$) is also a cone over $A→B←B'$. The morphism $i'⨟u$ exists simply by composition and is also from $A'$ to $A'$, and so must equal $id_{A'}$.

+++

<!-- Because the diagram commutes, and $i$ has an inverse, we know that:

$$
\begin{align}
f'⨟i & = i'⨟f \\
f'⨟i⨟i^{-1} & = i'⨟f⨟i^{-1} \\
f' & = i'⨟f⨟i^{-1}
\end{align}
$$ -->

+++

![x](raster/2023-09-13T13-04-41.png)

+++ {"tags": []}

It's trivial to show the diagram commutes: $id_A⨟f = f⨟id_B$. We must also show that for any $m: C→B$, $n: C→A$ where the outer square in the following diagram commutes (i.e. $n⨟f = m⨟id_B$) there exists a unique morphism $u: C→A$ so that $u⨟f = m$ and $u⨟id_A = n$:

![x](exercise-7-7-part2.svg)

+++ {"tags": []}

The morphism $n$ is clearly a candidate because it exists and satisfies the two equations. It's unique because there should be no other morphism but $n$ for which $u⨟id_A = n$.

+++

<!-- ![x](exercise-7-7-scratch.svg) -->

+++ {"tags": []}

### Exercise 7.8

+++

![x](raster/2023-09-11T21-47-12.png)

+++

In the language of [Pullback (category theory) § Properties](https://en.wikipedia.org/wiki/Pullback_(category_theory)#Properties) what we are trying to prove here is worded as monomorphisms being "stable" under pullback.

+++

The following trivially commutes, but we must also show the box on the left is a pullback. To do so we could try to show the outer box is a pullback and use Proposition 7.3. It's trivial to show the outer box commutes.

![x](exercise-7-8.svg)

+++

See also:
- https://math.stackexchange.com/questions/1980887/how-to-prove-that-pullback-preserves-monomorphisms

+++

See also the following from the wiki page:

> In the setting of posets intersections are idempotent: the intersection of anything with itself is itself. Monomorphisms generalize this property to arbitrary categories. A morphism is a monomorphism if it is idempotent with respect to pullbacks.

Said another way, the operation $f@f$ (where @ means pulling back along $f$) should always equal $f$.

+++ {"tags": []}

### Epi-mono images

+++

![x](raster/2023-09-13T00-25-13.png)

+++

See also [Isomorphism theorems § Discussion](https://en.wikipedia.org/wiki/Isomorphism_theorems#Discussion).

+++ {"tags": []}

### Exercise 7.9

+++

![x](raster/2023-09-13T00-25-45.png)

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-09-13T16-30-42.png)
```

+++

![x](raster/2023-09-13T00-26-17.png)

+++ {"tags": []}

### Cartesian closed

+++

![x](raster/2023-09-13T00-27-37.png)

+++

See also [Cartesian closed category](https://en.wikipedia.org/wiki/Cartesian_closed_category).

+++ {"tags": []}

### Exercise 7.11

+++

![x](raster/2023-09-13T00-28-26.png)

+++

How does the cartesian closure requirement (i.e. Equation (7.10)) translate to preorders? Something along the lines of:

$$
A×C ≤ D ≅ A ≤ D→C
$$

See something similar at the start of [Heyting algebra](https://en.wikipedia.org/wiki/Heyting_algebra#Universal_constructions), which also discusses subobject classifiers.

+++

![x](raster/2023-09-13T00-29-17.png)

+++

![x](raster/2023-09-13T00-40-22.png)

+++ {"tags": []}

## 7.2.2 The subobject classifier

+++

![x](raster/2023-09-13T00-31-10.png)

+++

See also [Subobject classifier](https://en.wikipedia.org/wiki/Subobject_classifier).

+++

![x](raster/2023-09-13T00-31-35.png)

+++

![x](raster/2023-09-13T00-39-56.png)

+++ {"tags": []}

### The subobject classifier in **Set**

+++

![x](raster/2023-09-13T00-44-15.png)

+++ {"tags": []}

### Exercise 7.16

+++

![x](raster/2023-09-13T00-45-10.png)

+++ {"tags": []}

### Exercise 7.17

+++

![x](raster/2023-09-13T00-47-00.png)

+++ {"tags": []}

## 7.2.3 Logic in the topos Set
