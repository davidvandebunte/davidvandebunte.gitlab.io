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

+++

![x](raster/2023-10-27T20-47-36.png)

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

How does the cartesian closure requirement (i.e. Equation (7.10)) translate to preorders? In short:

$$
A∧C ≤ D ≅ A ≤ D⊸C
$$

Why? We replace × with ∧ by Exercise 3.88 (that is, the categorial product in a preorder is the meet). We replace instances of 𝒞(X,Y) with $X ≤ Y$ because the hom-set in a preorder is a hom-element, namely a boolean, which is produced by the ≤ relation. We assume the internal hom-element operator $⊸$ is the operator that will be right adjoint to the categorical product ∧, but must show that as part of this proof.

See something similar in Equation (2.80).

Can the first statement be taken to mean bounded? From the top, at least. It could also be taken to mean that the preorder has a terminal object; all objects have exactly one morphism to $I$.

Can the second statement be taken to mean that a proposition becomes either equally or less likely to be true if you ask it to be true alongside a second proposition?

The third statement looks rather similar to the definition of join, below (1.5).

Can you see the propositions-as-types insight as both propositions and types corresponding to a range of possible worlds? A type (such as an integer) can take on e.g. 2^32 possible values (possible worlds). A proposition (such as whether aristotle is a man) can take on a certain number of possible values (possible worlds) such as true or false. When you extend to Heyting logic, you're allowing for more than two possible worlds.

Throwing away uncertainty then becomes a matter of engineering; how much do you want to throw away? It depends on your meta-uncertainty; perhaps you aren't sure how uncertain you are and so only bother to split the possible worlds into true and false (as a first step).

We know how to show that two functions are adjoint from Chp. 1; we likely need to use these three properties to show that we have adjoint functors using the same strategy.

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

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-10-24T14-26-59.png)
```

+++ {"tags": []}

### Exercise 7.17

+++

![x](raster/2023-09-13T00-47-00.png)

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-10-24T14-38-05.png)
```

+++ {"tags": []}

## 7.2.3 Logic in the topos Set

+++

![x](raster/2023-10-24T14-39-21.png)

+++

![x](raster/2023-10-24T15-14-45.png)

+++

![x](raster/2023-10-24T15-15-05.png)

+++ {"tags": []}

### Exercise 7.19

+++

![x](raster/2023-10-24T15-16-14.png)

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-10-24T18-27-50.png)
```

+++ {"tags": []}

### Exercise 7.20

+++

![x](raster/2023-10-24T15-16-42.png)

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-10-24T19-02-36.png)
```

+++ {"tags": []}

### Exercise 7.21

+++

![x](raster/2023-10-24T15-17-27.png)

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-10-24T19-07-16.png)
```

+++ {"tags": []}

### Review

+++

![x](raster/2023-10-24T17-47-28.png)

+++ {"tags": []}

# 7.3 Sheaves

+++

![x](raster/2023-10-24T17-52-25.png)

+++

![x](raster/2023-10-24T17-52-59.png)

+++ {"tags": []}

## 7.3.1 Presheaves

+++

![x](raster/2023-10-24T17-53-30.png)

+++

![x](raster/2023-10-24T17-56-25.png)

+++

See also [Presheaf (category theory)](https://en.wikipedia.org/wiki/Presheaf_(category_theory)) and [Sheaf (mathematics) § Presheaves](https://en.wikipedia.org/wiki/Sheaf_(mathematics)#Presheaves).

+++

![x](raster/2023-10-24T17-58-06.png)

+++

![x](raster/2023-10-24T18-00-25.png)

+++ {"tags": []}

## 7.3.2 Topological spaces

+++

![x](raster/2023-10-24T18-05-56.png)

+++ {"tags": []}

### Definition 7.25

+++

![x](raster/2023-10-24T18-06-27.png)

+++

![x](raster/2023-10-24T18-07-51.png)

+++

Compare to [Topological space § Definition via open sets](https://en.wikipedia.org/wiki/Topological_space#Definition_via_open_sets) and [Cover (topology)](https://en.wikipedia.org/wiki/Cover_(topology)#open_cover). See also [Clopen set](https://en.wikipedia.org/wiki/Clopen_set) and its comparison of sets to doors.

+++

Regarding continuity, see in particular the part of the discussion in [Continuous function § Continuous functions between topological spaces](https://en.wikipedia.org/wiki/Continuous_function#Continuous_functions_between_topological_spaces) that references [Limit of a function § (ε, δ)-definition of limit](https://en.wikipedia.org/wiki/Limit_of_a_function#(%CE%B5,_%CE%B4)-definition_of_limit). In both definitions, we require that "small" variations/perturbations in the codomain (defined via either ε or V) must correspond to "small" variations/perturbations in the input (defined via either δ or $f^{-1}(V)$). We define what "small" means in the codomain, and our function definition should lead us to the test we need to apply in the domain. Is it possible to find a δ or $f^{-1}(V)$ that is small enough? If not, then the function is not continuous.

+++

For example, consider the following function $f$ defined on essentially the same set with different topologies. If we want to define "small" to mean the open set $V = \{1\}$ on the right, then there's no open set on the left we can choose that's "small enough" to cover it without also covering other objects in the codomain:

+++

![x](continuous-function-topology-example-1.svg)

+++

In this example, confirm that there is no open set on the left that covers the open set $V = \{2, 3\}$ on the right without also covering other objects in the codomain:

+++

![x](continuous-function-topology-example-2.svg)

+++

This explanation is not quite the same as the one given in [The definition of continuous function in topology - MSE](https://math.stackexchange.com/questions/323610/the-definition-of-continuous-function-in-topology/323620#323620). That explanation also uses the opposite variable names for sets ($U$ corresponds to $V$ in the Wikipedia definition, and $V$ corresponds to $U$) so it is not recommended reading.

+++

A differentiable function is defined differently in topology just as a continuous function is. See [Differentiable function § Differentiable functions on manifolds](https://en.wikipedia.org/wiki/Differentiable_function) and [Differentiable programming](https://en.wikipedia.org/wiki/Differentiable_programming).

+++

![x](raster/2023-10-24T18-07-11.png)

+++ {"tags": []}

### Example 7.26

+++

![x](raster/2023-10-24T18-11-37.png)

+++ {"tags": []}

### Exercise 7.27

+++

![x](raster/2023-10-24T18-14-41.png)

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-10-24T19-25-47.png)
```

