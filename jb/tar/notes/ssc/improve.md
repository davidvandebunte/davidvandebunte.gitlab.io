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

# Improve SSiC

+++

## Optimization problems

+++

See [How are universal properties “solutions to optimization problems”?](https://math.stackexchange.com/questions/3239188/how-are-universal-properties-solutions-to-optimization-problems). Example 3.99 (introducing the pullback) seems like a good example of this; we have to construct some object based on constraints the object must satisfy (it literally uses the word "constraint"). See "equality constraints" in [Optimization problem](https://en.wikipedia.org/wiki/Optimization_problem). It would be helpful to add certain "hard" equality constraints to the "soft" objective function minimization/maximization that is often done in an optimization.

See also [Equaliser (mathematics)](https://en.wikipedia.org/wiki/Equaliser_(mathematics)), and the database constraints in Chp. 3.

+++

## 6.2.1 Initial objects

+++

### Exercise 6.7

+++

#### Part `2.`

+++

![x](raster/2023-07-30T19-22-48.png)

+++

For part `2.` can we use a one-element set? See [Field with one element](https://en.wikipedia.org/wiki/Field_with_one_element); at least for a field this isn't a well-defined concept. However, why can't the multiplicative identity equal the [Additive identity](https://en.wikipedia.org/wiki/Additive_identity)? See [Additive identity § Properties](https://en.wikipedia.org/wiki/Additive_identity#Properties); there's no hard reason this isn't possible for a ring. In fact, this is known as the [Zero ring](https://en.wikipedia.org/wiki/Zero_ring).

However, the zero ring cannot serve as an initial object in **Rig** because we can still preserve structure and map the one element in this structure to either the additive or multiplicative identity in many other rigs (such as e.g. the natural numbers). That makes two morphisms (homomorphisms) from the zero ring to the natural numbers, when an initial object must only have one.

Having both a multiplicative and additive element implies (via the distributive property) that some other element 1+1 must exist, and via mathematical induction this implies we must have at least the natural numbers in an initial object. Are the natural numbers an initial object in **Rig**? There is exactly one morphism from them to the zero ring (all elements go to zero).

Without reading it, this solution looks long. For likely solutions to this question (check before checking the back of the book), see:
- [Rig in nLab](https://ncatlab.org/nlab/show/Rig)
- [rig in nLab](https://ncatlab.org/nlab/show/rig)

+++

#### Interpretations of zero

+++

The symbol 0 gets used in higher mathematics for much more than the number zero; see [Zero element](https://en.wikipedia.org/wiki/Zero_element). In part (d) of Definition 5.36 (a dependency of Exercise 6.7) it's specifically identified as an absorbing element, besides being the additive identity. Since we're in a section on initial objects, and have already learned about terminal objects, it may be worth looking at the concept of a [Zero object (algebra)](https://en.wikipedia.org/wiki/Zero_object_(algebra)) (which is both initial and terminal).

All over the article [Zero object (algebra)](https://en.wikipedia.org/wiki/Zero_object_(algebra)#Vector_space), the word "trivial" is used almost as a synonym for zero object. At the start:

> This article is about trivial or zero algebraic structures.

The article [Initial and terminal objects](https://en.wikipedia.org/wiki/Initial_and_terminal_objects) redefines "zero object" but links to [Zero object (algebra)](https://en.wikipedia.org/wiki/Zero_object_(algebra)#Vector_space) and specifically mentions:

> This is the origin of the term "zero object".

In [Initial and terminal objects](https://en.wikipedia.org/wiki/Initial_and_terminal_objects), the symbol 0 is often used for initial objects (though the author uses ∅). It's likely this is because 0 serves as the additive identity and so seems natural alongside the symbol + often used for the coproduct. The symbol 1 is similarly often used for terminal objects because it is the identity with respect to the categorical product. The article also mentions:

> Cat, the category of small categories with functors as morphisms has the empty category, 0 (with no objects and no morphisms), as initial object and the terminal category, 1 (with a single object with a single identity morphism), as terminal object.

While it often works to use 0 for an initial object and 1 for a terminal object, this also not a specific approach. It can also be confusing when a category has a "zero" object that is not initial (as in **Ring**/**Rig**, where the zero ring/rig is terminal).

+++ {"tags": []}

# 6.4 Decorated cospans

+++

This section is unique to one of the authors. See [[1502.00872] Decorated Cospans](https://arxiv.org/abs/1502.00872) and [1609.05382.pdf](https://arxiv.org/pdf/1609.05382.pdf).

+++ {"tags": []}

See [Review "Seven-Sketches suggestions" - Google Docs](https://docs.google.com/document/d/1HC_BRM2deHxS7FiIto2bfrM81grKu8vDiI-JgCY5eXU/edit) (several issues in this section).

+++

![x](raster/2023-08-05T00-12-16.png)

+++ {"tags": []}

## 6.4.1 Symmetric monoidal functors

+++

See [Monoidal functor](https://en.wikipedia.org/wiki/Monoidal_functor) and [monoidal functor](https://ncatlab.org/nlab/show/monoidal+functor).

+++

![x](raster/2023-08-29T18-44-15.png)

+++

### Example 6.69

+++

![x](raster/2023-08-29T18-44-31.png)

+++

### Symmetric monoidal power set functor

+++

For the image map $im_f$, imagine what the function would do to the function $f$ given by the relation $\{(1,α),(2,β),(3,β)\}$. We have:

$$
S = \{1,2,3\} \\
T = \{α,β\}
$$

+++

So that:

$$
\begin{align}
P(S) & = \{\{\},\{1\},\{2\},\{3\},\{1,2\},\{2,3\},\{1,3\},\{1,2,3\}\} \\
P(T) & = \{\{\},\{α\},\{β\},\{α,β\}\} \\
\end{align}
$$

+++

What the definition says is that each subset is mapped to its [Image (mathematics)](https://en.wikipedia.org/wiki/Image_(mathematics)); we call this an "image map" in Example 6.69. The new function, again represented as a relation, is:

$$
\begin{align}
im_f = \big\{(\{\}&,\{\}), \\
(\{1\}&,\{α\}), \\
(\{2\}&,\{β\}), \\
(\{3\}&,\{β\}), \\
(\{1,2\}&,\{α,β\}), \\
(\{2,3\}&,\{β\}), \\
(\{1,3\}&,\{α,β\}), \\
(\{1,2,3\}&,\{α,β\})\big\} \\
\end{align}
$$

+++

In [Image (mathematics) § Notation](https://en.wikipedia.org/wiki/Image_(mathematics)#Notation), the article authors suggest $f^→$ and $f^*$ as alternatives to $im_f$. Many readers will be even more familiar with the $f(A)$ and $f[A]$ notations, although these are more ambiguous (relying on only capitalization to indicate a subset of some set rather than an element of the set).

+++

See also [category theory - Covariant Power set functor - MSE](https://math.stackexchange.com/questions/1487902/covariant-power-set-functor) for a less helpful example because the source and target sets are the same size. The "Power sets functor" example in [Functor § Examples](https://en.wikipedia.org/wiki/Functor#Examples) is fine, although for someone new to the concept it is a bit confusing that the function $f$ is a map from $X$ to the power set of $X$. That is, in that example we have (adding $S$ and $T$ from the definition in this text):

$$
\begin{align}
S = X & = \{0,1\} \\
T = Y & = \{\{\},\{0\},\{1\},X=\{0,1\}\} \\
\end{align}
$$

+++

### Exercise 6.70

+++

![x](raster/2023-08-29T18-49-25.png)

+++

Remember that $|P(S)| = 2^{|S|}$. So we know that $|P(S)×P(T)| = 2^{|S|+|T|}$ and $|P(S×T)| = 2^{|S||T|}$; except when $|S|=1$ or $|T|=1$ the latter term will be equal to or much larger than the former. In the example above, we had $|S|=3$ and $|T|=2$. To imagine the 32 elements of $P(S)×P(T)$, consider how much space it would take to write out the cartesian product of the 8 elements of $P(S)$ and 4 elements of $P(T)$ both explicitly written out above. To imagine the 64 elements of $P(S×T)$, try taking the power set of (using e.g. [Pascal's triangle](https://en.wikipedia.org/wiki/Pascal%27s_triangle) to get up to 64, or bit flipping six bits):

$$
S×T = \{(1,α),(2,α),(3,α),(1,β),(2,β),(3,β)\}
$$

+++

Inspect the diagram in Exercise 6.70. In terms of Rough Definition 6.68, in Example 6.69 and along the arrows on the top/bottom of the diagram we are substituting $c_1 = S$ and $c_2 = T$. Per Exercise 6.69, the power set functor acts on morphisms by sending them to the their image map, so e.g. $P(f×g) = im_{f×g}$ and $P(f)×P(g) = im_f×im_g$. What it means to be "natural" in this context then is similar to what it means to be natural in [Natural transformation](https://en.wikipedia.org/wiki/Natural_transformation), but with F defined by the structure of the left side of the equation in Rough Definition 6.68 and G defined by the structure of the right side of the equation:

$$
φ_{c_1,c_2}:F(c_1) ⊗_D F(c_2) → F(c_1 ⊗_C c_2)
$$

+++

We are being asked to show $φ_{S,T}⨟im_{f×g} = im_f×im_g⨟φ_{S',T'}$. We know from Example 4.49 that:

$$
im_f×im_g(A,B) ≔ (im_f(A),im_g(B)) :P(S)×P(T)→P(S')×P(T')
$$

These variable names follow Example 6.69, where $A∈P(S)$ and $B∈P(T)$ (A is a subset of S, and B is a subset of T).

+++

The coherence maps are defined (these are essentially equivalent, but with the dummy variables changed):

$$
\begin{align}
φ_{S,T}(A,B)     & ≔ A×B :P(S)×P(T)→P(S×T) \\
φ_{S',T'}(im_f(A),im_f(B)) & ≔ im_f(A) × im_f(B) :P(S')×P(T')→P(S'×T')
\end{align}
$$

+++

How do we define $im_{f×g}$? By analogy with how $A$ and $B$ are defined above, let's define $C$ so $C ∈ P(S×T)$. That is, $C$ is a set of sets where each individual set comprises two-tuples:

$$
\begin{align}
f×g(c) = f×g(s,t) & ≔ (f(s),f(t)) :S×T→S'×T' \\
im_{f×g}(C) & ≔ \{f×g(c) | c∈C\} :P(S×T)→P(S'×T') \\
\end{align}
$$

+++

The reason we're starting with this rather general definition is that you can't construct every element of $P(S×T)$ from $P(S)×P(T)$; the latter set is smaller (as discussed above). So you can't take a spec of $A,B$ to construct every element of $P(S×T)$. For example, the set $\{(2,α),(3,β)\}$ in the context of the example above is an element of $P(S×T)$ but not an element of $P(S)×P(T)$.

+++

We do have more structure here, however, because every $C$ will have been constructed from two sets $A,B$ as $A×B$ by $φ_{S,T}$. Therefore:

+++

$$
\begin{align}
im_{f×g}(C) & ≔ \{f×g(a,b) | (a,b)∈A×B=C\} :P(S×T)→P(S'×T') \\
 & = \{(f(a),f(b)) | (a,b)∈A×B\} \\
 & = im_f(A) × im_f(B) \\
\end{align}
$$

+++

```{admonition} Reveal 7S answer
:class: dropdown
![x](raster/2023-09-02T19-21-05.png)
```

+++ {"tags": []}

## 6.4.2 Decorated cospans

```{code-cell} ipython3
!git -C /home/vandebun/source/personal-notes diff
```
