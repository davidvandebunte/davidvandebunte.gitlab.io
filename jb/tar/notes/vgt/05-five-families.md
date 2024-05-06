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

## 5.4 Symmetric and alternating groups

+++

## 5.4.4 Cayley's theorem

+++

The author's footnote regarding composition is a bit unfortunate. It's fine and good to choose this particular convention: it's also the choice of GAP, [Permutations - SymPy](https://docs.sympy.org/latest/modules/combinatorics/permutations.html) and [Permutations · AbstractAlgebra.jl](https://docs.juliahub.com/AbstractAlgebra/b8V2b/0.41.3/perm/). However, these libraries don't necessarily use ∘ ("ring operator" in Unicode) for composition.

Per [Function composition § Alternative notations](https://en.wikipedia.org/wiki/Function_composition#Alternative_notations), the more common notational preference is $f∘g$ for "g then f" although it gives mention to the author's convention. We'll prefer $f⨟g$ for "f then g" when it doesn't conflict with the author.
