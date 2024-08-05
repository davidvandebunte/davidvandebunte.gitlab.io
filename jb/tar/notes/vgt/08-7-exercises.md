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

# 8.7 Exercises

+++

## 8.7.1 Basics

+++

### Exercise 8.1

+++

> (a) In the homomorphism ϕ in Figure 8.2, what is ϕ(2)?

r²

> (b) In the homomorphism θ in Figure 8.4, what is θ(1)?

2

> (c) In the isomorphism in Figure 8.8, the equation 1 + 2 = 3 in the domain corresponds to what equation in the codomain?

$$
i(-1) = -i
$$

> (d) In the homomorphism τ₁ in Figure 8.9, what elements map to b?

$\{-k, k\}$

> (e) In the homomorphism τ₂ in Figure 8.9, what elements map to 0?

$\{0,2,4,6,8\}$

+++

### Exercise 8.2

+++

> For each statement below, determine whether it is true or false.
>
> (a) For any groups H and G, there is some homomorphism from H to G.

True, map the trivial subgroup.

> (b) For any groups H and G, there is some embedding of H into G.

True, map the trivial subgroup.

> (c) Every homomorphism is either an embedding or a quotient map.

True

> (d) Embeddings are those homomorphisms whose kernel is empty.

False

>  (e) When $A ≅ B$, there is some isomorphism $i: A → B$, and therefore there is also an isomorphism $j: B → A$.

True, the function is both surjective and injective, therefore it is bijective, and therefore it has an inverse.

+++

## 8.7.2 Homomorphisms

+++

### Exercise 8.3

+++

> If $ϕ : G → H$ maps every element of $G$ to the identity element of $H$, is $ϕ$ a homomorphism?

Yes, unless G is the trivial group this is a quotient map to the trivial subgroup of H.

+++

### Exercise 8.4 (🕳️)

+++

> For each part below, list all homomorphisms (both embeddings and quotient maps) with the given domain and codomain. Does each collection of homomorphisms form a group, as collections of automorphisms do?

A general strategy is to consider all the subgroups in the codomain, and for each one, try to find a mapping from the domain (we need to cover the whole domain) to the subgroup.

If the domain is larger than the codomain, you're only going to find quotient maps. If the codomain is larger or the same size, you may find an embedding.

+++

> (a) Domain C₃ and codomain C₂

{0,1,2} -> 0  (order 1)

This collection is the trivial group.

+++

> (b) Domain C₂ and codomain C₃

{0,1} -> 0    (order 1)

This collection is the trivial group.

+++

> (c) Domain and codomain both C₄

{0,1,2,3} -> 0                  (order 1) \
0 -> 0, 1 -> 1, 2 -> 2, 3 -> 3  (order 4) \
0 -> 0, 1 -> 3, 2 -> 2, 3 -> 1  (order 4) \
{0,2} -> 0, {1,3} -> 2          (order 2)

The whole collection is not a group; there's no way to map from an order 1 or 2 group to an order 4 group and then back again.

Call the first of the two order-4 groups $0123$ and the second $0321$ (using one-line notation). These construct a group isomorphic to C₂ with the generator $0321$; this is the automorphism group of C₄.

+++

> (d) Domain C₂ and codomain V₄

+++

{0,1} -> 0 \
0 -> e, 1 -> v   (order 2) \
0 -> e, 1 -> h   (order 2) \
0 -> e, 1 -> d   (order 2)

The whole collection is not a group; although there are several order 2 groups the underlying sets are not equal (i.e. $v ≠ h$) and therefore cannot be mapped to each other.

+++

> (e) Domain and codomain both V₄

+++

{e,v,h,d} -> 0 \
e -> e, v -> v, h -> h, d -> d

The rest in cycle notation: \
(vhd) \
(vdh) \
(vd)h \
(vh)d \
(hd)v

The six order-4 groups form the automorphism group of V₄. Two actions that can serve as generators are (vhd) and (vd)h.

+++

### Exercise 8.5

+++

> Consider the function ϕ : Z → Z by ϕ(n) = 2n. Justify your answer to each of the following questions about ϕ.
>
> (a) Is it a homomorphism? If so, is it an embedding or a quotient map?

An embedding, because the mapping is one-to-one.

+++

> (b) Would ϕ be a homomorphism if it were to use a different coefficient than 2? If so, what numbers could be used in place of 2?

Any positive or negative integer, and zero.

> (c) What are Ker(ϕ) and Im(ϕ)?

Ker(ϕ) = {0} \
Im(ϕ)  = ⟨2⟩

+++

### Exercise 8.6 (🔨,🕳️)

+++

> Assume there is a homomorphism $ϕ: G → H$. Justify your answers to each of the following questions.
>
> (a) If there is a subgroup $K < G$, will the set of elements in $H$ to which $ϕ$ maps elements of $K$ also be a subgroup?

We'll use $ϕ[K]$ to indicate the set of elements to which $ϕ$ maps the elements of $K$ (notation from [Image of a subset](https://en.wikipedia.org/wiki/Image_(mathematics)#Image_of_a_subset)).

If $ϕ$ is an embedding (an injective homomorphism) then $ϕ[K] < H$ because the generators of $K$ will be mapped one-to-one into $ϕ[K]$ and these same generators can be used to reproduce the group in $H$.

Assume H < H (ϕ is a quotient map). If K < Ker(ϕ), then all the elements of K will be mapped to the trivial subgroup in H (which is of course a subgroup).

Assume Ker(ϕ) < K. From Observations 8.2 through 8.4 we know that Ker(ϕ) is a normal
subgroup of G. We know Ker(ϕ) ⊲ K because Ker(ϕ) is still a subgroup of K using the
same generators, and the logic in Observation 8.4 to show Ker(ϕ) is normal should still
apply using all the elements of K rather than of G. Since Ker(ϕ) is normal in K, we can
use the quotient process with it to get a group in H based on only the elements of K.

Assume Ker(ϕ) and K are disjoint subgroups of G. An example of this is the mapping of
S₃ → C₂ in Figure 7.21, with K = ⟨f⟩ and Ker(ϕ) = ⟨r⟩. The set of elements in H to which
ϕ maps elements of ⟨f⟩ is {H, fH}. Although other elements of G ({r,r²,r²f,rf}) were
mapped to this subgroup, it is still true that {H, fH} is a subgroup of the new group.

In general, consider a subgroup L of both Ker(ϕ) and K.

> (b) If there is a normal subgroup $K ⊲ G$, will the set of elements in $H$ to which $ϕ$ maps elements of $K$ also be a normal subgroup?

If K is a normal subgroup, we can divide G by K to get a subgroup G/K.

> (c) If there is a subgroup $K < H$, will the set of elements in $G$ that $ϕ$ maps to elements of $K$ also be a subgroup?

> (d) If there is a normal subgroup $K ⊲ H$, will the set of elements in $G$ that $ϕ$ maps to elements of $K$ also be a normal subgroup?

+++

### Exercise 8.7

+++

## 8.7.3 Embeddings

+++

### Exercise 8.8

+++

### Exercise 8.9

+++

### Exercise 8.10
