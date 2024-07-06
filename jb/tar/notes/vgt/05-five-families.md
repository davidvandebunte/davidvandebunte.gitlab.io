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

# 5 Five families

+++

## 5.1 Cyclic groups

+++

The author introduces the concept of a [Cycle graph (algebra)](https://en.wikipedia.org/wiki/Cycle_graph_(algebra)) in this section; distinguish from [Cycle graph](https://en.wikipedia.org/wiki/Cycle_graph).

+++

## 5.4 Symmetric and alternating groups

+++

Compare [Alternating group](https://en.wikipedia.org/wiki/Alternating_group).

+++

### 5.4.4 Cayley's theorem

+++

Compare [Cayley's theorem](https://en.wikipedia.org/wiki/Cayley%27s_theorem), which provides a little cleaner proof. That article defines $f_g(x) = gx$ i.e. using left-multiplication rather than the author's right multiplication $p_k(x) = xk$; the author's choice of composition symbol is unfortunate but choosing the opposite convention is not a problem (see more below). What's strange about the author's proof is its focus on how permutations act on the identity, and that it simply uses:

> Because $p_i · p_j = p_k$

Without really establishing that this will hold. That is, the author essentially assumes the permutations will form a permutation group by assuming they will form a multiplication table. Replacing $1$ with $x$ in the proof would make it clearer that we still have a group.

See also [Yoneda lemma](https://en.wikipedia.org/wiki/Yoneda_lemma).

+++

#### Composition

+++

The author's footnote regarding composition is a bit unfortunate. It's fine and good to choose this particular convention of right-multiplication for composition: it's also the choice of GAP, [Permutations - SymPy](https://docs.sympy.org/latest/modules/combinatorics/permutations.html) and [Permutations · AbstractAlgebra.jl](https://docs.juliahub.com/AbstractAlgebra/b8V2b/0.41.3/perm/). What's unfortunate about this choice is that (unlike the mentioned libraries) the author chooses to use the symbol ∘ ("ring operator" in Unicode) for composition.

Per [Function composition § Alternative notations](https://en.wikipedia.org/wiki/Function_composition#Alternative_notations), the more common notational preference is $f∘g$ for "g then f" although it gives mention to the author's convention. We'll prefer $f⨟g$ for "f then g" when it doesn't conflict with the author.

+++

Although the author's right-multiplication is preferred going forward, notice [Permutation § Composition of permutations](https://en.wikipedia.org/wiki/Permutation#Composition_of_permutations) also uses the opposite convention. It unfortunately also often takes the same liberty as our author of not using a symbol between the elements (concatenation) to disambiguate.
