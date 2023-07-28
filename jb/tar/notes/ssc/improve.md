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

An example image:

![x](raster/exercise-6-24.png)

+++

# 6.2 Colimits and connection

+++

## 6.2.1 Initial objects

+++

### *Exercise* 6.3

1. The relation with zero morphisms (besides the identity morphisms).
2. A relation with one extra morphism (either from a → b or b → a).
3. The preorder relation with both a → b and b → a.

+++

### *Exercise* 6.6

Example `1.` has a single initial object a, because there's still an identity morphism on a in the free category.

Example `2.` has a single initial object a, because the free category (unlike a preorder) has a morphism for every path. That is, there's a morphism from a to c that isn't explicitly shown.

Example `3.` has no initial object because no object has a morphism to every other object.

Example `4.` has no initial object because a has many morphisms to it from itself.

+++ {"tags": []}

### Define structure-preserving

A major motivation of category theory (going back to section 1.1) is "structure" preservation. The term is used all over [Morphism](https://en.wikipedia.org/wiki/Morphism#Examples). We've gained intuition for what "structure" is through many examples, but is there a more concrete definition? The short answer is no; what it means to preserve structure completely depends on the context. The word "structure" may have more specific meanings in specific contexts (see [stuff, structure, property in nLab](https://ncatlab.org/nlab/show/stuff%2C+structure%2C+property)), but in the context of what it means to be a morphism (i.e. something that is structure-preserving) this can mean many things.

One kind of example is given in [Morphism § Examples](https://en.wikipedia.org/wiki/Morphism#Examples) under:

> - In the category of small categories, the morphisms are functors.
> - In a functor category, the morphisms are natural transformations.

In Definition 5.11 (and in Rough Definition 6.68) we'll see examples of functors that actually preserve more than what plain functors do. These are structure-preserving maps (morphisms) as well, in some category similar to **Cat** (where plain functors are the morphisms).

These examples are for "strict" categories, as defined in [Higher category theory](https://en.wikipedia.org/wiki/Higher_category_theory). There are many more possible definitions of structure-preserving in this domain. From [n-category](https://ncatlab.org/nlab/show/n-category):

> Especially as n increases, there is a plethora of different definitions of n-categories, some differing in generality others different-looking but secretly equivalent. A (woefully incomplete) list is given below, with pointers to dedicated entries. Part of the subject of higher category theory is to understand, organize, systematize and, last not least, apply these definitions. (It is the “n” in “n-category” that gives the nLab its name.)

The term "morphism" was also apparently originally used in category theory as an abstraction of the notion of homomorphism, apparently in order to advance the field of topology. This creates examples of morphisms of almost a completely different kind:

> - In the category of topological spaces, the morphisms are the continuous functions and isomorphisms are called homeomorphisms. There are bijections (that is, isomorphisms of sets) that are not homeomorphisms.
> - In the category of smooth manifolds, the morphisms are the smooth functions and isomorphisms are called diffeomorphisms.

Part of the problem in defining what it means to preserve "structure" is that we may not agree on what structure is important to preserve. Every structure-preserving function ("map") must forget some structure; we wouldn't call it a map if it was nothing but an identity (nothing changed). This disagreement about what is important to preserve leads to a wide variety of definitions.

It may be best to completely avoid the word "structure" and rather say what structure you are preserving. Don't say structure-preserving, for example, when you mean identity-preserving. The latter is just as many letters and is more specific.

It's interesting that the word "morphism" now means structure preserving, when the prefix that would indicate it should be structure preserving (in Greek) has been taken away. For example, [Isomorphism](https://en.wikipedia.org/wiki/Isomorphism) means "equal" form (equal "structure" or shape). [Homomorphism](https://en.wikipedia.org/wiki/Homomorphism) means "same" form though this is due to a mistranslation; it should have been "similar" form (and you should think of it that way).

Can we see structure-preserving morphisms as preserving context? Since what it means to be structure-preserving is so variable, this may be acceptable. A morphism, functor, homemorphism, homomorphism, etc. help you keep what you already knew from one context and use it in another context (either duplicating your knowledge base to reduce or edit it, or building it up without duplication).

+++ {"tags": []}

### Define morphism

If you could think of a small category as a partial magma with identity and an associative partial function, then a functor might preserve this structure, without having to think about all the structure that is presumably preserved in the morphisms (which could be of any kind). A morphism is a bit more than this, though, because a morphism must also be defined whenever composition is possible (when the target of one morphism matches the source of another). It's in this sense that we say a functor is composition-preserving; because (in the language of Definition 3.6) a "composite" morphism must be defined in a category for every two morphisms that can compose. Said another way, we cannot use just any associative partial function.

+++ {"tags": []}

### Why functors?

It can be easy to read the definition of a functor without thinking about why they are defined the way they are. From [Functor § Properties](https://en.wikipedia.org/wiki/Functor#Properties)

> Two important consequences of the functor axioms are:
>
> - F transforms each commutative diagram in C into a commutative diagram in D;
> - if f is an isomorphism in C, then F(f) is an isomorphism in D.

So if in one category you have that g ∘ f = h, as in (from [Morphism](https://en.wikipedia.org/wiki/Morphism)):

![x](https://upload.wikimedia.org/wikipedia/commons/e/ef/Commutative_diagram_for_morphism.svg)

Then a functor will ensure this commutative diagram is also a commutative diagram in the second category. In this drawing from [Functor](https://en.wikipedia.org/wiki/Functor#Properties), you can see the previous commutative diagram on the bottom and top:

![x](https://upload.wikimedia.org/wikipedia/commons/b/b3/Commutative_diagram_of_a_functor.svg)

As discussed above, what makes a morphism a morphism is that the "composite" morphisms exist. That is, the commutative triangle given above is what defines a morphism in the context of a category. You can see the same drawing in [Category (mathematics)](https://en.wikipedia.org/wiki/Category_(mathematics)):

![x](https://upload.wikimedia.org/wikipedia/commons/f/ff/Category_SVG.svg)

See a slightly more involved but similar definition in [functor](https://ncatlab.org/nlab/show/functor).

The second property is also significant:

> - if f is an isomorphism in C, then F(f) is an isomorphism in D.

Let's say you had the following category:

![x](why-functors-1.svg)

Define a function (an attempt at an endofunctor) that maps every object and morphism to itself, except that it switches the morphisms $id_B$ and $h$ (notice this disrespects identity-preservation because $F(id_B) = h ≠ id_{F(B)} = id_B$). While we still have a commutative diagram corresponding to $g⨟f = id_B$ (namely $g⨟f = h$) we failed to preserve the isomorphism.

It may be more appropriate to call functors commutative-diagram-preserving and isomorphism-preserving, rather than composition-preserving and identity-preserving. The former more likely describes what someone wants from them, while the latter more likely only describes the mechanics.

For a slightly more complicated example of failing to preserve the identity (in the case of only one object), see [Monoid § Monoid homomorphisms](https://en.wikipedia.org/wiki/Monoid#Monoid_homomorphisms).

+++

### Define stuff, structure, properties

+++

The article [stuff, structure, property in nLab](https://ncatlab.org/nlab/show/stuff%2C+structure%2C+property#more_examples) provides a tempting definition of "structure" that could potentially free this word from its expected ambiguity (perhaps all three of these things are examples of "structure"). In the context of Exercise 6.7, this could help make it easier to guess what from Definition 5.36 (of a rig) we need to maintain. Which of the items in this list are stuff, structure, and properties? If remembering properties implies we also remember stuff, then perhaps we only need to worry about some these items and get the others to follow along. For example, see [Group homomorphism](https://en.wikipedia.org/wiki/Group_homomorphism). That article concludes at the start that because a group homomorphism preserves the group operator it must also preserve identities and inverses. Similarly, see the start of [Ring homomorphism](https://en.wikipedia.org/wiki/Ring_homomorphism).

This simple relationship is also implied by the comment:

> It is worth noting that this formalism captures the intuition of how “stuff”, “structure”, and “properties” are expected to be related:
>
>    - stuff may be equipped with structure;
>    - structure may have (be equipped with) properties.

See also this quote from [stuff, structure, property § More examples](https://ncatlab.org/nlab/show/stuff%2C+structure%2C+property#more_examples):

> The embedding of abelian groups into all groups, F: Ab → Grp is faithful and full, but not essentially surjective.

Unfortunately, it's not that simple. The language of [k-surjective functor](https://ncatlab.org/nlab/show/k-surjective+functor) at first seems to imply that with increasing k more "structure" is preserved. In fact, different values of k and combinations of k imply different kinds of "structure" (meaning stuff, structure, properties) is forgotten. See:

![x](functor-types.svg)

The author often presents algebraic structures as tuples, as in Exercise 6.7. For the homomorphism to preserve structure, it must preserve all the structure in the tuple. However, there can also be "structure" *between* the elements of these tuples, such as (in Exercise 6.7) the distributive property. In other cases the author seems to have an understanding of stuff, structure, properties as he lists them separately (e.g. Definition 3.6, Definition 3.35).

One way to see the stuff, structure, properties breakdown is in terms of a finite presentation of a category. If you see a category as a database (Chp. 3) then this is more obvious based on inspecting the type theory example [structure § GroupDataStructure](https://ncatlab.org/nlab/show/structure#GroupDataStructure). The properties correspond to the equations at the bottom of the diagram, the structure to the morphisms in the category, and the stuff to the objects in the category. Rather than a finite number of equations, there are equations that apply globally. For example, in the definition of [Property (mathematics)](https://en.wikipedia.org/wiki/Property_(mathematics)), we say that it must apply across all examples. Similarly, for a commutative diagram to "commute" means it applies in all cases. A [Universal property](https://en.wikipedia.org/wiki/Universal_property) extends a "traditional property" in being also true of an associated morphism (rather than just an object).

Another reason that this logic doesn't apply to Exercise 6.7 is that a homomorphism is not a functor. Both are examples of morphisms (are "structure" preserving in at least some sense) but a homomorphism is only preserving of *some* kind of structure on top of a set, and a functor is identity and composition preserving. It is true that rig homomorphisms happen to form a category (see [Rig](https://ncatlab.org/nlab/show/Rig)), but an endofunctor on that category would need to apply to every rig (not be defined between rigs). A rig does have some internal compositional structure to preserve, however, on its two monoids.

See also the much more detailed original paper on this topic, which explains e.g. why all these functors can be seen as surjective (and why an "injective" function across sets can even be seen as surjective). In particular, [section 2.4, p. 15](http://arxiv.org/PS_cache/math/pdf/0608/0608420v2.pdf#page=15) and [section 3.1, p. 17](http://arxiv.org/PS_cache/math/pdf/0608/0608420v2.pdf#page=17). The stuff/structure/property conversation comes up in more detail in [Forgetful functor](https://en.wikipedia.org/wiki/Forgetful_functor), relating it to logic.

An outstanding issue is the following statement from [full functor](https://ncatlab.org/nlab/show/full+functor):

> For ordinary functors this may sound odd, because there is no real sense in which “full” modifies “faithful.”

+++

*Exercise* 6.7

Consider part `1.`. Recall Definition 5.36 alongside this tuple. The sets $R$ and $S$ have no structure to preserve. To preserve the structure of the other elements of a rig, we will at least need the two rules the author provided:

1) $f(0_R) = 0_S$
2) $f(r_1 +_R r_2) = f(r_1) +_S f(r_2)$

We'll also at least need the following rule for the multiplication monoid:

3) $f(1_R) = 1_S$
4) $f(r_1 *_R r_2) = f(r_1) *_S f(r_2)$

The last bullet point in Definition 5.36 implies we should preserve the absorbing element zero ($f(0_R) = 0_S$) but this is already satisfied by condition `1.` above.

Do we also need to preserve commutativity of the addition monoid? I'd guess no; why? We can see the combination of `1.` and `2.` above as a functor, because a monoid with one element is effectively a category with a single object. By preserving the monoid operation we effectively preserve composition, because all commutative triangles in a monoid flatten into a linear chain. Any functor will end up being an equivalence of categories because the functor is only defined from one object to one object. The commutative property is a "property" in the language of [stuff, structure, property](https://ncatlab.org/nlab/show/stuff%2C+structure%2C+property), and therefore should be preserved by an equivalence of categories (which "forgets nothing" where nothing means none of stuff, structure, properties).

What does it mean to preserve the distributive property given in part (c) of Definition 5.36? If it's a property, it seems like it would be the same situation, so we'll assume it will be preserved without more rules.

Note that [Ring homomorphism](https://en.wikipedia.org/wiki/Ring_homomorphism) only requires {`2.`, `3.`, `4.`} and takes `1.` as a consequence; it's likely the proof/derivation uses negative elements. For a definition that only requires {`1.`, `2.`, `4.`}, see [Ring Homomorphism - from Wolfram MathWorld](https://mathworld.wolfram.com/RingHomomorphism.html).

+++

For part `2.` can we use a one-element set? See [Field with one element](https://en.wikipedia.org/wiki/Field_with_one_element); at least for a field this isn't a well-defined concept. However, why can't the multiplicative identity equal the [Additive identity](https://en.wikipedia.org/wiki/Additive_identity)? See [Additive identity § Properties](https://en.wikipedia.org/wiki/Additive_identity#Properties); there's no hard reason this isn't possible for a ring. In fact, this is known as the [Zero ring](https://en.wikipedia.org/wiki/Zero_ring).

However, the zero ring cannot serve as an initial object in **Rig** because we can still preserve structure and map the one element in this structure to either the additive or multiplicative identity in many other rigs (such as e.g. the natural numbers). That makes two morphisms (homomorphisms) from the zero ring to the natural numbers, when an initial object must only have one.

Having both a multiplicative and additive element implies (via the distributive property) that some other element 1+1 must exist, and via mathematical induction this implies we must have at least the natural numbers in an initial object. Are the natural numbers an initial object in **Rig**? There is exactly one morphism from them to the zero ring (all elements go to zero).

Without reading it, this solution looks long. For likely solutions to this question (check before checking the back of the book), see:
- [Rig in nLab](https://ncatlab.org/nlab/show/Rig)
- [rig in nLab](https://ncatlab.org/nlab/show/rig)

+++

### Interpretations of zero

The symbol 0 gets used in higher mathematics for much more than the number zero; see [Zero element](https://en.wikipedia.org/wiki/Zero_element). In part (d) of Definition 5.36 (a dependency of Exercise 6.7) it's specifically identified as an absorbing element, besides being the additive identity. Since we're in a section on initial objects, and have already learned about terminal objects, it may be worth looking at the concept of a [Zero object (algebra)](https://en.wikipedia.org/wiki/Zero_object_(algebra)) (which is both initial and terminal).

All over the article [Zero object (algebra)](https://en.wikipedia.org/wiki/Zero_object_(algebra)#Vector_space), the word "trivial" is used almost as a synonym for zero object. At the start:

> This article is about trivial or zero algebraic structures.

The article [Initial and terminal objects](https://en.wikipedia.org/wiki/Initial_and_terminal_objects) redefines "zero object" but links to [Zero object (algebra)](https://en.wikipedia.org/wiki/Zero_object_(algebra)#Vector_space) and specifically mentions:

> This is the origin of the term "zero object".

In [Initial and terminal objects](https://en.wikipedia.org/wiki/Initial_and_terminal_objects), the symbol 0 is often used for initial objects (though the author uses ∅). It's likely this is because 0 serves as the additive identity and so seems natural alongside the symbol + often used for the coproduct. The symbol 1 is similarly often used for terminal objects because it is the identity with respect to the categorical product. The article also mentions:

> Cat, the category of small categories with functors as morphisms has the empty category, 0 (with no objects and no morphisms), as initial object and the terminal category, 1 (with a single object with a single identity morphism), as terminal object.

While it often works to use 0 for an initial object and 1 for a terminal object, this also not a specific approach. It can also be confusing when a category has a "zero" object that is not initial (as in **Ring**/**Rig**, where the zero ring/rig is terminal).

+++

### *Exercise* 6.8

The initial object is clearly what is being universal in this context. The "comparable object" is any other object in the category.

In terms of [Universal property § Formal definition](https://en.wikipedia.org/wiki/Universal_property#Formal_definition), an initial object corresponds to the 1st definition and a terminal object corresponds to the 2nd. That is, in the 1st definition the unique morphism (dashed arrow) goes out from the blue object rather than into it:

![x](https://upload.wikimedia.org/wikipedia/commons/d/df/Universal_morphism_definition.svg)

+++

### *Exercise* 6.10

Call $!_{c_2}$ the unique morphism from $c_1$ to $c_2$. Call $!_{c_1}$ the unique morphism from $c_2$ to $c_1$. Then both are isomorphisms, because $id_{c_1} = !_{c_2} ⨟ !_{c_1}$ and $id_{c_2} = !_{c_1} ⨟ !_{c_2}$.

+++

## 6.2.2 Coproducts

+++

### *Exercise* 6.13

In a preorder all morphisms are unique, so we can remove any distinction between the types of arrows in (6.12) (that is, the dashed arrow can be thought of as solid). With this, for any coproduct we clearly have the two morphisms corresponding to the canonical injections:

$$
A ≤ A + B \\
B ≤ A + B
$$

Using the definition of join in [Join and meet § Partial order approach](https://en.wikipedia.org/wiki/Join_and_meet#Partial_order_approach), this shows that A+B is an upper bound of A and B.

How do we show that it is the least upper bound? Let's say there was some other upper bound Q ≤ A+B. We know that there is some morphism corresponding to the copairing $[f,g]$ so that (taking Q as T) we have A+B ≤ Q. So even if Q is technically distinct from A+B, they are isomorphic, just as two coproducts can be isomorphic.

Said another way, a coproduct has that for all objects T where A ≤ T and B ≤ T, that A+B ≤ T. That is, A+B is less than or equal to any other object and hence is the least upper bound.

Just as joins may not exist in every preorder, coproducts may not exist in every category.

+++

### *Exercise* 6.16

$$
\begin{align}
[f,g](apple1) = a \\
[f,g](banana1) = b \\
[f,g](pear1) = p \\
[f,g](cherry1) = c \\
[f,g](orange1) = o \\
[f,g](apple2) = e \\
[f,g](tomato2) = o \\
[f,g](mango2) = o
\end{align}
$$

+++

### *Exercise* 6.17

In Definition 6.11 we said that there is a unique morphism from the coproduct $A+B$ to all objects $T$ and pairs of morphisms $(f: A → T, g: B → T)$. Clearly $A+B$ exists because the category 𝓒 has coproducts, and $C$ can serve as one of these objects $T$ because it has appropriate functions $f$ and $g$. Taking $C$ as the object $T$ in diagram (6.12),  we can conclude that part `1.` and `2.` are true from the fact that the diagram commutes. Replacing the variable names:

![x](exercise-6-17.svg)

For part `3.`, we know that the morphisms $f ⨟ h$ and $g ⨟ h$ exist by simply composing morphisms, and therefore that $D$ can also serve as a $T$ in the definition and that there is some unique morphism from $A + B$ to $D$ we can call $[f ⨟ h, g ⨟ h]$. But $[f,g] ⨟ h$ also exists by simply composing morphisms, and therefore must equal $[f ⨟ h, g ⨟ h]$. Visually:

![x](exercise-6-17-part3.svg)

For part `4.` we know that the morphisms $ɩ_A$ and $ɩ_B$ exist because all coproducts exist, and therefore that $A+B$ can serve as a $T$ in the definition and that there is some unique morphism from $A + B$ to $A + B$ that we can call $[ɩ_A, ɩ_B]$. But $id_{A+B}$ exists by definition of $A+B$ being an object in the category, and therefore must equal $[ɩ_A, ɩ_B]$. Visually:

![x](exercise-6-17-part4.svg)

+++

*Exercise* 6.18

![x](raster/exercise-6-18.png)
![x](raster/exercise-6-18-2.png)

+++

For part `1.` is this simply constructing the copairing of the two morphisms? First, we'll have to construct a [Product category](https://en.wikipedia.org/wiki/Product_category).

How do we show that our definition, whatever we guess it to be, is an endo-bi-functor? We must show that it preserves identities and composition.

For part `2.` see the diagram (6.12) and put $∅$ on the right. That makes $ɩ_∅$ a unique morphism, and $g$ a unique morphism. Is the composition $ɩ_∅ ⨟ [f,g]$ also unique? No, it must equal $g$. What about the unique morphism across the top of the diagram from $∅$ to $A$?

Could $A$ serve as $T$ in the diagram to get a unique morphism from A+∅ to $A$? We would want to show $ɩ_A ⨟ [id_A,g] = id_A$ and $[id_A,g] ⨟ ɩ_A = id_{A+∅}$.

Does the author mean to say natural isomorphisms? The left and right unitors in [Monoidal category](https://en.wikipedia.org/wiki/Monoidal_category) are natural isomorphisms.

+++

## 6.2.3 Pushouts

Contrast with [Pullback (category theory)](https://en.wikipedia.org/wiki/Pullback_(category_theory)) (from section 3.5.3).

+++

*Exercise* 6.24

For part `1.`, what does it mean for all pushouts to exist? recall that a pushout consists of an object and two morphisms that have the pushout's object as the target.

For part `2.`, there is clearly an initial object in the category **1** corresponding the the single object; there is one morphism from it to every other object (namely, the identity morphism to itself). In the category **0** it is vacuously true that there is one morphism out of every object, but there is no object (hence it has no initial object).

+++

### *Exercise* 6.26

+++

First we'll construct the solution somewhat experimentally, by simply trying to get $f ⨾ ɩ_X = g ⨾ ɩ_Y$ (the black dashed arrows in the drawing below). The arrows in this drawing are in various styles only to make them easier to visually distinguish. Compare to (6.20):

![x](exercise-6-26-part1.svg)

In the previous, we could have still satisfied the requirement $f ⨾ ɩ_X = g ⨾ ɩ_Y$ by e.g. mapping both {2,4} in X to the same place we mapped {1}:

![x](exercise-6-26-part1-2.svg)

Although the diagram commutes, it does not satisfy (6.21) for all T. In the language of [pushout](https://ncatlab.org/nlab/show/pushout), it's not the universal solution to finding a commutative square like this (just one solution).

+++

To check the answer using the abstract description of Example 6.25, we'll start by filling in a binary relation with only the connections produced by the a ∈ A:

![x](exercise-6-26-part2.svg)

+++

Taking the reflexive, symmetric closure:

![x](exercise-6-26-part2-2.svg)

+++

This relatively sparse matrix is better visualized as a graph. This approach also makes it easier to see how the resulting equivalence categories are the connected components of the corresponding graph (see [Component (graph theory)](https://en.wikipedia.org/wiki/Component_(graph_theory))):

![x](exercise-6-26-part2-3.svg)

+++

Taking the transitive closure:

![x](exercise-6-26-part2-4.svg)

+++

### *Exercise* 6.28

+++

For `1.`, remember that the initial object has only one morphism to every object. This includes the coproduct $X+Y$; therefore the morphisms $f⨟ɩ_X$ and $g⨟ɩ_Y$ must be the same (i.e. $f⨟ɩ_X$ = $g⨟ɩ_Y$).

The conclusion in part `2.` follows directly from the universal property of a coproduct (see the commutative diagram in (6.12)). That is, adding (6.12) to the diagram on the left results in (6.21).

For part `3.` assume we have a pushout $X +_∅ Y$, so that as given in part (b) of the definition of a pushout there is a unique morphism $t$ from it to any other object $T$ and (6.21) commutes. The pushout $X +_∅ Y$ is then a coproduct $X + Y$ with respect to $X$ and $Y$ where the the copairing $[f,g]$ given in (6.12) is equal to $t$.

+++

### *Example* 6.29

+++

This example starts:

> If $T$ is any other set and we have maps $x\colon X\to T$ and $y\colon Y\to T$ that commute with $f$ and $g$, i.e. $f\cong x=g\cong y$, then this commutativity implies that ...

It seems likely the congruent symbols ($\cong$) are wrong. This makes more sense:

> If $T$ is any other set and we have maps $x\colon X\to T$ and $y\colon Y\to T$ that commute with $f$ and $g$, i.e. $f⨟x=g⨟y$, then this commutativity implies that ...

Thinking of this example in terms of connected components (see [Component (graph theory)](https://en.wikipedia.org/wiki/Component_(graph_theory))) makes it much easier to accept the solution. If you follow the blue dotted lines in the drawing, you'll see there is just one single large component.

+++

## 6.2.4 Finite colimits

+++

*Exercise* 6.35

+++

*Exercise* 6.41

+++

## 6.2.5 Cospans

+++

*Exercise* 6.48

+++

*Exercise* 6.49

+++

# 6.3 Hypergraph categories

See [Review "Seven-Sketches suggestions" - Google Docs](https://docs.google.com/document/d/1HC_BRM2deHxS7FiIto2bfrM81grKu8vDiI-JgCY5eXU/edit).
