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

# Exercise 7.53

+++

![x](raster/2023-10-25T18-29-50.png)

+++

For part `1.` we need to check that Ω is functorial i.e. that it preserves identities and composition. It preserves identities because the identity on every open set $U$ in 𝓒 (the trivial inclusion ⊆) is mapped to the identity on $Ω(U)$ in **Set**. This latter identity is $Ω(U) → Ω(U)$ or $U' ↦ U' ∩ U$ or $U' ↦ U'$ (every subset of the open set gets mapped to itself).

To preserve composition we must have that if $f⨟g = h$ then $Ω(f)⨟Ω(g) = Ω(h)$. Using syntax from [Sheaf (mathematics)](https://en.wikipedia.org/wiki/Sheaf_(mathematics)), and including a reversal because presheafs are contravariant, if W ⊆ V ⊆ U then $res_{V,U}⨟res_{W,V} = res_{W,U}$. The first two restriction maps are:

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
