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

```{code-cell} ipython3
from IPython.display import Image, Markdown
```

## Optimization problems

+++

See [How are universal properties “solutions to optimization problems”?](https://math.stackexchange.com/questions/3239188/how-are-universal-properties-solutions-to-optimization-problems). Example 3.99 (introducing the pullback) seems like a good example of this; we have to construct some object based on constraints the object must satisfy (it literally uses the word "constraint"). See "equality constraints" in [Optimization problem](https://en.wikipedia.org/wiki/Optimization_problem). It would be helpful to add certain "hard" equality constraints to the "soft" objective function minimization/maximization that is often done in an optimization.

See also [Equaliser (mathematics)](https://en.wikipedia.org/wiki/Equaliser_(mathematics)), and the database constraints in Chp. 3.

+++

## Isomorphic objects

+++

Why do we call two items isomorphic in a pre-order? Because in one shot (one arrow) you can go to an "equivalent" node on the other side. You could see these two nodes as two one-object categories that are equivalent. To generalize this notion of "isomorphic" to two object categories, you just need two arrows that are bidirectional.

+++

## 6.2.1 Initial objects

+++

Russell's analysis in forallx looks related to unique objects; see [Chapter 28](https://forallx.openlogicproject.org/html/Ch28.html).

+++

### Exercise 6.7²

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

### Exercise 7.4²

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

### Exercise 7.6²

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

### Exercise 7.7²

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

### Exercise 7.8²

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

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-09-13T16-30-42.png', metadata={'description': "7S answer"})
```

![x](raster/2023-09-13T00-26-17.png)

+++ {"tags": []}

### Cartesian closed

+++

![x](raster/2023-09-13T00-27-37.png)

+++

See also [Cartesian closed category](https://en.wikipedia.org/wiki/Cartesian_closed_category).

+++ {"tags": []}

### Exercise 7.11²

+++

![x](raster/2023-09-13T00-28-26.png)

+++

How does the cartesian closure requirement (i.e. Equation (7.10)) translate to preorders? In short:

$$
A∧C ≤ D ≅ A ≤ D⊸C
$$

Why? We replace × with ∧ by Exercise 3.88 (that is, the categorical product in a preorder is the meet). We replace instances of 𝒞(X,Y) with $X ≤ Y$ because the hom-set in a preorder is a hom-element, namely a boolean, which is produced by the ≤ relation. We assume the internal hom-element operator $⊸$ is the operator that will be right adjoint to the categorical product ∧, but must show that as part of this proof.

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

+++ {"tags": []}

### Definition 7.12

+++

![x](raster/2023-09-13T00-31-10.png)

+++

See also [Subobject classifier](https://en.wikipedia.org/wiki/Subobject_classifier).

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

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-10-24T14-26-59.png', metadata={'description': "7S answer"})
```

+++ {"tags": []}

### Exercise 7.17

+++

![x](raster/2023-09-13T00-47-00.png)

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-10-24T14-38-05.png', metadata={'description': "7S answer"})
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

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-10-24T18-27-50.png', metadata={'description': "7S answer"})
```

+++ {"tags": []}

### Exercise 7.20

+++

![x](raster/2023-10-24T15-16-42.png)

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-10-24T19-02-36.png', metadata={'description': "7S answer"})
```

+++ {"tags": []}

### Exercise 7.21

+++

![x](raster/2023-10-24T15-17-27.png)

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-10-24T19-07-16.png', metadata={'description': "7S answer"})
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

+++

See also [Grothendieck topology](https://en.wikipedia.org/wiki/Grothendieck_topology). A site is defined on the same page, best linked to as [Site (mathematics)](https://en.wikipedia.org/wiki/Grothendieck_topology) (a redirect). The link [Grothendieck site](https://en.wikipedia.org/wiki/Grothendieck_topology) again goes to the same page.

+++ {"tags": []}

## 7.3.1 Presheaves

+++

![x](raster/2023-10-24T17-53-30.png)

+++ {"tags": []}

### Definition 7.22

+++

![x](raster/2023-10-24T17-56-25.png)

+++ {"tags": []}

### Define "set presheaf"

+++

The same definition is presented in [Presheaf (category theory)](https://en.wikipedia.org/wiki/Presheaf_(category_theory)). We're defining a "presheaf" here as a functor to set, so in the language of [Sheaf (mathematics)](https://en.wikipedia.org/wiki/Sheaf_(mathematics)) we would call these "sheaves of sets" (and "set presheaf" on an individual basis). The author uses the notation $s|_f$ following [Restriction (mathematics)](https://en.wikipedia.org/wiki/Restriction_(mathematics).

See also comments on this topic in [Sheaf (mathematics) § Presheaves](https://en.wikipedia.org/wiki/Sheaf_(mathematics)#Presheaves); the notation $s|_f$ is used by analogy with the more general concept of restriction of functions even for non-set presheaves. Here the author uses the more general term "restriction map" (equivalent to "restriction morphism"), despite the fact that the unadorned term "restriction" would have communicated enough: these maps/morphisms are only functions (because these are set presheaves).

+++ {"tags": []}

### Define "contravariant functor"

+++

We referred to the "Presheaves" subsection of [Sheaf (mathematics) § Presheaves](https://en.wikipedia.org/wiki/Sheaf_(mathematics)#Presheaves) above in several places, but the definition presented in it is *not* the same as the one presented in [Presheaf (category theory)](https://en.wikipedia.org/wiki/Presheaf_(category_theory)). As noted in the first paragraph of the latter, a [Sheaf (mathematics) § Presheaves](https://en.wikipedia.org/wiki/Sheaf_(mathematics)#Presheaves) is a [Presheaf (category theory)](https://en.wikipedia.org/wiki/Presheaf_(category_theory)) where the category $C$ is the poset of open sets in a topological space (a concept that isn't presented here until the paragraph starting **The open sets of a topological space form a preorder.**).

We'll use the adjective "categorical" with [Presheaf (category theory)](https://en.wikipedia.org/wiki/Presheaf_(category_theory)) and the unadorned "presheaf" for [Presheaf (category theory)](https://en.wikipedia.org/wiki/Presheaf_(category_theory)) (or "topological presheaf" if necessary). Notice the term "categorical set presheaf" also makes sense, but a "topological presheaf" seems to almost be defined as a "topological set presheaf" so much so that it is called a "presheaf of sets" in [Sheaf (mathematics)](https://en.wikipedia.org/wiki/Sheaf_(mathematics)). This terminology suggests that a presheaf can be seen as a collection of sets i.e. that when say "sheaf" we mean to imply that we don't know what we are reaping (yet).

Notice that in Chp 3 the author defines a database instance on a category $C$ as a functor from $C$ to **Set**. That means that technically his definition of a database instance corresponds to a presheaf on $C^{op}$, so that when you take the double-opposite you get back the definition of a database instance as a functor from $C$ to **Set**. All this opposite nonsense needs to be tracked rather than ignored, however. A synonym for "presheaf" is [Contravariant functor](https://en.wikipedia.org/wiki/Functor#Covariance_and_contravariance), as discussed in [Topos § Equivalent definitions](https://en.wikipedia.org/wiki/Topos#Equivalent_definitions). In fact this is actually the preferred language for [Presheaf (category theory)](https://en.wikipedia.org/wiki/Presheaf_(category_theory)), being more common, except when trying to make analogies to topology.

+++ {"tags": []}

### Example 7.23

+++

![x](raster/2023-10-24T17-58-06.png)

+++ {"tags": []}

### Trivial covering

+++

![x](raster/2023-10-24T18-00-25.png)

+++

It seems the author is trying to define a different definition of covering here than e.g. the one used in [Cover (topology)](https://en.wikipedia.org/wiki/Cover_(topology)#open_cover). This may be a bit confusing if you're used to the original term.

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

+++ {"tags": []}

### Define "topological space" <!-- define-topological-space -->

+++

Why do many writers use $U$ for an open set? The word "open" doesn't have a $U$ in it anywhere. It may be that $U$ is just the second letter of s**u**bset.

Why does the author use **Op** for a topology? It might initially look short for "top" (without the t), but is more likely short for **Op**en as in open sets. Compare these definitions to the definitions in [Topological space § Definition via open sets](https://en.wikipedia.org/wiki/Topological_space#Definition_via_open_sets) (and [Open set](https://en.wikipedia.org/wiki/Open_set)).

See also [Clopen set](https://en.wikipedia.org/wiki/Clopen_set) and its comparison of sets to doors. If you're over-accustomed to the concept of an open set tied to the [standard topology](https://en.wikipedia.org/wiki/Real_coordinate_space#Topological_properties), look through some of the examples of a closure on the non-standard topologies in [Closure (topology) § Examples](https://en.wikipedia.org/wiki/Closure_(topology)#Examples).

+++ {"tags": []}

### Define "open cover" <!-- define-open-cover -->

+++

The author uses the term "cover" here when the more specific term is "open cover" (see [Cover (topology)](https://en.wikipedia.org/wiki/Cover_(topology)#open_cover)). You'll need to know this; the author soon starts to use "open cover" rather than cover.

+++ {"tags": []}

### Continuous functions

+++

Regarding continuity, see in particular the part of the discussion in [Continuous function § Continuous functions between topological spaces](https://en.wikipedia.org/wiki/Continuous_function#Continuous_functions_between_topological_spaces) that references [Limit of a function § (ε, δ)-definition of limit](https://en.wikipedia.org/wiki/Limit_of_a_function#(%CE%B5,_%CE%B4)-definition_of_limit) in the subsection [Continuity at a point](https://en.wikipedia.org/wiki/Continuous_function#Continuity_at_a_point). In both definitions, we require that "small" variations/perturbations in the codomain (defined via either ε or V) must correspond to "small" variations/perturbations in the input (defined via either δ or $f^{-1}(V)$). We define what "small" means in the codomain, and our function definition should lead us to the test we need to apply in the domain. Is it possible to find a δ or $f^{-1}(V)$ that is small enough? If not, then the function is not continuous.

+++

For example, consider the following function $f$ defined on essentially the same set with different topologies. If we want to define "small" to mean the open set $V = \{2\}$ on the right, then there's no open set on the left we can choose that's "small enough" such that its image contains $\{2\}$ without also including other objects in the codomain. Indeed, our only option is $U = \{A,B\}$ whose image $f(U) = \{1,2\}$ is not a subset of $\{2\}$:

+++

![x](continuous-function-topology-example-1.svg)

+++

In this example, confirm that there is no open set on the left whose image includes $V = \{2, 3\}$ on the right without also including other objects in the codomain:

+++

![x](continuous-function-topology-example-2.svg)

+++

This explanation is not quite the same as the one given in [The definition of continuous function in topology - MSE](https://math.stackexchange.com/questions/323610/the-definition-of-continuous-function-in-topology/323620#323620). That explanation also uses the opposite variable names for sets ($U$ corresponds to $V$ in the Wikipedia definition, and $V$ corresponds to $U$) so it is not recommended reading.

+++

A differentiable function is defined differently in topology just as a continuous function is. See [Differentiable function § Differentiable functions on manifolds](https://en.wikipedia.org/wiki/Differentiable_function) and [Differentiable programming](https://en.wikipedia.org/wiki/Differentiable_programming).

+++ {"tags": []}

### Review earlier topologies

+++

How do you see the topologies of chapter 1 as a set of open sets? Recall, for example:

+++

![x](raster/2023-12-02T16-58-17.png)

+++

The short answer is that these are actually partitions of a set, not topologies, though they are introduced with the language of connectedness. Notice there are only 5 partitions on a set of 3 elements, but 29 topologies (see [Finite topological space](https://en.wikipedia.org/wiki/Finite_topological_space)).

If you want to try to draw a finite topological space, one option is to exclude all the open sets that are implied by the open sets you choose to draw. That is, choose not to draw any open sets that are either the intersection or union of open sets you've chosen to draw. Also always choose to exclude to both the empty set and the full set. With this approach, we might simplify the drawing above to:

+++

![x](draw-topologies-example-1.svg)

+++

Notice the left of our two examples is `8.` in the list provided by Wikipedia, mapping our element to theirs by:
- a → b
- b → c
- c → a

+++

Unfortunately this drawing strategy isn't always going to produce the same drawing for the same topology. We could have also drawn the above as:

+++

![x](draw-topologies-example-2.svg)

+++

To be consistent, it's probably best to only draw the smallest open sets that you can that still imply the other open sets. Said another way, draw only those open sets that allow you to infer all other open sets via the rule that the union of any open sets is also an open set. In general, this should lead to a less-cluttered drawing.

Said another way, we don't draw any open sets that are "covered" by other open sets (the "open covers") except those open covers that can be produced by a single (the same) open set. We *may* draw an open set that contains an open set. Said another way, in the sublattice (or preordered set) that defines the topology we draw the bottom (leaf) elements first and then keep drawing up any elements that don't have two arrows pointing into them. Notice these arrows represent "inclusion" morphisms, so we don't draw any sets that "include" two other sets (notably, the same arrows in the opposite category are the restriction morphisms).

+++ {"tags": []}

### Defined "connected space"

+++

See [Connected space](https://en.wikipedia.org/wiki/Connected_space). We can't say that a topological space that includes the whole set as an open set "connected" because every topological space includes the whole set as an open set.

Instead, we define "connected space" in a negative way, in terms of whether the whole set can be represented as the union of two (or more) open sets. See [Finite topological space](https://en.wikipedia.org/wiki/Finite_topological_space); the 9 non-equivalent topologies on three elements from this perspective:

+++

![x](connected-and-not-spaces-examples.svg)

+++

The arrows in the preceding diagram demonstrate the [Specialization (pre)order](https://en.wikipedia.org/wiki/Specialization_(pre)order) for these topologies, which demonstrates some of the concepts in [Finite topological space § Connectivity](https://en.wikipedia.org/wiki/Finite_topological_space#Connectivity). The [Clopen sets](https://en.wikipedia.org/wiki/Clopen_set) are colored green.

See also [Connected space § Connected components](https://en.wikipedia.org/wiki/Connected_space). With this perspective we can produce a partition of any of these spaces. You should see that topologies 1-3 and 5-6 produce the trivial partition, 4 and 7-8 produce the partition AB|C, and 9 is the finest partition.

+++ {"tags": []}

### Sheaves vs Presheaves

+++

![x](raster/2023-10-24T18-07-11.png)

+++ {"tags": []}

### Example 7.26

+++

![x](raster/2023-10-24T18-11-37.png)

+++

See also [Ball (mathematics)](https://en.wikipedia.org/wiki/Ball_(mathematics)).

+++ {"tags": []}

### Exercise 7.27

+++

![x](raster/2023-10-24T18-14-41.png)

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-10-24T19-25-47.png', metadata={'description': "7S answer"})
```

+++ {"tags": []}

### Example 7.28

+++

![x](raster/2023-10-24T18-15-11.png)

+++ {"tags": []}

### Exercise 7.29

+++

![x](raster/2023-10-24T18-15-33.png)

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-10-25T21-51-47.png', metadata={'description': "7S answer"})
```

+++ {"tags": []}

### Example 7.30

+++

![x](raster/2023-10-24T18-18-14.png)

+++

Compare to [Sierpiński space](https://en.wikipedia.org/wiki/Sierpi%C5%84ski_space).

+++ {"tags": []}

### The open sets preorder

+++

![x](raster/2023-10-24T18-18-41.png)

+++ {"tags": []}

### The open sets poset

+++

Per [Finite topological space](https://en.wikipedia.org/wiki/Finite_topological_space#0_or_1_points), a topology on a finite set can be thought of as a sublattice of the power set of $X$ that always includes the top/bottom element. Additionally, the first sentence of [Presheaf (category theory)](https://en.wikipedia.org/wiki/Presheaf_(category_theory)) refers to this structure as the "poset" of open sets rather than the preorder.

Both of these statements imply that this is actually a poset rather than just a preorder (preordered set).

+++ {"tags": []}

### Specialization (pre)order

+++

See [Specialization (pre)order](https://en.wikipedia.org/wiki/Specialization_(pre)order) and [specialization order](https://ncatlab.org/nlab/show/specialization+order). This is *not* the concept we're talking about here; this is defined on the objects of a set X rather than the subsets of a set X. For example, compare the specialization order on the Sierpinski space in [Specialization (pre)order § Examples](https://en.wikipedia.org/wiki/Specialization_(pre)order#Examples) to the Hasse diagram you eventually produce in Exercise 7.31.

The Sierpinski space defined by the open sets {∅, {1}, {0,1}} is defined by the closed sets {∅, {0}, {0,1}} (the complements of the open sets). Therefore the closure of {0} is {0} and the closure of {1} is {0,1}, leading to the conclusion that the specialization preorder of the Sierpinski space is the natural one (0 ≤ 0, 0 ≤ 1, and 1 ≤ 1).

+++ {"tags": []}

### Exercise 7.31

+++

![x](raster/2023-10-24T18-19-50.png)

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-10-24T19-45-50.png', metadata={'description': "7S answer"})
```

+++ {"tags": []}

### Exercise 7.32

+++

![x](raster/2023-10-24T18-20-12.png)

+++

![x](raster/2023-10-24T19-48-35.png)

+++

For part `1.`, take $B = X$. Taking $B = Y$ (as the author suggests) is incorrect because there's no guarantee that $Y ∈ \bf{Op}$.

+++

For part `2.` we know that $Y$ is a member of $\bf{Op}_{?∩Y}$ by part `1.` and that ∅ is a member by taking $B = ∅$.

We know that we have binary/finite intersections between any $A_1, A_2$ because there must be some $B_1, B_2$ such that $A_1 = B_1 ∩ Y$ and $A_1 = B_2 ∩ Y$. Since $B_1 ∩ B_2 ∈ \bf{Op}$ because we have arbitrary intersections, we must have:

$$
A_3 = A_1 ∩ A_2 = (B_1 ∩ Y) ∩ (B_2 ∩ Y) = (B_1 ∩ B_2) ∩ Y ∈ \bf{Op}_{?∩Y}
$$

To show that we have arbitrary unions, we must show that given $I$ as a set where we are given an open set $A_i ∈ \bf{Op}_{?∩Y}$ for each $i$ then their union $⋃_{i∈I}A_i ∈ \bf{Op}_{?∩Y}$. We know that for every $A_i$ there must be some corresponding $B_i$ such that $A_i = B_i ∩ Y$, so we can also write arbitrary unions of $A_i$ as $⋃_{i∈I}A_i = ⋃_{i∈I}(B_i ∩ Y) = (⋃_{i∈I}B_i) ∩ Y$. We know that $⋃_{i∈I}B_i ∈ \bf{Op}$ because it has arbitrary unions, so $⋃_{i∈I}A_i ∈ \bf{Op}_{?∩Y}$.

+++

For part `3.` we must show that for every $B ∈ \bf{Op}$, the preimage $f^{-1}(B) ∈ \bf{Op}_{?∩Y}$. An inclusion function maps each element y ∈ Y to the same element x ∈ X in the larger set, so there should always be some open set $A = B ∩ Y ∈ \bf{Op}_{?∩Y}$ that has all the same elements as $B$. That is, the preimage $f^{-1}(B)$ of an inclusion map is all the same elements as $B$ but in another set $A ∈ Y$.

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-10-26T17-53-08.png', metadata={'description': "7S answer"})
```

See also [Subspace topology](https://en.wikipedia.org/wiki/Subspace_topology).

+++ {"tags": []}

### Exercise 7.34²

+++

![x](raster/2023-10-24T18-20-34.png)

+++

![x](raster/2023-10-24T18-21-04.png)

+++

This question seems related to Exercise 2.62 in particular (which effectively considers the discrete topology). Exercise 7.34 is similar to 2.62, just with a subset of the power set. So you can't connect two nodes by just anything, but only by an open set i.e. a measure of connectedness. So this restricts connections to those allowed by the topological space.

It will likely help to work from an example in [Finite topological space](https://en.wikipedia.org/wiki/Finite_topological_space).

A topological space has all intersections and all unions. Is this the same as saying it has all meets and all joins? And that it has all finite limits and colimits? Or is a complete lattice? How many of these things are the exact same? Isn't a quantale defined in the same way, by having all joins?

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

### Define "categorical sheaf"

+++

See also [Sheaf (mathematics)](https://en.wikipedia.org/wiki/Sheaf_(mathematics)). See [sheaf - Wiktionary](https://en.wiktionary.org/wiki/sheaf) for the implied visualization; the term "sheaf" comes from archery where it is a collection of arrows (usually twenty four). The website [quiver](https://q.uiver.app/) has a similarly creative name. We're taking "arrows" here to mean every association of an object/morphism to a different object/morphism by a functor. We can optionally visualize it as a traditional sheaf, i.e. as many stalks of grain (see [Stalk (sheaf)](https://en.wikipedia.org/wiki/Stalk_(sheaf))) if we care less about direction. A categorical presheaf ([Presheaf (category theory)](https://en.wikipedia.org/wiki/Presheaf_(category_theory))) is nothing more than a synonym for a functor, but we're now talking about a [Sheaf (mathematics)](https://en.wikipedia.org/wiki/Sheaf_(mathematics)) since we're in the context of topology.

A sheaf is more than a synonym for a functor; it's a functor with special properties (certain requirements).

A collection of arrows makes a functor/presheaf, and a collection of functors/presheaves makes a category (a functor category). We're just defining a lot of synonyms again, so far. A functor/presheaf is not necessarily a sheaf, however, so we need a new name for a collection of sheaves: a [Topos](https://en.wikipedia.org/wiki/Topos) (which is a functor category with special functors).

It may be easier to read many of these definitions if you move the "for all" before before the requirement (especially if you have a computer science background). At the least, this is a good way to reread them. For example, in the locality axiom replace:

> If $s|_{ U_i} = t|_{ U_i}$ for all $i \in I$, then $s = t$.

With:

> If for all $i \in I$: $s|_{ U_i} = t|_{ U_i}$, then $s = t$.

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

+++

This section almost exactly follows [Sheaf (mathematics) § Sheaf of sections of a continuous map](https://en.wikipedia.org/wiki/Sheaf_(mathematics)#Sheaf_of_sections_of_a_continuous_map). Notice the creative use of Γ (which looks like a scythe, related to a sheaf) in that article.

+++

The author is using the term "fiber" here in the same way it is defined in [Fiber (mathematics)](https://en.wikipedia.org/wiki/Fiber_(mathematics)). The article [Fiber bundle](https://en.wikipedia.org/wiki/Fiber_bundle) uses it in a different but related way; it would call $B$ what is called $Y$ here and the "fiber" $F$ what is called $X$ here.

How are we going to get "sections" on a function, when sections are defined on a functor (presheaf)? The title of this section is a bit of a misnomer (or "abuse of language"). The author doesn't introduce his strategy until later: he'll first convert the sets $X$ and $Y$ to topologies (the discrete topology), then he'll take the open set preorder of each, then he'll define a categorical presheaf between those (a topological presheaf in this topological context). Confusingly this functor $Sec$ is not the same as the $f$ initially introduced, that is, we are not taking the sections of $f$ but of a map in the opposite direction.

+++ {"tags": []}

### Exercise 7.38

+++

![x](raster/2023-10-25T14-09-04.png)

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-10-25T15-10-37.png', metadata={'description': "7S answer"})
```

![x](raster/2023-10-25T14-29-43.png)

+++

Notice how the equation above shows that $s$ is a right inverse to $f$ as discussed in [Section (category theory)](https://en.wikipedia.org/wiki/Section_(category_theory)).

+++

### Define section

+++

See [Section (fiber bundle)](https://en.wikipedia.org/wiki/Section_(fiber_bundle)) for nearly the same definition. The author's definition replaces σ → s and π → f. That is, the Wikipedia article uses **s**igma for the section and **p**i for the projection function. The author also defines not just one section, but a set of sections $Sec_f(U)$ for each $U$.

The author of this drawing replaces σ → s and π → p:

+++

![x](https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Bundle_section.svg/187px-Bundle_section.svg.png)

+++

![x](raster/2023-10-25T14-33-22.png)

+++

See [Cross section (geometry)](https://en.wikipedia.org/wiki/Cross_section_(geometry)) for the author's implied visualization/intuition for the word "section" in this context.

You can also see a section as a possible world, so that a set of sections is a set of possible worlds for the subworld defined by $U$. Different sheaves or presheaves then represent different sets of possible worlds (for the same open set). Look at the mapping of each element of a section as an aspect of a possible world; we consider them independent but not identically distributed. This interpretation fits the interpretation of an instance of a database being a possible world; the data we collected could have been different in a different world. From the start of Chp. 7:

> Technically, a sheaf is a certain sort of functor, but one can imagine it as a space of possibilities, varying in a controlled way ...

In the introduction to [Section (fiber bundle)](https://en.wikipedia.org/wiki/Section_(fiber_bundle)) they describe how an individual section can be seen as an abstract characterization of a graph. From this perspective, the set of sections over $U$ is the set of all possible graphs the sheaf/presheaf allows:

+++

![x](sections-as-graphs.svg)

+++

The author defines $Sec$ as a section in the sense of [Section (fiber bundle)](https://en.wikipedia.org/wiki/Section_(fiber_bundle)). This terminology may be a bit confusing, because a [Section (fiber bundle)](https://en.wikipedia.org/wiki/Section_(fiber_bundle)) can always go into defining a sheaf. A section as defined in [Sheaf (mathematics) § Presheaves](https://en.wikipedia.org/wiki/Sheaf_(mathematics)#Presheaves) will usually not. These could almost be called a "presection" or "categorical section" to indicate they haven't passed the required tests to be a section in the original sense of the word (when it was only used in topology).

Even more confusingly, a categorical section is an element of a set, rather than a function (as a topological section is). But, you can see a topological section as the set of 2-tuples that define a function (as a [Binary relation](https://en.wikipedia.org/wiki/Binary_relation)). For example, we could represent $s_4$ above as $\{(a,2),(b,1)\}$ or $((a,2),(b,1))$. A set of sections over $U$ would then be a set of sets, where each member set in this example has two 2-tuples.

You can see a categorical section as a member of a set, so we would represent $s_4$ above as $((a,2),(b,1))$ ∈ (2⊕3)×(2⊕3) = $Sec_f(\{a,b\})$. Notice that we're using ⊕ in the previous equation for the [Coproduct](https://en.wikipedia.org/wiki/Coproduct) or [Disjoint union](https://en.wikipedia.org/wiki/Disjoint_union). However, given the context that we're working in, we can drastically compress this representation to $(2,1)$ or $(a_2,b_1)$ ∈ 2×3 = $Sec_f(\{a,b\})$. We can make this drastic compression because we know we're working with the open set $U = \{a,b\}$; be aware that $(2,1)$ in the context of $U = \{a,e\}$ is something completely different.

We recover the six sections in this example indirectly by defining the restriction morphisms. The restriction map from $Sec_f(\{a,b\})$ to $Sec_f(\{a\})$ defines half of each of these six functions, and the restriction map from $Sec_f(\{a,b\})$ to $Sec_f(\{b\})$ defines the other half. In some sense there are morphisms in the opposite direction for how to "glue" sections together, but these are not part of the definition.

+++ {"tags": []}

### Exercise 7.40

+++

![x](raster/2023-10-25T14-34-57.png)

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-10-25T15-11-26.png', metadata={'description': "7S answer"})
```

![x](raster/2023-10-25T14-49-41.png)

+++ {"tags": []}

### Exercise 7.42

+++

![x](raster/2023-10-25T14-50-14.png)

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-10-25T15-57-47.png', metadata={'description': "7S answer"})
```

![x](raster/2023-10-25T14-50-50.png)

+++

![x](raster/2023-10-25T17-29-35.png)

+++

See also [Gluing axiom](https://en.wikipedia.org/wiki/Gluing_axiom). The author's Definition 7.35 initially defines a gluing in passive terms; it's something that might exist for a matching family and if it does we have a name for it. He then defines the sheaf condition in terms of a unique gluing always existing for every open cover.

In contrast, the article [Sheaf (mathematics) § Sheaves](https://en.wikipedia.org/wiki/Sheaf_(mathematics)#Sheaves) directly states that a gluing must exist for every open cover in the second of two axioms. It provides a second axiom (the first of the two axioms) to guarantee that it is unique. The advantage of separate axioms is apparently to be able to make it clear how some presheaves satisfy only one or the other.

+++ {"tags": []}

### Exercise 7.44

+++

![x](raster/2023-10-25T17-33-14.png)

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-10-25T17-33-44.png', metadata={'description': "7S answer"})
```

+++ {"tags": []}

### Non-sheaf examples

+++

Some (relatively) simple examples of non-sheaves are provided in [Constant sheaf § A detailed example](https://en.wikipedia.org/wiki/Constant_sheaf#A_detailed_example). In the first example presheaf $F$ we fail to satisfy the locality axiom because if $U = ∅$ then the categorical sections $F(U)$ are elements of ℤ i.e. integers. The statement $s|_{ U_i} = t|_{ U_i}$ for all $i \in I$ will always be true when $I$ is empty, but we can choose $s,t$ to be any integers. You can't assume any two random integers are equal.

In the second example presheaf $G$ of [Constant sheaf § A detailed example](https://en.wikipedia.org/wiki/Constant_sheaf#A_detailed_example), we cannot map the restriction maps correctly to satisfy the gluing axiom given our mapping of the objects. In particular, consider the open cover $\{\{p\},\{q\}\}$ of $U = \{p,q\}$. The intersection $U_i ∩ U_j$ of these two open sets is the empty set, and the restriction of any section will be the one element in a one-element set, so it is a "matching family" in the terminology of 7S. Does there exist a unique section  $s ∈ F(U) = ℤ$ such that for all $i ∈ I$ we have $s|_{U_i} = s_i$? Take $s_1 = 7$ over $U_1 = \{p\}$ and $s_2 = 5$ over $U_2 = \{q\}$. Because $res_{\{p\},\{p,q\}} = id$ we have $res_{\{p\},\{p,q\}}(s) = s|_{\{p\}} = s = s_1 = 7 ≠ s|_{\{q\}} = s_2 = 5$, we will not be able to find such a unique $s$.

See [Talk:Constant sheaf § Coproduct vs categorical product](https://en.wikipedia.org/wiki/Talk:Constant_sheaf#c-Davidvandebunte-20231206182000-Coproduct_vs_categorical_product) for some comments on the example presheaf $H$ of this example.

We could come up with another non-sheaf example, which we'll call $K$. See [this quiver drawing](https://q.uiver.app/#q=WzAsNCxbMiwwLCJLKOKIhSk9MCJdLFswLDIsIksoXFx7cFxcfSk94oSkIl0sWzQsMiwiSyhcXHtxXFx9KT3ihKQiXSxbMiw0LCJLKFxce3AscVxcfSk94oSkw5fihKTDl+KEpCJdLFsyLDAsIjAiXSxbMSwwLCIwIiwyXSxbMywyLCLPgF8yIl0sWzMsMSwiz4BfMSIsMl1d), repeated here:

+++

![x](raster/2023-12-07T16-28-12.png)

+++

This example passes the gluing axiom, but the gluing is not unique. That is, it fails locality/uniqueness axiom for the open cover $\{\{p\},\{q\}\}$ (though it does not fail it for the open cover $\{\{p,q\}\}$).

+++ {"tags": []}

### Other examples of sheaves

+++

![x](raster/2023-10-25T17-35-16.png)

+++

![x](raster/2023-10-25T17-35-37.png)

+++

See [Sheaf (mathematics) § Sheaf of sections of a continuous map](https://en.wikipedia.org/wiki/Sheaf_(mathematics)#Sheaf_of_sections_of_a_continuous_map), which demonstrates that $s$ is a right inverse and links to [Section (category theory)](https://en.wikipedia.org/wiki/Section_(category_theory)).

+++

![x](raster/2023-10-25T17-49-28.png)

+++

See nearly the same discussion in [Vector field § Vector fields on manifolds](https://en.wikipedia.org/wiki/Vector_field#Vector_fields_on_manifolds).

When the author says "agree around the border" think of the sheaf condition's requirement that open sets agree on their overlap. You could define a presheaf by putting together disagreeing pieces, but not a sheaf.

In the last sentence of the first paragraph the author appeals to the possible worlds interpretation. The cowlick example could also be described in terms of possible worlds.

+++ {"tags": []}

### Define bundle

+++

See also [Tangent bundle](https://en.wikipedia.org/wiki/Tangent_bundle); not to be confused with [Bundle (geometry)](https://en.wikipedia.org/wiki/Bundle_(geometry)). A tangent bundle is a special case of [Fiber bundle](https://en.wikipedia.org/wiki/Fiber_bundle). Another kind of fiber bundle is a [Vector bundle](https://en.wikipedia.org/wiki/Vector_bundle).

+++ {"tags": []}

### Exercise 7.47

+++

![x](raster/2023-10-25T17-55-44.png)

+++

There is not a one-to-one correspondence; every sheaf defines a set of possible vector fields. Each vector field is a section, that is, a particular possible world in all the possible worlds defined by the sheaf.

The category of sheaves on M is then a category of different sets of sets of possible worlds. That is, in one sheaf we may allow for certain vector fields, but in another we will not.

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-12-07T18-12-51.png', metadata={'description': "7S answer"})
```

+++ {"tags": []}

### Example 7.48

+++

![x](raster/2023-10-25T18-15-34.png)

+++

The category $\bf{Op}$ is $∅ → \{1\}$; to make it clear the one arrow is an inclusion morphism it could be drawn $∅ ⊆ \{1\}$. The category $\bf{Op}^{op}$ is $\{1\} → ∅$ or $\{1\} ⊇ ∅$.

See [Finite topological space § 0 or 1 points](https://en.wikipedia.org/wiki/Finite_topological_space#0_or_1_points) for a discussion of this space. The one arrow in $\bf{Op}$ is the empty function, and the one arrow in $\bf{Op}^{op}$ is the constant function.

To define a sheaf for **Op** we can map the empty set to the empty tuple, as described in Example 7.36 (the terminal object in **Set**). The nonempty set can map to any set, so that the category of all presheaves are all sets. That is, every presheaf picks out one set.

The morphisms (natural transformations) between sheaves are then a pair of functions. The first of the two functions is always the identity function on the initial object (rather uninteresting). The second morphism (the second component of the natural transformation) is any function, however. So ignoring the identity function on the initial object, we can see every morphism in this category of presheaves as corresponding to a function in **Set**.

The restriction map for every presheaf that qualifies as a sheaf will be the constant function to the terminal object; there is only ever one map to the terminal object so this is our only choice. The sections of $P(U)$ will simply be elements of whatever set the presheaf maps to.

The only open covers we need to worry about (besides the one for the empty set we've already addressed) are the open covers of $U = \{*\}$. These open covers will necessarily only have the empty set and $U$ as members. Let's first look at the "locality" axiom of [Sheaf (mathematics) § Sheaves](https://en.wikipedia.org/wiki/Sheaf_(mathematics)#Sheaves). It will always be satisfied if $U_i$ is the empty set by Example 7.36. It will also always be satisfied if $U_i$ is $U$ because the restriction map will be trivial (the identity) and therefore $s = t$.

Next, let's look at the "gluing" axiom of [Sheaf (mathematics) § Sheaves](https://en.wikipedia.org/wiki/Sheaf_(mathematics)#Sheaves). By Example 7.36 any open cover that includes only the empty set will satisfy this requirement. If $U$ is also part of the open cover, then if $i,j$ pick out the empty set alongside $U$ we'll have a matching family because $U_i ∩ U_j$ will be the empty set. However, we'll also always have a unique section $s|_U$ that corresponds to whatever section $s$ we picked out of $U$.

+++ {"tags": []}

### Exercise 7.49

+++

![x](raster/2023-10-25T18-15-58.png)

+++

For `1.`, the category $\bf{Op}$ is $∅ → \{1\} → \{1,2\}$ (with the inclusion morphisms).

+++

For `2.`, the opposite of that category is $\bf{Op}^{op}$ or $\{1,2\} → \{1\} → ∅$ (with the restriction morphisms). A presheaf consists of a functor $\bf{Op}^{op} → \bf{Set}$.

+++

For `3.` the sheaf condition is that for all open covers we satisfy the sheaf condition. How many open covers are there? As discussed in Exercise 7.31, the only open covers are (1) the empty collection covering the empty set and (2) various collections $C$ covering an open set $U$, where $U$ is a member of the collection $C$.

To define a sheaf for **Op** we can map the empty set to the empty tuple, as described in Example 7.36. We can define a trivial matching family for every collection $C$ that has only one open set in it; it will satisfy the sheaf condition because the family will be matching (i = j = 0) and the gluing will simply be the section $s_0$.

There is also an open cover consisting of $\{\{1,2\},\{1\}\}$ (that covers $\{1,2\}$). Let's say that $\{1\}$ is mapped to some arbitrary set, so that sections over $\{1\}$ are elements of that set $X$. We'll have a matching family when e.g. $U_0 = \{1,2\}$ and $U_1 = \{1\}$ so that the overlap/intersection is $U_1$, and the section $s_0$ associated with $U_0$ restricts to the section $s_1$.

Unless we include information about $X$ in the set $P(\{1,2\})$ we risk having a matching family and not satisfying the gluing condition. At the least we could map $P(\{1,2\}) = X$; this would satisfy the gluing axiom (and the locality axiom) and therefore give us a sheaf. Notice we could even make $X = \{()\}$.

However, if we wanted we could put even more information into $P(\{1,2\})$ and still have a sheaf. If we mapped $P(\{1,2\}) = X×Y$ where Y is any other set, we'd still satisfy the gluing axiom. The restriction $s_1|_{U_1}$ where again $U_1 = \{1\}$ would not uniquely identify a section of $P(U)$, but the restriction $s_0|_{U_0} = s|_{U}$ obviously would.

In the style of [Constant sheaf § A detailed example](https://en.wikipedia.org/wiki/Constant_sheaf#A_detailed_example) see [this quiver drawing](https://q.uiver.app/#q=WzAsMyxbMCwyLCJQKFxcezEsMlxcfSkgPSBYw5dZIl0sWzAsMSwiUChcXHsxXFx9KSA9IFgiXSxbMCwwLCJQKOKIhSkgPSBcXHsoKVxcfSJdLFsxLDIsIjAiXSxbMCwxLCLPgCJdXQ==), repeated here:

+++

![x](raster/2023-12-07T18-40-33.png)

+++

For `4.` we could likely associate a sheaf on **Op** with a function in several ways. One way to do so would be to identify it with a function of two variables, or more generally a function that's constructed from two functions.

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-12-07T18-13-18.png', metadata={'description': "7S answer"})
```

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

+++

The one point space has two open sets and could be represented ∅ → {1}. Based on Eq. 7.50 we assign $Ω(∅) = \{∅\}$ and we assign $Ω(\{1\}) = \{∅,\{1\}\}$.

The non-empty set is being mapped to a two object set we can see as the booleans. Therefore we can see any morphism between sheaves (a natural transformation) that targets this sheaf as a function to the booleans.

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-12-08T17-20-38.png', metadata={'description': "7S answer"})
```

+++ {"tags": []}

### Exercise 7.53

+++

![x](raster/2023-10-25T18-29-50.png)

+++

For part `1.` we need to check that Ω is functorial i.e. that it preserves identities and composition. It preserves identities because the identity on every open set $U$ in 𝓒 (the trivial inclusion ⊆) is mapped to the identity on $Ω(U)$ in **Set**. This latter identity is $Ω(U) → Ω(U)$ or $U' ↦ U' ∩ U$ or $U' ↦ U'$ (every set gets mapped to itself).

To preserve composition we must have that if $f⨟g = h$ then $Ω(f)⨟Ω(g) = Ω(h)$. That is, if W ⊆ V ⊆ U then $res_{V,U}⨟res_{W,V} = res_{W,U}$ (using syntax from [Sheaf (mathematics)](https://en.wikipedia.org/wiki/Sheaf_(mathematics)), and including a reversal because presheafs are contravariant). The first two restriction maps are:

$$
\begin{align}
U' & ↦ U' ∩ V \\
V' & ↦ V' ∩ W
\end{align}
$$

Replacing the dummy variables with $S$ (for **s**et) to make for easier reading:

$$
\begin{align}
S & ↦ S ∩ V \\
S & ↦ S ∩ W
\end{align}
$$

Composing these and using the fact that W ⊆ V so that V ∩ W = W:

$$
\begin{align}
S & ↦ (S ∩ V) ∩ W \\
S & ↦ S ∩ (V ∩ W) \\
S & ↦ S ∩ W
\end{align}
$$

+++

For part `2.`, it's true that all you need to do to check that something like Ω is a presheaf is to check that it is a functor, because a functor and a presheaf are essentially synonymous.

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-12-08T17-37-03.png', metadata={'description': "7S answer"})
```

+++ {"tags": []}

### Ω satisfies sheaf condition

+++

![x](raster/2023-11-24T14-25-32.png)

+++ {"tags": []}

### Sheaf morphism for true

+++

![x](raster/2023-11-24T14-26-13.png)

+++

The section [Subobject classifier § Sheaves of sets](https://en.wikipedia.org/wiki/Subobject_classifier#Sheaves_of_sets) provides nearly the same definition. We could alternatively describe {1} as the [Constant presheaf](https://en.wikipedia.org/w/index.php?title=Constant_presheaf) with value {1} (or $\{*\}$), which happens to also be a sheaf. Here's a visualization of it on the two-element discrete topological space:

![x](true-sheaf-morphism.svg)

+++

Notice that the natural transformation η that corresponds to `true` always points to the "largest open set" that it can, as the author suggests.

+++ {"tags": []}

### Upshot

+++

![x](raster/2023-11-24T14-26-58.png)

+++

See a similar "upshot" in [Subobject classifier § Sheaves of sets](https://en.wikipedia.org/wiki/Subobject_classifier#Sheaves_of_sets). This suggests a more probabilistic view of truth; we could even considering getting a value between 0 and 1 by taking the open set returned and seeing what fraction it covers of the whole set.

+++

![x](raster/2023-11-24T15-38-16.png)

+++ {"tags": []}

### Inconsistent ⌜?⌝ notation

+++

The author seems to be inconsistently using the ⌜?⌝ notation. Should we fill the ? with the monic morphism $m$ as in (7.13), or the subobject $H$ as in Example 7.54? The article [Subobject classifier](https://en.wikipedia.org/wiki/Subobject_classifier) is also inconsistent, using $χ_A$ where $A$ is the subobject at the start, then $χ_j$ where $j$ is the monic morphism.

+++ {"tags": []}

### Exercise 7.55

+++

![x](raster/2023-11-24T15-41-06.png)

+++

Answering via a drawing:

+++

![x](exercise-7-55.svg)

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-12-08T16-51-55.png', metadata={'description': "7S answer"})
```

The author's solution seems to replace $H$ with $G'$.

+++ {"tags": []}

## 7.4.2 Logic in a sheaf topos

+++

![x](raster/2023-11-25T14-17-22.png)

+++

![x](raster/2023-11-25T14-17-50.png)

+++

![x](raster/2023-11-25T14-18-28.png)

+++ {"tags": []}

### Implies in the standard ℝ sheaf topos

+++

Another way to define the [Material conditional](https://en.wikipedia.org/wiki/Material_conditional) (implies) $p → q$ is as $q ∨ ¬p$, though this translation requires reading it backwards. You can think about implication in Example 7.58 by imagining two number lines on top of each other with the antecedent on the bottom; when the top line is false and the bottom is true the result is not part of the resulting open set. Equivalently, the resulting open set is all parts of the line where the top line is true or the bottom line is false.

This strategy works for the standard topology on the real line, but would break down with more exotic topologies on it.

+++ {"tags": []}

### Exercise 7.59

+++

![x](raster/2023-11-25T14-24-21.png)

+++

For `1.`, the complement of ℝ is {0} (a point). The [Interior (topology)](https://en.wikipedia.org/wiki/Interior_(topology)) of {0} is not (0) because an open set (an "open line") on the real line is defined to include all points within ε of 0, where ε is non-zero (see also [Ball (mathematics)](https://en.wikipedia.org/wiki/Ball_(mathematics))). Therefore (0) is "larger" than {0}, and so the largest open set contained in {0} is ∅. It may be best not to even think of (0) or (0,0) as an open set; it uses interval notation but without two distinct numbers to define the interval.

For `2.` the complement of ∅ is the full set. The interior of the full set is the full set.

For `3.`, yes.

For `4.`, no.

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-12-08T22-57-51.png', metadata={'description': "7S answer"})
```

+++ {"tags": []}

### Dual interior/closure operators

+++

Consider the following not-adjoint pair for the [Sierpiński space](https://en.wikipedia.org/wiki/Sierpi%C5%84ski_space) defined by the open sets $∅ → \{1\} → \{0,1\}$, with the closure operator in blue and the interior operator in red. These are *not* an adjoint pair (take $p = q = \{1\}$) despite these operators being described as "dual" to each other in some references:

+++

![x](sierpinski-closure-interior.svg)

+++

Replacing interior → "interior of the complement" and closure → "closure of the complement" we get an adjoint pair with the opposite category:

+++

![x](sierpinski-closure-interior-v2.svg)

+++

See also [Interior algebra](https://en.wikipedia.org/wiki/Interior_algebra).

+++ {"tags": []}

### Exercise 7.60

+++

![x](raster/2023-11-25T14-24-45.png)

+++

![x](raster/2023-11-25T14-25-10.png)

+++

1. The whole set $X$
2. Yes
3. The empty set ∅
4. Yes

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-12-08T23-00-20.png', metadata={'description': "7S answer"})
```

+++ {"tags": []}

### Example 7.61

+++

![x](raster/2023-11-25T14-41-34.png)

+++

See also [differential geometry - Applications of Topos Theory to the theory of bundles. - MSE](https://math.stackexchange.com/questions/3912771/applications-of-topos-theory-to-the-theory-of-bundles).

For a longer list of internal logics associated to their categories, see [Heyting category in nLab](https://ncatlab.org/nlab/show/Heyting+category). A similar list is in [internal logic in nLab](https://ncatlab.org/nlab/show/internal+logic).

+++ {"tags": []}

## 7.4.3 Predicates

+++

![x](raster/2023-11-25T14-56-44.png)

+++

Given the author previously used $P$ for a presheaf, the $S$ in this section likely stands for sheaf. Looking at the mapping of each element of a section as an aspect of a possible world, in this example each person's opinion is an aspect of the world allowed by $S$.

+++ {"tags": []}

### Exercise 7.62³

+++

![x](raster/2023-11-25T14-57-07.png)

+++

Perhaps those who exist and like the weather over the given time?

Can you see the following as sections over a timeline? Adding Alice from [Alice and Bob](https://en.wikipedia.org/wiki/Alice_and_Bob):

+++

![x](bob-sections-over-timeline.svg)

+++ {"tags": []}

### The subobjects poset

+++

![x](raster/2023-11-25T14-57-35.png)

+++

![x](raster/2023-11-25T15-01-57.png)

+++

![x](raster/2023-11-25T15-02-51.png)

+++ {"tags": []}

### Power object

+++ {"tags": []}

The content of Example 7.54 is also discussed in [Power set § Power object](https://en.wikipedia.org/wiki/Power_set#Power_object), using similar variable names:

> Certain classes of algebras enjoy both of these properties. The first property is more common; the case of having both is relatively rare. One class that does have both is that of [multigraphs](https://en.wikipedia.org/wiki/Multigraph "Multigraph"). Given two multigraphs *G* and *H*, a [homomorphism](https://en.wikipedia.org/wiki/Homomorphism "Homomorphism") *h* : *G* → *H* consists of two functions, one mapping vertices to vertices and the other mapping edges to edges. The set $H^G$ of homomorphisms from *G* to *H* can then be organized as the graph whose vertices and edges are respectively the vertex and edge functions appearing in that set. Furthermore, the subgraphs of a multigraph *G* are in bijection with the graph homomorphisms from *G* to the multigraph Ω definable as the [complete directed graph](https://en.wikipedia.org/wiki/Complete_graph "Complete graph") on two vertices (hence four edges, namely two self-loops and two more edges forming a cycle) augmented with a fifth edge, namely a second self-loop at one of the vertices. We can therefore organize the subgraphs of *G* as the multigraph $Ω^G$, called the **power object** of *G*.

Notice the notational similarity to what the author is calling the subobjects poset.

+++ {"tags": []}

### Topological subobjects

+++

A topological subobject (see also [Subobject](https://en.wikipedia.org/wiki/Subobject)) would be a [Subspace topology](https://en.wikipedia.org/wiki/Subspace_topology).

+++ {"tags": []}

### Example propositions

+++

The author is referring to propositions from truth-functional logic; see [Propositional calculus](https://en.wikipedia.org/wiki/Propositional_calculus). In **Set** these are maps from the one-object category to the booleans, true and false. A picture to have in mind is (see also Exercise 7.52):

+++

![x](one-point-space-true-sheaf-morphism.svg)

+++

A proposition like "The dog is brown." is often simply assigned to a letter in logic, such as $B$ (see the "symbolization key" introduced in [Chapter 4 § Atomic sentences](https://forallx.openlogicproject.org/html/Ch4.html#S3)). We can see η in this scenario as that letter. If we had mapped $*$ to the empty set, then the proposition would be false.

+++

Let's move on to a more complicated example of a proposition, now in the context of the two-point discrete topological space. The requirement that these be a [Natural transformation](https://en.wikipedia.org/wiki/Natural_transformation) is going to start to limit what counts as a proposition. Consider the two examples on the right:

+++

![x](two-point-space-example-proposition.svg)

+++

The infranatural transformation on the left is not a proposition because it is not a natural transformation. Using the following from [Natural transformation § Definition](https://en.wikipedia.org/wiki/Natural_transformation#Definition):

$$
η_Y ∘ F(f) = G(f) ∘ η_X
$$

We always have that $F(f)$ is the identity on the one object in **1**, so this reduces to:

$$
η_Y = G(f) ∘ η_X
$$

While this is true for $η_{\{1\}} = G(f) ∘ η_{\{0,1\}}$ (using part of the green restriction morphism) this fails for $η_{\{0\}} = G(f) ∘ η_{\{0,1\}}$ (using part of the red restriction morphism).

+++ {"tags": []}

### More than true and false

+++

As the previous example shows, we now have more than just "true" and "false" that can be assigned to a proposition. Not only that, even in this simple example there are two propositions that are neither true or false, and yet are unequal to each other. We could say that each should be assigned a value of 0.5, for example, such as if we wanted to reduce our observation to a probabilistic framework. Still, this loses information because there are two different ways for something to be "half true" and we've lost in which way it is half true.

Let's call $B = η$ and $A$ the only natural transformation 1 → Ω that sends $*$ to the section $\{0\}$ of $Ω(\{0,1\})$. Then we can see $A ∩ B$ as the sheaf morphism true, and $A ∪ B$ as the sheaf morphism false.

We know that (A ∩ B) ⊢ B. Is this the subobjects poset |Ω|?

+++

![x](two-element-space-subobjects-poset.svg)

+++

From [Heyting algebra](https://en.wikipedia.org/wiki/Heyting_algebra):

> Heyting algebras serve as the algebraic models of propositional [intuitionistic logic](https://en.wikipedia.org/wiki/Intuitionistic_logic "Intuitionistic logic") in the same way Boolean algebras model propositional [classical logic](https://en.wikipedia.org/wiki/Classical_logic "Classical logic"). The internal logic of an [elementary topos](https://en.wikipedia.org/wiki/Elementary_topos "Elementary topos") is based on the Heyting algebra of [subobjects](https://en.wikipedia.org/wiki/Subobject "Subobject") of the [terminal object](https://en.wikipedia.org/wiki/Terminal_object "Terminal object") 1 ordered by inclusion, equivalently the morphisms from 1 to the [subobject classifier](https://en.wikipedia.org/wiki/Subobject_classifier "Subobject classifier") Ω.
>
> The [open sets](https://en.wikipedia.org/wiki/Open_set "Open set") of any [topological space](https://en.wikipedia.org/wiki/Topological_space "Topological space") form a [complete Heyting algebra](https://en.wikipedia.org/wiki/Complete_Heyting_algebra "Complete Heyting algebra"). Complete Heyting algebras thus become a central object of study in [pointless topology](https://en.wikipedia.org/wiki/Pointless_topology "Pointless topology").

The [pointless topology](https://en.wikipedia.org/wiki/Pointless_topology "Pointless topology") article discusses the lattices of open sets denoted Ω(X) and Ω(Y).

+++ {"tags": []}

### Exercise 7.64¹

+++

![x](raster/2023-11-25T15-03-21.png)

+++

![x](raster/2023-11-25T15-03-43.png)

+++ {"tags": []}

## 7.4.4 Quantification

+++

See also [Power set § Functors and quantifiers](https://en.wikipedia.org/wiki/Power_set#Functors_and_quantifiers).

+++

![x](raster/2023-11-25T15-04-32.png)

+++

![x](raster/2023-11-25T15-04-47.png)

+++ {"tags": []}

### Exercise 7.66¹

+++

![x](raster/2023-11-25T15-05-08.png)

+++

1. {0}
2. ℕ
3. {∞}
4. ℤ

+++

![x](raster/2023-11-25T15-05-42.png)

+++

![x](raster/2023-11-25T15-06-15.png)

+++ {"tags": []}

### Exercise 7.67¹

+++

![x](raster/2023-11-25T15-06-48.png)

+++

![x](raster/2023-11-25T15-07-09.png)

+++

![x](raster/2023-11-25T15-10-58.png)

+++ {"tags": []}

### Exercise 7.68¹

+++

![x](raster/2023-11-25T15-11-26.png)

+++

![x](raster/2023-11-25T15-11-58.png)

+++ {"tags": []}

## 7.4.5 Modalities

+++

![x](raster/2023-11-25T15-14-28.png)

+++ {"tags": []}

### Exercise 7.70¹

+++

![x](raster/2023-11-25T15-14-50.png)

+++

![x](raster/2023-11-25T15-15-22.png)

+++

![x](raster/2023-11-25T15-15-53.png)

+++ {"tags": []}

### Exercise 7.72¹

+++

![x](raster/2023-11-25T15-16-19.png)

+++ {"tags": []}

## 7.4.6 Type theories and semantics

+++

![x](raster/2023-11-25T15-25-15.png)

+++

See also [Kripke semantics § Kripke–Joyal semantics](https://en.wikipedia.org/wiki/Kripke_semantics#Kripke%E2%80%93Joyal_semantics).

+++ {"tags": []}

### Example 7.74

+++

![x](raster/2023-11-25T15-24-55.png)

+++

Example 7.74 seems to summarize 7.73 incorrectly, reversing s and t. Or is this part of the reversal that is part of defining a restriction? Start with the simple example provided in (3.2), and come up with two instances on it (S and T) then a natural transformation f between them. From this perspective it does make sense; there’s a surjective map from the table S(c) in S to the table T(c) in T.

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

```{code-cell} ipython3
:tags: [hide-output]

Image('raster/2023-10-25T19-20-21.png', metadata={'description': "7S answer"})
```

![x](raster/2023-10-25T19-48-39.png)

+++ {"tags": []}

### Exercise 7.77¹

+++

![x](raster/2023-10-25T19-49-19.png)

+++ {"tags": []}

## 7.5.2 Sheaves on 𝕀ℝ

+++

![x](raster/2023-10-25T19-50-04.png)

+++

![x](raster/2023-12-09T14-58-37.png)

+++ {"tags": []}

### Example 7.79

+++

![x](raster/2023-12-09T14-56-03.png)

+++ {"tags": []}

### Exercise 7.80¹

+++

![x](raster/2023-12-09T14-55-26.png)

+++ {"tags": []}

### Example 7.81

+++

![x](raster/2023-12-09T14-57-15.png)

+++

![x](raster/2023-12-09T14-57-40.png)

+++

![x](raster/2023-12-09T14-58-08.png)

+++ {"tags": []}

## 7.5.2 Safety proofs in temporal logic
