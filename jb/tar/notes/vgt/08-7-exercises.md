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

{0,1,2} → 0  (order 1)

This collection is the trivial group.

+++

> (b) Domain C₂ and codomain C₃

{0,1} → 0    (order 1)

This collection is the trivial group.

+++

> (c) Domain and codomain both C₄

{0,1,2,3} → 0                  (order 1) \
0 → 0, 1 → 1, 2 → 2, 3 → 3  (order 4) \
0 → 0, 1 → 3, 2 → 2, 3 → 1  (order 4) \
{0,2} → 0, {1,3} → 2          (order 2)

The whole collection is not a group; there's no way to map from an order 1 or 2 group to an order 4 group and then back again.

Call the first of the two order-4 groups $0123$ and the second $0321$ (using one-line notation). These construct a group isomorphic to C₂ with the generator $0321$; this is the automorphism group of C₄.

+++

> (d) Domain C₂ and codomain V₄

+++

{0,1} → 0 \
0 → e, 1 → v   (order 2) \
0 → e, 1 → h   (order 2) \
0 → e, 1 → d   (order 2)

The whole collection is not a group; although there are several order 2 groups the underlying sets are not equal (i.e. $v ≠ h$) and therefore cannot be mapped to each other.

+++

> (e) Domain and codomain both V₄

+++

{e,v,h,d} → 0 \
e → e, v → v, h → h, d → d

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

> Consider the function $ϕ: Z → Z$ defined by $ϕ(n) = 2n$. Justify your answer to each of the following questions about $ϕ$.
>
> (a) Is it a homomorphism? If so, is it an embedding or a quotient map?

An embedding, because the mapping is one-to-one.

+++

> (b) Would $ϕ$ be a homomorphism if it were to use a different coefficient than 2? If so, what numbers could be used in place of 2?

Any positive or negative integer, and zero. That is, $ℤ$.

+++

> (c) What are $Ker(ϕ)$ and $Im(ϕ)$?

$Ker(ϕ) = {0}$ \
$Im(ϕ)  = ⟨2⟩$

+++

### Exercise 8.6 (🕳️)

+++

> Assume there is a homomorphism $ϕ: G → H$. Justify your answers to each of the following questions.
>
> (a) If there is a subgroup $K < G$, will the set of elements in $H$ to which $ϕ$ maps elements of $K$ also be a subgroup?

+++

We'll use $L = ϕ[K]$ to name the "set" of elements in $H$ to which $ϕ$ maps elements of $K$ (notation from [Image of a subset](https://en.wikipedia.org/wiki/Image_(mathematics)#Image_of_a_subset)). The question changes the meaning of the symbol $K$ between parts $(a),(b)$ and parts $(c),(d)$. The meaning in parts $(a),(b)$ is (see also [this drawing](https://en.wikipedia.org/wiki/Group_homomorphism#/media/File:Group_homomorphism_ver.2.svg)):

+++

![x](08-6-ex-06-a.svg)

+++