+++ {"tags": []}

### Example 7.28

+++

![x](raster/2023-10-24T18-15-11.png)

+++ {"tags": []}

### Exercise 7.29

+++

![x](raster/2023-10-24T18-15-33.png)

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-10-25T21-51-47.png)
```

+++ {"tags": []}

### Example 7.30

+++

![x](raster/2023-10-24T18-18-14.png)

+++

Compare to [Sierpiński space](https://en.wikipedia.org/wiki/Sierpi%C5%84ski_space).

+++ {"tags": []}

### The open sets of a topological space form a preorder

+++

![x](raster/2023-10-24T18-18-41.png)

+++ {"tags": []}

### Exercise 7.31

+++

![x](raster/2023-10-24T18-19-50.png)

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-10-24T19-45-50.png)
```

+++ {"tags": []}

### Exercise 7.32

+++

![x](raster/2023-10-24T18-20-12.png)

+++

![x](raster/2023-10-24T19-48-35.png)

+++

See also [Subspace topology](https://en.wikipedia.org/wiki/Subspace_topology).

For part `1.`, take $B = X$. Taking $B = Y$ (as the author suggests) is incorrect because there's no guarantee that $Y ∈ \bf{Op}$.

+++

For part `2.` we know that $Y$ is a member of $\bf{Op}_{?∩Y}$ by part `1.` and that ∅ is a member by taking $B = ∅$.

We know that we have binary/finite intersections between any $A_1, A_2$ because there must be some $B_1, B_2$ such that $A_1 = B_1 ∩ Y$ and $A_1 = B_2 ∩ Y$. Since $B_1 ∩ B_2 ∈ \bf{Op}$ because we have arbitrary intersections, we must have:

$$
A_3 = A_1 ∩ A_2 = (B_1 ∩ Y) ∩ (B_2 ∩ Y) = (B_1 ∩ B_2) ∩ Y ∈ \bf{Op}_{?∩Y}
$$

To show that we have arbitrary unions, we must show that given $I$ as a set where we are given an open set $A_i ∈ \bf{Op}_{?∩Y}$ for each $i$ then their union $⋃_{i∈I}A_i ∈ \bf{Op}_{?∩Y}$. We know that for every $A_i$ there must be some corresponding $B_i$ such that $A_i = B_i ∩ Y$, so we can also write arbitrary unions of $A_i$ as $⋃_{i∈I}A_i = ⋃_{i∈I}(B_i ∩ Y) = (⋃_{i∈I}B_i) ∩ Y$. We know that $⋃_{i∈I}B_i ∈ \bf{Op}$ because it has arbitrary unions, so $⋃_{i∈I}A_i ∈ \bf{Op}_{?∩Y}$.

For part `3.` we must show that for every $B ∈ \bf{Op}$, the preimage $f^{-1}(B) ∈ \bf{Op}_{?∩Y}$. An inclusion function maps each element y ∈ Y to the same element x ∈ X in the larger set, so there should always be some open set $A = B ∩ Y ∈ \bf{Op}_{?∩Y}$ that has all the same elements as $B$. That is, the preimage $f^{-1}(B)$ of an inclusion map is all the same elements as $B$ but in another set $A ∈ Y$.

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-10-26T17-53-08.png)
```

+++ {"tags": []}

### Exercise 7.34

+++

![x](raster/2023-10-24T18-20-34.png)

+++

![x](raster/2023-10-24T18-21-04.png)

+++

This question seems related to Exercise 2.62 in particular (which effectively considers the discrete topology).

It will likely help to work from an example in [Finite topological space](https://en.wikipedia.org/wiki/Finite_topological_space).

+++ {"tags": []}

## 7.3.3 Sheaves on topological spaces

+++

![x](raster/2023-10-25T13-49-44.png)

+++

![x](raster/2023-10-25T13-56-03.png)

+++ {"tags": []}

### Definition 7.35

+++

![x](raster/2023-10-25T13-56-36.png)

+++ {"tags": []}

### Example 7.36

+++

![x](raster/2023-10-25T14-05-04.png)

+++ {"tags": []}

### Extended example: sections of a function

+++

![x](raster/2023-10-25T14-08-10.png)

+++

![x](raster/2023-10-25T14-08-35.png)

+++

![x](raster/2023-10-25T14-09-24.png)

+++ {"tags": []}

#### Exercise 7.38

+++

![x](raster/2023-10-25T14-09-04.png)

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-10-25T15-10-37.png)
```

