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

# 2.3. Enrichment

$$
\newcommand{\cat}[1]{\mathcal{#1}} % a generic category
\newcommand{\Cat}[1]{\mathbf{#1}} % a named category
\newcommand{\BB}{\mathbb{B}}
\newcommand{\Bool}{\Cat{Bool}}
$$

## 2.3.1. $\mathcal{V}$-categories

A $\cat{V}$-category is a generalization of a category, see [Enriched
category](https://en.wikipedia.org/wiki/Enriched_category).

## 2.3.2. Preorders as Bool-categories

+++

*Exercise* 2.50.

To answer `1.`, the objects of $\cat{X}$ are simply the elements of the preorder, i.e. $Ob(\cat{X})
= P$. For every pair of objects $(x, y)$ we need an element of $\BB = \{false, true\}$. As before,
simply take $true$ if $x \leq y$ and $false$ otherwise to define the hom-object $\cat{X}(x, y)$.

To go backwards as in Theorem 2.49, let $P := Ob(\cat{X})$. For the $\leq$ relation, let's declare $x
\leq y$ iff $\cat{X}(x, y) = true$. We've clearly gotten back to where we started.

To answer `2.`, let $X := Ob(\cat{X})$. For the $\leq$ relation, let's declare $x \leq y$ iff
$\cat{X}(x, y) = true$.

To go back to a $\Bool$-category, the objects of $\cat{X}$ are simply the elements of the preorder,
i.e. $Ob(\cat{X}) = X$. For every pair of objects $(x, y)$ we need an element of $\BB = \{false,
true\}$. As before, simply take $true$ if $x \leq y$ and $false$ otherwise to define the hom-object
$\cat{X}(x, y)$. We've clearly gotten back to where we started.

## 2.3.3. Lawvere metric spaces

See also [Pseudoquasimetrics](https://en.wikipedia.org/wiki/Metric_space#Pseudoquasimetrics).

+++

*Exercise* 2.52.

The distance $d(\mathrm{US}, \mathrm{Spain})$? is greater because the US is much larger, and so the
worst case scenario (the far side of the country) is has a greater distance to cover in the starting
country.

See also [Hausdorff distance](https://en.wikipedia.org/wiki/Hausdorff_distance).

+++

*Exercise* 2.55.

The set of objects doesn't include $\infty$, and the hom-object also can't map $\infty$ to the
distance between any two objects/elements. The distances in a space of this type could not be
infinite.

+++

*Exercise* 2.58.

![x](./ssc-exercise-2-58.svg)

+++

*Exercise* 2.60.

![x](./ssc-exercise-2-60.svg)

+++

## 2.3.4. $\mathcal{V}$-variations on preorders and metric spaces

```{code-cell}
import pandas as pd

def prove_v_category(df, mon_prod, preorder_rel):
    for row in df.index:
        for col in df.columns:
            for idx in range(0,len(df.index)):
                a = mon_prod(df.iloc[row, idx], df.iloc[idx, col])
                assert preorder_rel(a, df.iloc[row,col])
```

*Exercise* 2.61.

![x](./ssc-exercise-2-61.svg)

```{code-cell}
mdf = pd.DataFrame(
    index=range(3), columns=range(3),
    data=[[2,0,0],[1,2,0],[1,2,2]])
display(mdf)
prove_v_category(mdf, min, lambda x,y: x <= y)
```

*Exercise* 2.62.

![x](./ssc-exercise-2-62.svg)

```{code-cell}
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

*Exercise* 2.63.

```{code-cell}
inf = float("inf")
wdf = pd.DataFrame(
    index=range(3), columns=range(3),
    data=[[inf,8,7],[0,inf,0],[0,inf,inf]]
)
display(wdf)
prove_v_category(sdf, min, lambda x,y: x <= y)
```
