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

# Exercise 2.61

```{code-cell} ipython3
import pandas as pd

def prove_v_category(df, mon_prod, preorder_rel):
    for row in df.index:
        for col in df.columns:
            for idx in range(0,len(df.index)):
                a = mon_prod(df.iloc[row, idx], df.iloc[idx, col])
                assert preorder_rel(a, df.iloc[row,col]), (row,idx,col)
```

![x](raster/2023-10-27T17-13-33.png)

+++

Consider the following graph:

+++

![x](./ssc-exercise-2-61.svg)

+++

Where we interpret:
- Dashed lines to mean "Maybe"
- Solid lines to mean "Yes"
- Missing lines to mean "No"

+++

This graph corresponds to the following matrix:

+++

![x](./ssc-exercise-2-61-cont.svg)

+++

One way to interpret this is as a preorder that allows for uncertainty in whether two items are
related. While we are confident that C ≤ B, and that A ≰ B, we are making no claims about whether $C ≤_? A$
and $B ≤_? A$.

For a similar interpretation, see the example based on the totally ordered set {0,½,1} in [Heyting algebra § Examples](https://en.wikipedia.org/wiki/Heyting_algebra#Examples). In a Heyting algebra we some have true and false claims, but we leave room for saying we "don't know" whether some things are implied by another. In this case, we leave room for only one intermediate level of uncertainty (`maybe`).

When you are trying to communicate your uncertainty on a subject to someone else, this suggests a way to do so. Write down all the propositions you are considering as objects, perhaps with a coding table mapping e.g. the variable $A$ to some proposition. Then draw arrows in shades of gray, where a black arrow indicates you know something to be so and a missing arrow indicates you believe that the source of the arrow never implies the target of the arrow. You may discover that you only disagree on the shades of gray of the arrows.

+++

The first property requires that the diagonal be "Yes" (as we see above):

$$
I = yes \leq n(x,x)
$$

Checking the second property by brute force:

```{code-cell} ipython3
diag_val = 1.0
mdf = pd.DataFrame(
    index=range(3), columns=range(3),
    data=[[diag_val, 0.0, 0.0], [0.5, diag_val, 0.0],[0.5, 1.0, diag_val]])
display(mdf)
prove_v_category(mdf, min, lambda x,y: x <= y)
```

To get a little more intuitive feel, consider the second required property of an $\mathcal{M}$-category:

$$
min(x≤y,y≤z) ≤ (x≤z)
$$

For paths that are only two edges long, you can interpret this as instructions to take the minimum of the two paths. For longer paths, you can see this as considering all possible intermediates *y* between *x* and *z*
where *y* must be precomputed. For this to be true for all intermediates (all *y*) we must take the maximum of all the paths/options.

+++

As discussed in Exercise 2.34, we could also have constructed the **NMY** monoidal preorder from `max`:

$$
max(x≤y,y≤z) ≤ (x≤z)
$$

A similar table for **NMY** built from `max` is much less interesting because any non-zero relationship anywhere forces non-zero relationships everywhere:

```{code-cell} ipython3
diag_val = 1.0
mdf = pd.DataFrame(
    index=range(3), columns=range(3),
    data=[[diag_val, 1.0, 1.0], [1.0, diag_val, 1.0],[1.0, 1.0, diag_val]])
display(mdf)
prove_v_category(mdf, max, lambda x,y: x <= y)
```