+++

![x](raster/2023-10-25T14-29-43.png)

+++

![x](raster/2023-10-25T14-33-22.png)

+++ {"tags": []}

#### Exercise 7.40

+++

![x](raster/2023-10-25T14-34-57.png)

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-10-25T15-11-26.png)
```

+++

![x](raster/2023-10-25T14-49-41.png)

+++ {"tags": []}

#### Exercise 7.42

+++

![x](raster/2023-10-25T14-50-14.png)

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-10-25T15-57-47.png)
```

+++

![x](raster/2023-10-25T14-50-50.png)

+++

![x](raster/2023-10-25T17-29-35.png)

+++ {"tags": []}

#### Exercise 7.44

+++

![x](raster/2023-10-25T17-33-14.png)

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-10-25T17-33-44.png)
```

+++ {"tags": []}

### Other examples of sheaves

+++

![x](raster/2023-10-25T17-35-16.png)

+++

![x](raster/2023-10-25T17-35-37.png)

+++

![x](raster/2023-10-25T17-49-28.png)

+++

See also [Tangent bundle](https://en.wikipedia.org/wiki/Tangent_bundle).

+++ {"tags": []}

### Exercise 7.47

+++

![x](raster/2023-10-25T17-55-44.png)

+++ {"tags": []}

### Example 7.48

+++

![x](raster/2023-10-25T18-15-34.png)

+++ {"tags": []}

### Exercise 7.49

+++

![x](raster/2023-10-25T18-15-58.png)

+++ {"tags": []}

# 7.4 Toposes

+++

![x](raster/2023-10-25T18-20-25.png)

+++

![x](raster/2023-10-25T18-21-47.png)

+++

![x](raster/2023-10-25T18-22-10.png)

+++

![x](raster/2023-10-25T18-24-47.png)

+++ {"tags": []}

## 7.4.1 The subobject classifier Ω in a sheaf topos

+++

![x](raster/2023-10-25T18-27-35.png)

+++ {"tags": []}

### Exercise 7.52

+++

![x](raster/2023-10-25T18-29-14.png)

+++ {"tags": []}

### Exercise 7.53

+++

![x](raster/2023-10-25T18-29-50.png)

+++ {"tags": []}

## 7.4.5 Modalities

+++ {"tags": []}

## 7.4.6 Type theories and semantics

+++

See also [Kripke semantics § Kripke–Joyal semantics](https://en.wikipedia.org/wiki/Kripke_semantics#Kripke%E2%80%93Joyal_semantics).

+++ {"tags": []}

# 7.5 A topos of behavior types

+++

![x](raster/2023-10-25T18-57-57.png)

+++ {"tags": []}

## 7.5.1 The interval domain

+++

![x](raster/2023-10-25T19-01-23.png)

+++ {"tags": []}

### Exercise 7.76

+++

![x](raster/2023-10-25T19-19-01.png)

+++

Notice that $o_{[a,b]}$ is an infinite set of finite closed intervals, not just a finite closed interval. When we form $o_{[0,5]} ∪ o_{[4,8]}$ we'll only "deduplicate" all the closed intervals in $o_{[4,5]}$ (roughly speaking).

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-10-25T19-20-21.png)
```

+++

![x](raster/2023-10-25T19-48-39.png)

+++ {"tags": []}

### Exercise 7.77

+++

![x](raster/2023-10-25T19-49-19.png)

+++ {"tags": []}

## 7.5.2 Sheaves on 𝕀ℝ

+++

![x](raster/2023-10-25T19-50-04.png)
