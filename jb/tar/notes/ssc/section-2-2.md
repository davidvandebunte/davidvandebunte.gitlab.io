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

# 2.2. Symmetric monoidal preorders

## 2.2.1. Definition and first examples

$$
\newcommand{\Cat}[1]{\mathbf{#1}}
$$

*Definition* 2.2.

See [Monoidal category - Monoidal preorders](https://en.wikipedia.org/wiki/Monoidal_category#Monoidal_preorders) and [Symmetric monoidal category](https://en.wikipedia.org/wiki/Symmetric_monoidal_category) for an alternative definition. We use the term "monoidal product" for the ⊗ operator because in general the "most important" example of a monoid in this context is going to be the real numbers with multiplication as the ⊗ operator. The usual formula for matrix multiplication (and by extension, for dot products) is based on this monoid; see Section 2.5.3.

+++

*Exercise* 2.5.

This won't work, because the monoidal product doesn't satisfy requirement `(a)`. Consider the
example:

$$
\begin{align} \\
x_1 & = -2 \\
x_2 & = -2 \\
y_1 & = 1 \\
y_2 & = 1 \\
x_1 \leq y_1 & = true \\
x_2 \leq y_2 & = true \\
x_1 \otimes x_2 & = 4 \not\leq 1 = y_1 \otimes y_2 \\
\end{align}
$$

+++

*Exercise* 2.8.

See also [Monoid](https://en.wikipedia.org/wiki/Monoid).

The element $e$ in the monoid $(M, \ast, e)$ serves as $I$ in the discrete preorder $(\Cat{Disc}_M, =,
\ast, e)_{}$. The monoid multiplication $\ast$ serves as the monoidal product $\otimes$ and
satisfies properties `(b)`, `(c)`, and `(d)` by definition of being a monoid. By virtue of being a
discrete preorder, it satisfies `(a)` because $x_1$ will always equal $y_1$ and therefore with "="
as the order operator this condition comes down to $x_1 \otimes x_2 = x_1 \otimes x_2$.

+++

## 2.2.2. Introducing wiring diagrams

For more background, see [String diagram](https://en.wikipedia.org/wiki/String_diagram).

*Exercise* 2.20.

Using reflexivity, we have that $u \leq u$. Add this to the first of the equations in (2.16), using
`(a)` in the definition of a symmetrical monoidal preorder:

$$
\begin{align} \\
t & \leq v + w \\
u & \leq u \\
t + u & \leq u + v + w \\
\end{align}
$$

Similarly for the second equation:

$$
\begin{align} \\
w + u & \leq x + z \\
v & \leq v \\
v + w + u & \leq v + x + z \\
\end{align}
$$

And the third equation:

$$
\begin{align} \\
v + x & \leq y \\
z & \leq z \\
v + x + z & \leq y + z \\
\end{align}
$$

Using transitivity, we can combine all three of these equations to get Equation (2.18) in the text.

To answer `3.`, the symmetry axiom does not need to be invoked because wires do not cross.

+++ {"jp-MarkdownHeadingCollapsed": true, "tags": []}

## 2.2.3. Applied examples

*Exercise* 2.21.

The condition `(a)` holds by the conservation of matter. The condition `(b)` holds because adding
nothing to a reactant leaves you with the reactant as the product. The condition `(d)` holds because
it shouldn't matter what order reactants are added together in a reaction.

It's not clear that `(c)` would hold in all circumstances; adding two reactants may produce a
product that no longer reacts with another reactant that the original reactants may have reacted
with.

+++

## 2.2.4. Abstract examples

*Exercise* 2.29.

The monoidal unit must be $false$ (satisfying the unitality condition `(a)`).

It's not clear that the author is presenting these tables to show they are symmetric (as in
"symmetric" monoidal preorder), but they show that symmetric condition `(d)` is satisfied.

The associative condition `(c)` is satisfied because booleans over $\vee$ are associative.

The monotonicity requirement `(a)` is satisfied because the booleans over $\vee$ are also already
monotone, and this is apparent in the tables as well. See also [Boolean algebra - Monotone laws](
https://en.wikipedia.org/wiki/Boolean_algebra#Monotone_laws) and [Monotonic function -
In Boolean functions](https://en.wikipedia.org/wiki/Monotonic_function#In_Boolean_functions).

+++

*Exercise* 2.31.

Notice this question only asks for a monoidal structure, not a symmetric monoidal preorder
structure. Since it seems to have both, we'll show both here.

The monoidal unit should be 1 (satisfies unitality). The natural numbers under addition satisfy the
associativity condition, so this symmetric monoidal preorder will as well. See [Natural number -
Algebraic properties satisfied by the natural numbers](
https://en.wikipedia.org/wiki/Natural_number#Algebraic_properties_satisfied_by_the_natural_numbers).
The natural numbers also satisfy the commutativity condition (symmetry condition in the text).

[nds]: https://en.wikipedia.org/wiki/Propositional_calculus#Example_2._Natural_deduction_system

[prcp]: https://en.wikipedia.org/wiki/Propositional_calculus#Proofs_in_propositional_calculus

The following is based (roughly) on [Propositional calculus - Natural deduction system][nds] and
[Propositional calculus - Proofs in propositional calculus][prcp]. To see the monotonicity condition
is satisfied we'll use the normal rules of algebra on the natural (positive) numbers, with these two
premises:

$$
\begin{align} \\
x_1 & \leq y_1 \\
x_2 & \leq y_2 \\
\end{align}
$$

We have, multiplying both sides of the first premise by $y_2$:

$$
\begin{equation} \\
x_1 \ast y_2 \leq y_1 \ast y_2 \\
\label{eq:31a} \tag{a}
\end{equation}
$$

Multiplying both sides of the second premise by $x_1$:

$$
\begin{equation} \\
x_1 \ast x_2 \leq x_1 \ast y_2 \\
\label{eq:31b} \tag{b}
\end{equation}
$$

And combining $\eqref{eq:31a}$ and $\eqref{eq:31b}$ with transitivity:

$$
x_1 \ast x_2 \leq x_1 \ast y_2 \leq y_1 \ast y_2
$$

+++

*Exercise* 2.33.

No, because $0 | n = \infty \neq 0$.

+++

*Exercise* 2.34.

In the following table we use 0 for no, 1 for maybe, and 2 for yes:

```{code-cell} ipython3
import pandas as pd

preorder = [0, 1, 2]
min = pd.DataFrame(index=preorder, columns=preorder, data=[[0,0,0], [0,1,1], [0,1,2]])
display(min)
```

[ape]: https://en.wikipedia.org/wiki/Associative_property#Examples

The "min" function is associative; see [Associative property - Examples][ape]. The "yes" element can
be used as a monoidal unit. It's easy to see the symmetry/commutativity property is satisfied in the
truth table.

To see the monotonicity condition is satisfied we'll use as an inference rule that a
partially-applied "min" function is order-preserving. That is, if we have that $a_1 \leq a_2$, it
follows that $min(a_1, b) \leq min(a_2, b)$. Then, starting from these two premises:

$$
\begin{align} \\
x_1 & \leq y_1 \\
x_2 & \leq y_2 \\
\end{align}
$$

Applying $min(\_, y_2)$ to the first premise:

$$
\begin{equation} \\
min(x_1, y_2) \leq min(y_1, y_2) \\
\label{eq:34a} \tag{a}
\end{equation}
$$

Applying $min(x_1, \_)$ to the second premise:

$$
\begin{equation} \\
min(x_1, x_2) \leq min(x_1, y_2) \\
\label{eq:34b} \tag{b}
\end{equation}
$$

And combining $\eqref{eq:34a}$ and $\eqref{eq:34b}$ with transitivity:

$$
min(x_1, x_2) \leq min(x_1, y_2) \leq min(y_1, y_2)
$$

+++

*Exercise* 2.35.

[ist]: https://en.wikipedia.org/wiki/Intersection_(set_theory)

It should satisfy the identity/unitality condition because $S \cap X$ for any $X$ that is a subset
of $S$ should be $X$. See also [Intersection (set theory)][ist]; the intersection operation is
associative, and commutative.

To see the monotonicity condition is satisfied we'll use as an inference rule that a
partially-applied $\cap$ is order-preserving. That is, if we have that $a_1 \leq a_2$ (that is, $a_1
\subset a_2$), it follows that $a_1 \cap b \leq a_2 \cap b$. Then, starting from these two premises:

$$
\begin{align} \\
x_1 & \leq y_1 \\
x_2 & \leq y_2 \\
\end{align}
$$

Applying $\_ \cap y_2$ to the first premise:

$$
\begin{equation} \\
x_1 \cap y_2 \leq y_1 \cap y_2 \\
\label{eq:35a} \tag{a}
\end{equation}
$$

Applying $x_1 \cap \_$ to the second premise:

$$
\begin{equation} \\
x_1 \cap x_2 \leq x_1 \cap y_2 \\
\label{eq:35b} \tag{b}
\end{equation}
$$

And combining $\eqref{eq:35a}$ and $\eqref{eq:35b}$ with transitivity:

$$
x_1 \cap x_2 \leq x_1 \cap y_2 \leq y_1 \cap y_2
$$

+++

*Exercise* 2.36.

$\def\NN{{\bf N}}\def\bold#1{{\bf #1}}$A list of example statements (including those that were
already made) that may be made in this language:

- $R$ = "n is prime"
- $R$ = "n is even"
- $S$ = $0 \leq n$
- $T$ = $n = 15$

Clearly $S \leq P$ for all $P$ in $n \in \NN$, but $T$ is only true for a single $P$. If we use
"and" as our monoidal product, we must pick something that is always true (like $S$) as our monoidal
unit. If we had chosen "or" then we'd have to come up with a statement that is always false.

An "and" operation is clearly already associative and commutative. It's also order-preserving, which
we can use in the following proof (in a style suggested by Example 1.123):

![x](./ssc-exercise-2-36.svg)

+++

*Exercise* 2.39.

The $I$ remains the identity because in the original symmetric monoidal preorder we had $I \otimes x
= x$ and $x \otimes I = x$ and nothing about $\otimes$ has changed. Similarly, if $\otimes$ was
associative and commutative it should remain so.

+++

*Exercise* 2.40.

As a preorder $\bold{Cost}^{op}$ is $([0, ∞], \leq)$. In this preorder smaller numbers are "better"
(greater) as in golf.

The monoidal unit remains 0, and the monoidal product remains +.

+++

## 2.2.5. Monoidal monotone maps

+++

*Exercise* 2.43.

To show this is indeed a monotone map, we must show $x ≤_B y$ implies $f(x) ≥_{Cost} f(y)$ for all
$x,y \in B$. There are only four cases to check:

$$
\begin{align} \\
false \leq false & \to \infty \geq \infty \\
false \leq true & \to \infty \geq 0 \\
true \leq false & \to 0 \geq \infty \\
true \leq true & \to 0 \geq 0 \\
\end{align}
$$

Checking condition `(a)` of Definition 2.41:

$$
0 \leq g(true) = 0
$$

Checking condition `(b)` of Definition 2.41:

$$
\begin{align} \\
\infty + \infty \leq g(false) = \infty \\
\infty + 0 \leq g(false) = \infty \\
0 + \infty \leq g(false) = \infty \\
0 + 0 \leq g(true) = 0 \\
\end{align}
$$

Yes, $g$ is a strict monoidal monotone.

% TODO-check-appendix
% TODO-answer

+++

*Exercise* 2.44.

To show $d$ is a monotone map, we must show $x ≥_{Cost} y$ implies $d(x) ≤_B d(y)$ for all $x,y \in
B$. There are only nine cases to check, if we treat all numbers between 0 and $\infty$ as one of
three options for each variable:

$$
\begin{align} \\
0 \geq 0 & \to T \leq T \\
0 \geq 7 & \to T \leq F \\
0 \geq ∞ & \to T \leq F \\
7 \geq 0 & \to F \leq T \\
7 \geq 7 & \to F \leq F \\
7 \geq ∞ & \to F \leq F \\
∞ \geq 0 & \to F \leq T \\
∞ \geq 7 & \to F \leq F \\
∞ \geq ∞ & \to F \leq F \\
\end{align}
$$

Checking condition `(a)` of Definition 2.41:

$$
T \leq d(0) = T
$$

Checking condition `(b)` of Definition 2.41:

$$
\begin{align} \\
d(0) \wedge d(0) = T & \to d(0 + 0) = T \\
d(0) \wedge d(7) = F & \to d(0 + 7) = F \\
d(0) \wedge d(∞) = F & \to d(0 + ∞) = F \\
d(7) \wedge d(0) = F & \to d(7 + 0) = F \\
d(7) \wedge d(7) = F & \to d(7 + 7) = F \\
d(7) \wedge d(∞) = F & \to d(7 + ∞) = F \\
d(∞) \wedge d(0) = F & \to d(∞ + 0) = F \\
d(∞) \wedge d(7) = F & \to d(∞ + 7) = F \\
d(∞) \wedge d(∞) = F & \to d(∞ + ∞) = F \\
\end{align}
$$

Yes, $d$ is a strict monoidal monotone.

To show $u$ is a monotone map, we must show $x ≥_{Cost} y$ implies $u(x) ≤_B u(y)$ for all $x,y \in
B$. There are only nine cases to check, if we treat all numbers between 0 and $\infty$ as one of
three options for each variable:

$$
\begin{align} \\
0 \geq 0 & \to T \leq T \\
0 \geq 7 & \to T \leq T \\
0 \geq ∞ & \to T \leq F \\
7 \geq 0 & \to T \leq T \\
7 \geq 7 & \to T \leq T \\
7 \geq ∞ & \to T \leq T \\
∞ \geq 0 & \to F \leq T \\
∞ \geq 7 & \to F \leq T \\
∞ \geq ∞ & \to F \leq F \\
\end{align}
$$

Checking condition `(a)` of Definition 2.41:

$$
T \leq u(0) = T
$$

Checking condition `(b)` of Definition 2.41:

$$
\begin{align} \\
u(0) \wedge u(0) = T & \to u(0 + 0) = T \\
u(0) \wedge u(7) = T & \to u(0 + 7) = T \\
u(0) \wedge u(∞) = F & \to u(0 + ∞) = F \\
u(7) \wedge u(0) = T & \to u(7 + 0) = T \\
u(7) \wedge u(7) = T & \to u(7 + 7) = T \\
u(7) \wedge u(∞) = F & \to u(7 + ∞) = F \\
u(∞) \wedge u(0) = F & \to u(∞ + 0) = F \\
u(∞) \wedge u(7) = F & \to u(∞ + 7) = F \\
u(∞) \wedge u(∞) = F & \to u(∞ + ∞) = F \\
\end{align}
$$

Yes, $u$ is a strict monoidal monotone.

+++

*Exercise* 2.45.

To answer `1.`, see the same question in Exercise 2.31.

To answer `2.`, we simply need to guess and check different kinds of functions for the monoidal
monotone. An answer that works is $f(p) := n^p$ where $n$ is any integer (e.g. 2).

To answer `3.`, see nearly the same question in Exercise 2.5.
