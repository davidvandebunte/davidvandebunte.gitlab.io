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

# Exercise 7.59

+++

For `1.`, you can see $U = [-∞,0) ∪ (0,∞]$. Then the complement $U^C = [∞,0] ∪ [0,∞]$ is clearly $[0]$ or $\{0\}$ (a point). As expected, the complement of an open set is a closed set.

The [Interior (topology)](https://en.wikipedia.org/wiki/Interior_(topology)) of [0] is not "(0)" because an open set (an "open line") on the real line is defined to include all points within ε of 0, where ε is non-zero (see also [Ball (mathematics)](https://en.wikipedia.org/wiki/Ball_(mathematics))). It may be best not to even think of "(0)" or "(0,0)" as an open set; these use interval notation but without two or without two different numbers to define the interval. This contrasts with the acceptable notation [0] or [0,0], but so be it. So the largest open set contained in [0] is ∅.

If we were considering the discrete topology on ℝ (rather than the standard topology), then we would consider the point {0} both open and closed.

For `2.` the complement of ∅ is the full set. The interior of the full set is the full set.

The primary lesson here is that the pseudocomplement of the pseudocomplement of $U$ is not always equal to $U$.

We've also selected a $U$ that is not a [Regular open set](https://en.wikipedia.org/wiki/Regular_open_set). That is, it is not equal to the interior of its closure.

For `3.`, yes. For `4.`, no. From [Heyting algebra](https://en.wikipedia.org/wiki/Heyting_algebra):

> Although the negation operation ¬*a* is not part of the definition, it is definable as *a* → 0. The intuitive content of ¬*a* is the proposition that to assume *a* would lead to a contradiction. The definition implies that *a* ∧ ¬*a* = 0. It can further be shown that *a* ≤ ¬¬*a*, although the converse, ¬¬*a* ≤ *a*, is not true in general, that is, [double negation elimination](https://en.wikipedia.org/wiki/Double_negation_elimination "Double negation elimination") does not hold in general in a Heyting algebra.