We used dashed lines for the image of a subset and dotted lines (below) for the preimage of a subset, following [Image (mathematics)](https://en.wikipedia.org/wiki/Image_(mathematics)). In general these lines need to be distinguished because in general $K \neq ϕ^{-1}[ϕ[K]]$.

+++

Intuitively, a homomorphism "preserves structure" in some sense specific to the situation (a group homomorphism preserves group structure). It would make sense that a map that preserves structure at the larger/composite level would also preserve structure at the lower/component level. Is that actually the case?

+++

We know that $ϕ(g_1·_Gg_2) = ϕ(g_1)·_Hϕ(g_2)$, where $g_1,g_2 ∈ G$. Is it also the case that $ϕ(k_1·_Gk_2) = ϕ(k_1)·_Hϕ(k_2)$, where $k_1,k_2 ∈ K$? Yes, because $k_1,k_2 ∈ G$. We also know there is some subgroup $K < G$ with its own operation $·_K$ (defined on a subset of $·_G$), meaning we also have that $ϕ(k_1·_Kk_2) = ϕ(k_1)·_Hϕ(k_2)$.

+++

We could try to show that $ϕ(k_1)·_Hϕ(k_2) = ϕ(k_1)·_Lϕ(k_2)$ i.e. that there is also some group homomorphism $φ: K → L$ but we can't say much about this operator $·_L$. The fact that $φ$ is a group homomorphism (if we could show that) would mean that it maps a group to another group as asserted by e.g. [Group homomorphism](https://en.wikipedia.org/wiki/Group_homomorphism#Category_of_groups) (if you accept that assertion).

+++

Another approach could use that a group can be presented as being generated from a finite set of generators. All the generators must be mapped to the image because all elements are mapped. From these mapped generators, we should be able to create a group presentation i.e. make it clear we have a group. This may be more obvious in the case of an embedding (when each generator is mapped distinctly) but even if different generators are mapped to the same element in the codomain we should still be able to come up with a presentation that's simplified by some generators getting the same name.

+++

We can also simply try to directly show $L$ is a group given $ϕ: G → H$ is a group homomorphism. For it to be a group, it must have an identity, inverses, and be associative and closed.

+++

#### Identity

+++

From the property $ϕ(k_1·_Kk_2) = ϕ(k_1)·_Hϕ(k_2)$ we should be able to conclude that $ϕ$ maps the identity element $e_K$ to $e_H = e_L$, i.e. that $ϕ(e_K) = e_H$. Indeed, assume that either $k_1$ or $k_2$ is equal $e_K$ and call the non-$e_K$ element just $k$. We then know that $ϕ(e_K·_Kk) = ϕ(e_K)·_Hϕ(k)$ or that $ϕ(k) = ϕ(e_K)·_Hϕ(k)$. Multiplying by $ϕ(k)^{-1}$ on the right gives $ϕ(k)ϕ(k)^{-1} = ϕ(e_K)ϕ(k)ϕ(k)^{-1} = e_H = ϕ(e_K)$.

+++

#### Inverses

+++

Can we also show that we always have inverses? For any element $g$ we know that $ϕ(gg^{-1}) = ϕ(g)ϕ(g^{-1}) = ϕ(e_G) = e_H$. If $ϕ(g)ϕ(g^{-1}) = e_H$ then $ϕ(g^{-1}) = ϕ(g)^{-1}$.

+++

#### Associativity

+++

For arbitary $a,b,c$, is it the case that $(ϕ(a)·ϕ(b))·ϕ(c) = ϕ(a)·(ϕ(b)·ϕ(c))$? We know that $(a·b)·c = a·(b·c)$, from which we can conclude:

$$
\begin{align}
ϕ((a·b)·c) &= ϕ(a·(b·c)) \\
ϕ(a·b)·ϕ(c) &= ϕ(a)·ϕ(b·c) \\
(ϕ(a)·ϕ(b))·ϕ(c) &= ϕ(a)·(ϕ(b)·ϕ(c)) \\
\end{align}
$$

+++

#### Closed

+++

For arbitrary $a,b ∈ K$, is it the case that $ϕ(a)ϕ(b) ∈ ϕ[K]$? We know that $ab ∈ K$ (call this element $ab = c$). Therefore $ϕ(ab) = ϕ(c) = ϕ(a)ϕ(b) ∈ ϕ[K]$.

+++

> (b) If there is a normal subgroup $K ⊲ G$, will the set of elements in $H$ to which $ϕ$ maps elements of $K$ also be a normal subgroup?

+++

Working forward, we know that $gkg^{-1} ∈ K$ for all $k ∈ K$ and $g ∈ G$ by virtue of it being a normal subgroup. Working backward, we know that $ϕ[K]$ is a subgroup from the previous question, so we just need to show that it is normal i.e that $ϕ(g)ϕ(k)ϕ(g)^{-1} ∈ ϕ[K]$ for all $ϕ(k) ∈ ϕ[K]$ and $ϕ(g) ∈ ϕ[G]$. Notice $ϕ[G] = Im(ϕ)$ is not necessarily equivalent to $H$. From [the errata](http://web.bentley.edu/empl/c/ncarter/vgt/errata.html#appendix):

+++

> Part $(b)$ is ambiguous. It asks if the set of elements to which $ϕ$ maps $K$ will be normal, but it does not say normal in what group. It will always be normal in $Im(ϕ)$, but not always normal in $H$.

+++

Working forward again, we know $ϕ(gkg^{-1}) ∈ ϕ[K]$ by applying $ϕ$ to both sides of $gkg^{-1} ∈ K$. Take $w = gk$ in $ϕ(gkg^{-1}) ∈ ϕ[K]$ to get $ϕ(wg^{-1}) ∈ ϕ[K]$ from which we can derive $ϕ(w)ϕ(g^{-1}) = ϕ(w)ϕ(g)^{-1} = ϕ(gk)ϕ(g)^{-1} = ϕ(g)ϕ(k)ϕ(g)^{-1} ∈ ϕ[K]$ by definition of $ϕ$ being a homomorphism.

+++

If $ϕ$ was surjective, then we could make the more general claim that this is equivalent to $hϕ(k)h^{-1} ∈ ϕ[K]$ for all $ϕ(k) ∈ ϕ[K]$ and $h ∈ H$.

+++

> (c) If there is a subgroup $K < H$, will the set of elements in $G$ that $ϕ$ maps to elements of $K$ also be a subgroup?

+++

Call the set of elements in $G$ that $ϕ$ maps to elements of $K$ by the name $J = ϕ^{-1}[K]$:

+++

![x](08-6-ex-06-c.svg)

+++

We can only use $ϕ^{-1}$ in the sense of a preimage of a set (not a function), because if $ϕ$ is non-injective then many elements in $G$ will map to one in $H$.

+++

We know that $ϕ(g_1·_Gg_2) = ϕ(g_1)·_Hϕ(g_2)$, where $g_1,g_2 ∈ G$. Is it still the case that $ϕ(j_1·_Gj_2) = ϕ(j_1)·_Hϕ(j_2)$, where $j_1,j_2 ∈ J$? Yes, because $j_1,j_2 ∈ G$. We also know there is some subgroup $K < H$ with its own operation $·_K$ (defined on a subset of $·_H$), meaning we also have that $ϕ(j_1·_Gj_2) = ϕ(j_1)·_Hϕ(j_2) = ϕ(j_1)·_Kϕ(j_2)$. Does the operator $·_G$ restricted to operations in the set $J$ (call this operator $·_J$) also define a group homomorphism $ϕ: J → L$?

+++

#### Identity

+++

Does the set $J$ also have an identity $e_J$? We have an identity $e_H = e_K$ because for $K$ to be a subgroup it must include the larger group identity $e_H$. We know that $ϕ$, regardless of how it maps this close side set, must map $e_G$ to $e_H$. Since $ϕ(e_G)$ is in $K$ we know that $e_G$ is in $J$, by just taking the inverse of $ϕ$.

+++

#### Inverses

+++

Take some arbitrary element $j \in J$, does it have an inverse in $J$? The element $j$ will have an inverse $j^{-1} \in G$ (because $G$ is a group). Following similar reasoning to above, for any element $j$ we know that $ϕ(jj^{-1}) = ϕ(j)ϕ(j^{-1}) = ϕ(e_G) = e_H$. If $ϕ(j)ϕ(j^{-1}) = e_H$ then $ϕ(j^{-1}) = ϕ(j)^{-1}$.


The element $ϕ(j)$ must have an inverse $ϕ(j)^{-1} \in H$ (because $H$ is a group), and an inverse $ϕ(j)^{-1} \in K$ (because $K$ is a group). The inverse is unique, so these must be the same, and also equal $ϕ(j^{-1})$ mentioned above. This shows that $j^{-1}$, which we previously could only show was in $G$, is actually in the preimage $J = ϕ^{-1}[K]$.

+++

#### Associativity

+++

For arbitary $a,b,c \in J$ we know it is always the case that $(ϕ(a)·ϕ(b))·ϕ(c) = ϕ(a)·(ϕ(b)·ϕ(c))$ because $K$ is a group. Can we show that $(a·b)·c = a·(b·c)$ as well?

$$
\begin{align}
(ϕ(a)·ϕ(b))·ϕ(c) &= ϕ(a)·(ϕ(b)·ϕ(c)) \\
ϕ(a·b)·ϕ(c) &= ϕ(a)·ϕ(b·c) \\
ϕ((a·b)·c) &= ϕ(a·(b·c)) \\
\end{align}
$$

+++

#### Closed

+++

Take two arbitrary elements $a,b \in J$. Will their product $c = ab$ also be in $J$? It will be if we can show that $ϕ(c) \in K$. We know that $ϕ(a)$ and $ϕ(b)$ are in $K$, and because it is a group and therefore closed the product $ϕ(a)ϕ(b) \in K$. Given $ϕ$ is a homomorphism we also know $ϕ(a)ϕ(b) = ϕ(ab) = ϕ(c)$, which is what we wanted to show.

+++

> (d) If there is a normal subgroup $K ⊲ H$, will the set of elements in $G$ that $ϕ$ maps to elements of $K$ also be a normal subgroup?

+++

See comments in [Group homomorphism § Image and kernel](https://en.wikipedia.org/wiki/Group_homomorphism#Image_and_kernel) showing the kernel is a normal subgroup; we can follow similar logic. Assume $j \in J$; we must show $g^{-1}jg \in J$ for arbitrary $j,g$, which is equivalent to $ϕ(g^{-1}jg) \in K$. We know that $ϕ\left(g^{-1} j g\right) = ϕ(g)^{-1} \cdot ϕ(j) \cdot ϕ(g)$ given $ϕ$ is a homomorphism. Given $ϕ(j) \in K$ and that $K$ is a normal subgroup, it is indeed the case that $ϕ(g)^{-1} \cdot ϕ(j) \cdot ϕ(g) \in K$.

+++

### Exercise 8.7

+++

> Use the concept of generating a homomorphism (page 161) to explain why any homomorphism must map the domain's identity element to the codomain's identity element.

+++

We should also be able to do this without reference to pg. 161. In fact, we've already done so in the previous question. To answer this question we'll go through the logic in more detail, and try to vary it a bit.

For the identity element $e_G$ in the domain $g = ge_G = e_Gg$ for all $g \in G$.

We know the codomain $H$ is a group and must have an identity element $e_H$ for which it also holds that $h = he_H = e_Hh$ for all $h \in H$.

Given a homomorphism $ϕ$ we must have $ϕ(g) = ϕ(g)ϕ(e_G) = ϕ(e_G)ϕ(g)$ for all $g \in G$. In the $Im(ϕ)$ (which we'll call $L$) we must therefore have $l = lϕ(e_G) = ϕ(e_G)l$ for all $l \in L$.

Recall that a group can only have one identity element. Call the identity element in a group $e$, and assume it has some other identity element $a$. If $e$ is the identity element then that implies $g = eg$, and if $a$ is another identity element then $g = ag$. This implies $g = eg = ag$ or (cancelling $g$ from the right) that $e = a$.

Therefore the identity element $ϕ(e_G)$ in $L$ must equal the identity element $e_H$ in $H$, that is, we must have that $e_H = ϕ(e_G)$.

+++

## 8.7.3 Embeddings

+++

### Exercise 8.8

+++

> Is it possible to embed $C_n$ in $Z$ with a homomorphism? Explain your answer.

+++

We could trivially map $C_1$ to $Z$ by mapping the only element (the identity) in $C_1$ to the identity in $Z$. We could map any $C_n$ to the identity in $Z$, in fact, although this would no longer be an embedding (just a homomorphism).

+++

A group homomorphism is a map from a group to a group, and there are only two possible subgroups on the "far side" of this theoretical map (in $Z$). These are the identity map, which we've discussed, and the whole group. Can we map $C_n$ to the whole group?

+++

It does not seem possible to map any $C_n$ to all of $Z$. One way to think about this is that a finite group cannot possibly cover all of an infinite group. Each element of the finite group can only map to one element in the codomain, making the image of the homomorphism smaller than the codomain (a non-surjective map). The product of any two elements in the codomain must again be a member of the homomorphism's image if it is the case that $ϕ(ab) = ϕ(a)ϕ(b)$, so there would be no way to cover the rest of the infinite group.

+++

### Exercise 8.9 (📑)

+++

> (a) How many embeddings of $C_4$ are there into itself?

+++

Two, see Exercise 8.4c above.

+++

> (b) How many automorphisms are there of $C_4$?

+++

Two, see Exercise 8.4c above.

+++

> (c) Is an embedding of any group into itself always an automorphism?

+++

No, this is true only if the group is finite. Consider the mapping in Exercise 8.5 above for an example of an embedding of a group into itself that is not an automorphism.

+++

For finite groups, by definition an embedding is a one-to-one mapping from the domain to the codomain (it is injective). Because the domain and codomain are the same size, we can also say that it's surjective. This makes it an isomorphism, and an isomorphism from a group to itself is an automorphism.

+++

### Exercise 8.10

+++

> For each part below, describe all the embeddings with the given domain and codomain. Choose one from each part (if available) to diagram.
>
> (a) Domain $C_2$ and codomain $V_4$

+++

0 → e, 1 → v \
0 → e, 1 → h \
0 → e, 1 → d

+++

We'll skip the diagrams in this question since they all seem rather simple/duplicate.

+++

> (b) Domain $C_2$ and codomain $C_3$

+++

None

+++

> (c) Domain $C_2$ and codomain $C_4$

+++

0 → 0, 1 → 2

+++

> (d) Domain $C_3$ and codomain $S_3$

+++

0 → e, 1 → r , 2 → r² \
0 → e, 1 → r², 2 → r

+++

> (e) Domain $C_n$ and codomain $ℤ$

+++

See Exercise 8.8 (only the trivial homomorphism for $C_1$).

+++

> (f) Domain and codomain both $ℤ$

+++

The only automorphisms are $ϕ(n) = mn$ for $m \in \{1,-1\}$, as discussed in Exercise 8.9c. See Exercise 8.5 for an example of an embedding that is not an automorphism; we could effectively extend that example to $ϕ(n) = mn$ for $m \in ℤ$.
