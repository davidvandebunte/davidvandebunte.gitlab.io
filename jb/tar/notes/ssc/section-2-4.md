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

# 2.4. Constructions on V-categories

$$
\newcommand{\cat}[1]{\mathcal{#1}} % a generic category
$$

## 2.4.1. Changing the base of enrichment

*Exercise* 2.67.

![x](./ssc-exercise-2-67.svg)

You could interpret this preorder as a "contains" or "includes" relationship (the US contains
Boston).

+++

*Exercise* 2.68.

For `1.`, define *g* to be the second monoidal monotone we looked at in Exercise 2.44 (called $u(x)$
in that question).

For `2.` we can use the same Lawvere metric space from Exercise 2.67. The new **Bool**-category:

![x](./ssc-exercise-2-68.svg)

+++

## 2.4.2. Enriched functors

This definition is definitely not enough to understand [Enriched functors](https://en.wikipedia.org/wiki/Enriched_category#Enriched_functors). If you have read ahead enough to understand that functors preserve identity and composition, you can see this as a statement that these are preserved. If previously there was a morphism between x₁ and x₂ (in a **Bool**-category, one is less than the other), then a functor must map this morphism to another morphism between F(x₁) and F(x₂) in a second **Bool**-category that respects composition.

The ⊗ operator serves as the associative operator connected to the enriched category (that emulates the composition of morphisms). For the enriched functor to respect the enriched structure means for it to respect the structure that the category includes beyond just identity and associativity: in this case Definition 2.2. defines in e.g. `(a)`, `(b)`, and `(d)` some additional structure that might need to be preserved.

*Exercise* 2.73.

A **Cost**-category is a Lawvere metric space. When we add the "skeletal" adjective (i.e.
property/constraint), we satisfy condition (b) in Definition 2.51. When we add the "dagger"
adjective, we satisfy condition (c) in Definition 2.51, satisfying everything we need for the
definition of an extended metric space.

For `2.`, notice the symmetry in the statements:
- A skeletal dagger preorder is a set.
- A skeletal dagger Lawvere metric space is an extended metric space.

+++

## 2.4.3. Product $\mathcal{V}$-categories

*Exercise* 2.75.

For `1.`:

$$
\begin{align}
I \otimes I = I & \leq (\cat{X}\times\cat{Y}) \big((x,y),(x,y) \big) \\
                & = \cat{X}(x,x) \otimes \cat{Y}(y,y)
\end{align}
$$

Using property (a) in Definition 2.2, we can assert this statement is true because $I \leq
\cat{X}(x,x)$ and $I \leq \cat{Y}(y,y)$.

For `2.`:

$$
\begin{align}
  & = \cat{X}(x_1,x_2) \otimes \cat{X}(x_2,x_3) \otimes
      \cat{Y}(y_1,y_2) \otimes \cat{Y}(y_2,y_3)    \text{   (using symmetry of $\mathcal{V}$)} \\
  & = \cat{X}(x_1,x_2) \otimes \cat{Y}(y_1,y_2) \otimes
      \cat{X}(x_2,x_3) \otimes \cat{Y}(y_2,y_3) \\
  & = (\cat{X}\times\cat{Y}) \big((x_1,y_1),(x_2,y_2) \big) \otimes
      (\cat{X}\times\cat{Y}) \big((x_2,y_2),(x_3,y_3) \big) \\
  & \leq (\cat{X}\times\cat{Y}) \big((x_1,y_1),(x_3,y_3) \big) \\
  & = \cat{X}(x_1,x_3) \otimes \cat{Y}(y_1,y_3)
\end{align}
$$

Using property (a) in Definition 2.2, we can assert this statement is true because:

$$
\begin{align}
\cat{X}(x_1,x_2) \otimes \cat{X}(x_2,x_3) & \leq \cat{X}(x_1,x_3) \\
\cat{Y}(y_1,y_2) \otimes \cat{Y}(y_2,y_3) & \leq \cat{Y}(y_1,y_3)
\end{align}
$$

+++

*Exercise* 2.78.

Forming the non-obvious part of the **Cost**-product:

$$
(\cat{R}\times\cat{R}) \big((r_1,r_2),(r_a,r_b)\big) = d(r_1,r_a) + d(r_2,r_b)
$$

So the answer should be $|5 - -1| + |6 - 4| = 8$.
