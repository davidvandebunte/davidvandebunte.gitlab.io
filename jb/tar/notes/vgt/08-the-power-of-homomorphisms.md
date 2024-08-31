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

# 8. The power of homomorphisms

+++

When you remove the "homo" prefix you get [morphism](https://en.wikipedia.org/wiki/Morphism), which might suggest that a "morphism" is no longer between objects of the same ("homo") type. This is not correct; a morphism is still actually defined between objects of the same "type" and is in fact a more abstract and arguably more complicated concept (coming historically much later).

+++

## 8.1 Embeddings and quotient maps

+++

Compare [Homomorphism](https://en.wikipedia.org/wiki/Homomorphism), [Group homomorphism](https://en.wikipedia.org/wiki/Group_homomorphism), and [Embedding](https://en.wikipedia.org/wiki/Embedding). The author doesn't add anything original to those articles, but does fit a few concepts into book-specific language and gives unique visual examples. A few paragraphs at the bottom of pg. 160 regarding generating a full homomorphism from just a part of it doesn't have a clear correspondence on Wikipedia, though it seems likely it has been invented before.

+++

Intuitively, homomorphisms make "multiplication" (or in general the "operator") work the same both before and after the application of the homomorphism function to all the involved elements. So if $a = bc$ before, then $ϕ(a) = ϕ(b)ϕ(c)$ after; it's simply more compact to say this as $ϕ(bc) = ϕ(b)ϕ(c)$. This meaning makes the concept of homomorphisms much more general than the concept of group homomorphisms. To make it clear we are talking about some general "operator" some articles (e.g. [Group isomorphism](https://en.wikipedia.org/wiki/Group_isomorphism)) use special symbols like ⊙ ("Circled dot operator" in Unicode) or $⋆$ ("Star operator") rather than simply concatenating terms.

+++

If the operator works the same on both sides of a map, that you can potentially perform the same operations on the second side of the map more efficiently. For example, there's a map from the real numbers to the floating point numbers that's approximately a homomorphism. Within the floating point numbers there are several types and levels of precision (single-precision, double-precision).

+++

Through the rest of the book, the term "homomorphism" will be used only to mean [Group homomorphism](https://en.wikipedia.org/wiki/Group_homomorphism) despite its more general definition.

+++

### 8.1.1 Embeddings

+++

Compare [Embedding](https://en.wikipedia.org/wiki/Embedding) and [Group isomorphism](https://en.wikipedia.org/wiki/Group_isomorphism). In the second paragraph and a bit in the next section, the author categorizes all homomorphisms as being either (1) an embedding or (2) a quotient map. The article [Group homomorphism](https://en.wikipedia.org/wiki/Group_homomorphism) would form an isomorphic partition of all homomorphisms by classifying them as injective or not (the language that we'll prefer). That is, the author defines an "embedding" as a [monomorphism](https://en.wikipedia.org/wiki/Monomorphism) (in the non-categorical sense).

+++

The author claims that an embedding (i.e. monomorphism) is an isomorphism if its image fills the whole codomain. This is stated more generally in [Group homomorphism § Image and kernel](https://en.wikipedia.org/wiki/Group_homomorphism#Image_and_kernel):

> The kernel and image of a homomorphism can be interpreted as measuring how close it is to being an isomorphism.

+++

In particular, the smaller the kernel is the closer the homomorphism is to being injective (it's injective when the kernel is a single element). The large the image is, the closer it is being surjective (it's surjective when the image fills the codomain).

+++

### 8.1.2 Quotient maps

+++

Compare [Quotient maps](https://en.wikipedia.org/wiki/Quotient_map) and [Kernel (algebra)](https://en.wikipedia.org/wiki/Kernel_(algebra)). The author's argument in this section ("Observation" 8.2 through 8.4) sometimes seems to have holes. The whole thing can equivalently be boiled down to the following from [Group homomorphism § Image and kernel](https://en.wikipedia.org/wiki/Group_homomorphism#Image_and_kernel):

> The kernel of h is a [normal subgroup](https://en.wikipedia.org/wiki/Normal_subgroup "Normal subgroup") of *G*. Assume $u \in \operatorname{im}(h)$ and show $g^{-1} \circ u \circ g \in \operatorname{im}(h)$ for arbitrary $u, g$:
> $$\begin{align}
  h\left(g^{-1} \circ u \circ g\right) &= h(g)^{-1} \cdot h(u) \cdot h(g) \\
                                       &= h(g)^{-1} \cdot e_H  \cdot h(g) \\
                                       &= h(g)^{-1} \cdot h(g) = e_H,
\end{align}$$

+++

Humans categorize; see [Classification](https://en.wikipedia.org/wiki/Classification) (a redirect of [Categorization](https://en.wikipedia.org/wiki/Categorization)). To categorize something is closely related to the concept of [Quotient maps](https://en.wikipedia.org/wiki/Quotient_map). In both cases we take what are effectively different things (e.g. different traffic signs, or different elements of a set) and map them to the same thing (the equivalence class). This human habit is also the source of the wonderful [Up to](https://en.wikipedia.org/wiki/Up_to) jargon. The benefit of categorization is that we can efficiently separate items we "care" about (that are "valuable") from those we don't care about. We often have to find some distinct aspect of worlds we care and don't care about to act on them differently.

+++

What makes a quotient map different from other kinds of equivalence relations is that it's done on the elements of an algebraic structure (in this case, a group). Per [Equivalence relation](https://en.wikipedia.org/wiki/Equivalence_relation), these are called a [congruence relation](https://en.wikipedia.org/wiki/Congruence_relation):

> A [congruence relation](https://en.wikipedia.org/wiki/Congruence_relation "Congruence relation") is an equivalence relation whose domain $X$ is also the underlying set for an [algebraic structure](https://en.wikipedia.org/wiki/Algebraic_structure "Algebraic structure"), and which respects the additional structure. In general, congruence relations play the role of [kernels](https://en.wikipedia.org/wiki/Kernel_(algebra) "Kernel (algebra)") of homomorphisms, and the quotient of a structure by a congruence relation can be formed. In many important cases, congruence relations have an alternative representation as substructures of the structure on which they are defined (e.g., the congruence relations on groups correspond to the [normal subgroups](https://en.wikipedia.org/wiki/Normal_subgroup "Normal subgroup")).

+++

A congruence relation is a continuation of the theme that the "operator" works the same, as discussed above.

+++

## 8.2 The Fundamental Homomorphism Theorem

+++

The [fundamental theorem on homomorphisms](https://en.wikipedia.org/wiki/Fundamental_theorem_on_homomorphisms "Fundamental theorem on homomorphisms") states that the [image](https://en.wikipedia.org/wiki/Image_(mathematics) "Image (mathematics)") of a homomorphism is [isomorphic](https://en.wikipedia.org/wiki/Isomorphism "Isomorphism") to the quotient by the kernel. It actually applies to many structures other than groups. The author provides some great visual examples but nothing original relative to Wikipedia.

+++

Per [Isomorphism theorems § Note on numbers and names](https://en.wikipedia.org/wiki/Isomorphism_theorems#Note_on_numbers_and_names), this theorem is also confusingly called the [first isomorphism theorem](https://en.wikipedia.org/wiki/First_isomorphism_theorem "First isomorphism theorem") by some authors, but authors who call it the "fundamental theorem of homomorphisms" call a different theorem the first isomorphism theorem. The authors who call it fundamental are generally earlier, and the title "fundamental theorem of homomorphisms" is currently not ambiguous, and therefore "fundamental" should be preferred.

+++

## 8.3 Modular arithmetic

+++

## 8.4 Direct products and relatively prime numbers

+++

From [Cyclic group § Additional properties](https://en.wikipedia.org/wiki/Cyclic_group#Additional_properties):

+++

> If *n* and *m* are [coprime](https://en.wikipedia.org/wiki/Coprime "Coprime"), then the [direct product](https://en.wikipedia.org/wiki/Direct_product_of_groups "Direct product of groups") of two cyclic groups **Z**/*n***Z** and **Z**/*m***Z** is isomorphic to the cyclic group **Z**/*nm***Z**, and the converse also holds: this is one form of the [Chinese remainder theorem](https://en.wikipedia.org/wiki/Chinese_remainder_theorem "Chinese remainder theorem"). For example, **Z**/12**Z** is isomorphic to the direct product **Z**/3**Z** × **Z**/4**Z** under the isomorphism (*k* mod 12) → (*k* mod 3, *k* mod 4); but it is not isomorphic to **Z**/6**Z** × **Z**/2**Z**, in which every element has order at most 6.

+++

## 8.5 The Fundamental Theorem of Abelian Groups

+++

What the author calls the "Fundamental Theorem of Abelian Groups" is known elsewhere as the [fundamental theorem of *finite* abelian groups](https://en.wikipedia.org/wiki/Fundamental_theorem_of_finite_abelian_groups "Fundamental theorem of finite abelian groups"), which is distinct from the [fundamental theorem of *finitely generated* abelian groups](https://en.wikipedia.org/wiki/Fundamental_theorem_of_finitely_generated_abelian_groups "Fundamental theorem of finitely generated abelian groups").

+++

## 8.6 Semidirect products revisited

+++

See also [Automorphism](https://en.wikipedia.org/wiki/Automorphism).
