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

# 9. Sylow theory

+++

The introduction to [Sylow theorems](https://en.wikipedia.org/wiki/Sylow_theorems) is similar to the author's introduction, even mentioning the converse of Lagrange's theorem.

+++

## 9.1 Group actions

+++

In Definition 9.1, the author takes the following approach from [Group action](https://en.wikipedia.org/wiki/Group_action):

> Therefore, one may equivalently define a group action of $G$ on $X$ as a group homomorphism from $G$ into the symmetric group $Sym(X)$ of all bijections from $X$ to itself.

+++

### Orbits and stabilizers

+++

For another perspective on Definition 9.2 and 9.3, see [Group action § Orbits and stabilizers](https://en.wikipedia.org/wiki/Group_action#Orbits_and_stabilizers). The author uses the term *stable* to mean $G$-invariant (in the language of that article).

+++

### Orbit-stabilizer theorem

+++

From the errata (⚠️):

> Page 199, first displayed equation: The first Stab(S) should be Stab(s).

+++

This equation on pg. 199 also strangely uses square brackets for the index, and reverses the order of the terms relative to nearby equations (📌). A fixed version:

+++

$$
\underbrace{|G:Stab(s)|}_\text{number of cosets}·\underbrace{|Stab(s)|}_\text{size of subgroup} = |G|
$$

+++

See [Group action § Orbit-stabilizer theorem](https://en.wikipedia.org/wiki/Group_action#Orbits_and_stabilizers) for a much shorter and arguably better proof:

+++

> Orbits and stabilizers are closely related. For a fixed $x$ in $X$, consider the map $f: G → X$ given by $g ↦ g⋅x$. By definition the image $f(G)$ of this map is the orbit $G⋅x$. The condition for two elements to have the same image is:
>
> $f(g)=f(h) \iff g{\cdot}x = h{\cdot}x \iff g^{-1}h{\cdot}x = x \iff g^{-1}h \in G_x \iff h \in gG_x.$

+++

Let's decompress this proof a bit, and think about it in terms of Figure 9.3. We can interpret the map $f$ as producing an element that a fixed element $x$ (say $⟨rf⟩$) will be moved to by its argument $g$. So for two elements $g,h$ to share the same image means that they both move $x$ to the same place (e.g. $\{r^2, f\}$ both move $⟨rf⟩$ to $⟨r²f⟩$). If they both move $x$ to the same place, from the same place, you can use one to reverse what was done to $x$ and come up with a no-op or an element $k = g^{-1}h$ that fixes $x$ in place (in this case, $k = g^{-1}h = (r^2)^{-1}f = h^{-1}g = f^{-1}r^2 = rf$). This will be an element of the stabilizer of $x$.

+++

The proof continues with some comments on the final term $h \in gG_x$:

+++

> In other words, $f(g) = f(h)$ if and only if $g$ and $h$ lie in the same [coset](https://en.wikipedia.org/wiki/Coset "Coset") for the stabilizer subgroup $G_x$. Thus, the [fiber](https://en.wikipedia.org/wiki/Fiber_(mathematics) "Fiber (mathematics)") $f^{-1}(\{y\})$ of $f$ over any $y$ in $G⋅x$ is contained in such a coset, and every such coset also occurs as a fiber. Therefore $f$ induces a bijection between the set $G / G_x$ of cosets for the stabilizer subgroup and the orbit $G⋅x$, which sends $gG_x ↦ g⋅x$.

+++

In our example, $G_x = ⟨rf⟩$, and $\{r^2, f\}$ represent the coset $r^2⟨rf⟩$. The orbit of $G·⟨rf⟩$ is $\{⟨f⟩,⟨rf⟩,⟨r²f⟩\}$, one for each coset of the stabilizer $⟨rf⟩$.

+++

From the errata (⚠️):

> Pages 198-199, proof of Theorem 9.4
>
> This proof is done by counting the number of left cosets of $Stab(s)$ in $G$, but it should instead be done by counting the number of right cosets of that same subgroup. Although of course the number of cosets is the same either way, the way currently used in the book requires treating the sequence of actions $ϕ(g)ϕ(h)$ as if the one on the right applies first. This convention is common in mathematics, but is not the convention used in the rest of the textbook! Thus to stay consistent, I should use right cosets and swap all the left and rights in the proof of the theorem.

+++

Attempting to rewrite the author's proof in terms of right cosets:

> First, let's see that the elements of any right coset $Stab(s)g$ all move $s$ to the same place, so that no coset corresponds to more than one element of $Orb(s)$. Consider two elements of $Stab(s)g$, say $h_1g$ and $h_2g$. If $ϕ$ is the interpretation homomorphism, then:
>
> $$
                   ϕ(h_1g) = ϕ(h_1)ϕ(g)   \qquad \text{and} \qquad   ϕ(h_2g) = ϕ(h_2)ϕ(g)
$$
>
> But $h_1$ and $h_2$ are in $Stab(s)$, so neither $ϕ(h_1)$ nor $ϕ(h_2)$ moves $s$. Thus we can rewrite the above equations as
>
> $$
                   ϕ(h_1g) = ϕ(g)   \qquad \text{and} \qquad   ϕ(h_2g) = ϕ(g)
$$
>
> Both $h_1g$ and $h_2g$ have the same effect on $s$, as would any other element of $Stab(s)g$.

+++

## 9.2 Approaching Sylow: Cauchy's theorem

+++

### Theorem 9.5

+++

The author uses the language "order of $S$" in Theorem 9.5 when $S$ is not a group. This theorem could be stated a little more cleanly with "cardinality" in place or "order". Similarly for Theorem 9.8 (📌).

+++

For someone else's rewording of the proof of Theorem 9.5, see the following from [Group action § Orbit-stabilizer theorem](https://en.wikipedia.org/w/index.php?title=Group_action&wvprov=sticky-header#Orbit-stabilizer_theorem):

> **Example:** Let *G* be a group of prime order *p* acting on a set *X* with *k* elements. Since each orbit has either 1 or *p* elements, there are at least *k* mod *p* orbits of length 1 which are *G*-invariant elements.

+++

For someone else's rewording of the proof of Theorem 9.8, see the following from [Sylow theorems § Proof of the Sylow theorems](https://en.wikipedia.org/wiki/Sylow_theorems#Proof_of_the_Sylow_theorems):

> Any element $x ∈ Ω$ not fixed by $H$ will lie in an orbit of order $|H|/|H_x|$ (where $H_x$ denotes the stabilizer), which is a multiple of $p$ by assumption. The result follows immediately by writing $|Ω|$ as the sum of $|H·x|$ over all distinct orbits $H·x$ and reducing mod $p$.

+++

### Cauchy's theorem

+++

Compare [Cauchy's theorem (group theory)](https://en.wikipedia.org/wiki/Cauchy%27s_theorem_(group_theory)).

+++

## 9.3 p-groups

+++

From [p-group](https://en.wikipedia.org/wiki/P-group):

> A [finite group](https://en.wikipedia.org/wiki/Finite_group "Finite group") is a *p*-group if and only if its [order](https://en.wikipedia.org/wiki/Order_of_a_group "Order of a group") (the number of its elements) is a power of *p*. Given a finite group *G*, the [Sylow theorems](https://en.wikipedia.org/wiki/Sylow_theorems "Sylow theorems") guarantee the existence of a [subgroup](https://en.wikipedia.org/wiki/Subgroup "Subgroup") of *G* of order $p^n$ for every [prime power](https://en.wikipedia.org/wiki/Prime_power "Prime power") $p^n$ that divides the order of *G*.

+++

To be clear, a group of order six is not a 2-group or a 3-group because it has elements of both orders. However, the Sylow theorems still apply to the elements it has of prime order.

+++

### Theorem 9.8

+++

Compare to the following from [Sylow theorems § Proof of the Sylow theorems](https://en.wikipedia.org/wiki/Sylow_theorems#Proof_of_the_Sylow_theorems):

> **Lemma** --- Let $H$ be a finite $p$-group, let $Ω$ be a finite set acted on by $H$, and let $Ω_0$ denote the set of points of $Ω$ that are fixed under the action of $H$. Then $|Ω| ≡ |Ω_0|\ (mod\ p)$.

+++

### Theorem 9.9

+++

Page 206, *Proof* of Theorem 9.9 (⚠️): The first sentence says $φ: G → Perm(S)$, but it is $H$ that is acting on $S$, so it should instead read $φ : H → Perm(S)$.

+++

The issue mentioned in the errata is repeated in the next sentence, so here's a rewrite of the whole paragraph:

+++

> *Proof.* Let $S$ be the left cosets of $H$ in $G$ and consider the group $H$ acting on $S$ by the interpretation homomorphism $ϕ: H → Perm(S)$ defined by
>
> $$
ϕ(h) = \text{the permutation that sends a coset $gH$ to the coset $hgH$}
$$
>
> Exercise 9.19 asks you to prove that each such $ϕ(h)$ is indeed a permutation. In such a situation, we say that $H$ acts on $S$ "by left multiplication." This action was chosen because of the strategy mentioned above; I can prove that its stable elements are just those left cosets in the normalizer, as shown in Figure 9.9.

+++

Notice the subtle difference from this definition in [Group action § Examples](https://en.wikipedia.org/wiki/Group_action#Examples_2):

> In every group $G$ with subgroup $H$, left multiplication is an action of $G$ on the set of cosets $G / H: g⋅aH = gaH$ for all $g, a$ in $G$.

+++

The Wikipedia article defines left multiplication as an action of $G$ on the left cosets of $H$, rather than an action of $H$ on them. The number of left cosets won't change, and the same group element can map to the same permutation, so both methods should be acceptable.

+++

Page 207, Figure 9.9 (📌): The image subtitle should refer to the proof of Theorem 9.9 rather than 9.8.

+++

If you want to understand this proof from the bottom up, you should understand Figure 9.10 before Figure 9.9. If you want to understand the strategy and then understand the proof, read the figures in the given order.

+++

Read this proof alongside Exercise 9.10 (which applies it to an example).

+++

## 9.4 Sylow Theorems

+++

Compare [Sylow theorems](https://en.wikipedia.org/wiki/Sylow_theorems). The author's three theorems roughly correspond to the three in [Sylow theorems § Statement](https://en.wikipedia.org/wiki/Sylow_theorems#Statement), but imperfectly. See [Sylow theorems § Consequences](https://en.wikipedia.org/wiki/Sylow_theorems#Consequences) for explanations of some of the differences.

+++

### 9.4.1 The First Sylow Theorem (1ST)

+++

We use the 1ST acronym to give you a laugh 🤣.

+++

Compare Theorem 9.10 to the corresponding theorem in [Sylow theorems § Statement](https://en.wikipedia.org/wiki/Sylow_theorems#Statement):

> **Theorem** (1) --- For every [prime factor](https://en.wikipedia.org/wiki/Prime_factor "Prime factor") $p$ with [multiplicity](https://en.wikipedia.org/wiki/Multiplicity_of_a_prime_factor "Multiplicity of a prime factor") $n$ of the order of a finite group $G$, there exists a Sylow [p-subgroup](https://en.wikipedia.org/wiki/P-group "P-group") of $G$, of order $p^n$.

+++

This statement does not include the existence of groups of order $\{1,p,\dots,p^{n-1},p^n\}$.

+++

Page 211, first paragraph (⚠️): The final sentence of the paragraph references Figure 9.6, when it should reference Figure 9.13.

+++

### 9.4.2 Classification of groups of order 8

+++

Compare [List of small groups](https://en.wikipedia.org/wiki/List_of_small_groups).

+++

### 9.4.3 The Second Sylow Theorem (2ST)

+++

Compare Theorem 9.12 to the corresponding theorem in [Sylow theorems § Statement](https://en.wikipedia.org/wiki/Sylow_theorems#Statement) (they essentially match):

> **Theorem** (2) --- Given a finite group $G$ and a prime number $p$, all Sylow $p$-subgroups of $G$ are [conjugate](https://en.wikipedia.org/wiki/Conjugacy_class "Conjugacy class") to each other. That is, if $H$ and $K$ are Sylow $p$-subgroups of $G$, then there exists an element $g ∈ G$ with $g^{-1}Hg = K$.

+++

Page 215, Proof of Theorem 9.12 (⚠️): The final paragraph could be clarified by changing the phrase "and thus it is not zero" to "and thus it is not zero mod p."

+++

Read this proof alongside Exercise 9.11 (which applies it to an example).

+++

### 9.4.4 The Third Sylow Theorem (3ST)

+++

Compare Theorem 9.13 to the corresponding theorem in [Sylow theorems § Statement](https://en.wikipedia.org/wiki/Sylow_theorems#Statement):

> **Theorem** (3) --- Let $p$ be a prime factor with multiplicity $n$ of the order of a finite group $G$, so that the order of $G$ can be written as $p^nm$, where $n > 0$ and $p$ does not divide $m$. Let $n_p$ be the number of Sylow $p$-subgroups of $G$. Then the following hold:
> - $n_p$ divides $m$, which is the [index](https://en.wikipedia.org/wiki/Index_of_a_subgroup "Index of a subgroup") of the Sylow $p$-subgroup in $G$.
> - $n_p ≡ 1\ (mod\ p)$
> - $n_p = |G : N_G(P)|$, where $P$ is any Sylow $p$-subgroup of $G$ and $N_G$ denotes the [normalizer](https://en.wikipedia.org/wiki/Normalizer "Normalizer").

+++

### 9.4.5 Classification of groups of order 15

+++

Compare [Sylow theorems § Cyclic group orders](https://en.wikipedia.org/wiki/Sylow_theorems#Cyclic_group_orders).
