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

+++ {"tags": []}

# Exercise 7.49

```{code-cell} ipython3
from IPython.display import Image, IFrame
```

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

In the style of [Constant sheaf § A detailed example](https://en.wikipedia.org/wiki/Constant_sheaf#A_detailed_example) see:

```{code-cell} ipython3
save_url = "https://q.uiver.app/#q=WzAsMyxbMCwyLCJQKFxcezEsMlxcfSkgPSBYw5dZIl0sWzAsMSwiUChcXHsxXFx9KSA9IFgiXSxbMCwwLCJQKOKIhSkgPSBcXHsoKVxcfSJdLFsxLDIsIjAiXSxbMCwxLCLPgCJdXQ=="
IFrame(src=f"{save_url}&embed", width="300", height="300")
```

For `4.` we could likely associate a sheaf on **Op** with a function in several ways. One way to do so would be to identify it with a function of two variables, or more generally a function that's constructed from two functions.
