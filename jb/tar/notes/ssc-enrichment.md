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
category](https://en.wikipedia.org/wiki/Enriched_category). You can also see enrichment in this
context as simply labeling the edges of a graph; the *hom-object* is a record of the labels.
However, this labelling has to be done in a way that respects e.g. the triangle equality.

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

One way to interpret this is as a preorder that allows for uncertainty in whether two items are
related. While we are confident that C ≤ B, and that A ≰ B, we are making no claims about whether A
"covers" B or C.

The first property requires that the diagonal be Y:

$$
I = yes \leq n(x,x)
$$

Checking the second property by brute force:

```{code-cell}
mdf = pd.DataFrame(
    index=range(3), columns=range(3),
    data=[[2,0,0],[1,2,0],[1,2,2]])
display(mdf)
prove_v_category(mdf, min, lambda x,y: x <= y)
```

+++

*Exercise* 2.62.

![x](./ssc-exercise-2-62.svg)

The first property requires that the diagonal be {car, boat, foot}:

$$
I = M = \{car, boat, foot\} \subseteq n(x,x)
$$

We can check the matrix is an $\mathcal{M}$-category by brute force:

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
set. You could use a graph like this to communicate there are multiple ways to solve a problem as
well.

+++

*Exercise* 2.63.

![x](./ssc-exercise-2-63.svg)

The first property requires that the diagonal be ∞:

$$
I = ∞ \leq n(x,x)
$$

Checking the second property by brute force:

```{code-cell}
inf = float("inf")
wdf = pd.DataFrame(
    index=range(3), columns=range(3),
    data=[[inf,8,7],[0,inf,0],[0,inf,inf]]
)
display(wdf)
prove_v_category(sdf, min, lambda x,y: x <= y)
```

The required second property (with min replaced by ∧):

$$
n(x,y) ∧ n(y,z) \leq n(x,z)
$$

For paths that are only two edges long, you can interpret this as the instructions to take the:

> *minimum* edge label in *p*.

For longer paths, you can see this as considering all possible intermediates *y* between *x* and *z*
where *y* must be precomputed. For this to be true for all intermediates (all *y*) we must take the:

> *maximum* over all paths *p*

You could see enrichment in $\mathcal{W}$ as the opposite of enrichment in **Cost**. In this
scenario, higher numbers mean two elements are actually *more* rather than less connected. The
**NMY** and **Bool** enrichments could be seen as special cases of this kind of enrichment, with
only three and two levels of connectedness respectively (in contrast to an infinite number of
levels).

If you saw the graph as editable (as in a neural network) or at least "editable" in the sense you
can turn off connections by setting them to zero, then you could see these levels of connectedness
as network weights. In some design contexts (e.g. Transformer models) the opposite concept
(distance) is used, and the network structure is optimized to minimize distance between key nodes.
One could use the number of edges as a distance as well (assign each a value of one) if network
weights haven't been assigned yet.
