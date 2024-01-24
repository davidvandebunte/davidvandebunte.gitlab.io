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

# Exercise 2.62

```{code-cell} ipython3
import pandas as pd

def prove_v_category(df, mon_prod, preorder_rel):
    for row in df.index:
        for col in df.columns:
            for idx in range(0,len(df.index)):
                a = mon_prod(df.iloc[row, idx], df.iloc[idx, col])
                assert preorder_rel(a, df.iloc[row,col]), (row,idx,col)
```

![x](raster/2023-10-27T17-21-22.png)

+++

![x](./ssc-exercise-2-62.svg)

The first property requires that the diagonal be {car, boat, foot}:

$$
I = M = \{car, boat, foot\} \subseteq n(x,x)
$$

We can check the matrix is an $\mathcal{M}$-category by brute force:

```{code-cell} ipython3
cbf = set([0,1,2])
bf = set([1,2])
f = set([2])
e = set()
sdf = pd.DataFrame(
    index=range(4), columns=range(4),
    data=[[cbf,cbf,f,f],[e,cbf,e,e],[e,e,cbf,e],[e,f,bf,cbf]]
)
display(sdf)
prove_v_category(sdf, set.intersection, lambda x,y: x <= y)
```

To get a little more intuitive feel, consider the second required property of an
$\mathcal{M}$-category:

$$
n(x,y) ∩ n(y,z) \subseteq n(x,z)
$$

For paths that are only two edges long, you can interpret this as the instructions to:

> take the intersection of the sets labelling the edges in *p*.

For longer paths, you can see this as considering all possible intermediates *y* between *x* and *z*
where *y* must be precomputed. For this to be true for all intermediates (all *y*) we must:

> take the union of these sets over all paths *p* from *x* to *y*.

Larger sets indicate two nodes are "more connected" but in a boolean sense for every element in the
set. You could also use a graph like this to communicate multiple ways to solve a problem.
