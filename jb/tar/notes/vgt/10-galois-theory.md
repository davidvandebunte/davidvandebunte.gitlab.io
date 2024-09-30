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

# 10. Galois theory

+++

## 10.1 The big question

+++

Compare [Field (mathematics)](https://en.wikipedia.org/wiki/Field_(mathematics)) to Definition 10.1.

+++

Compare the author's definition of **polynomial equation** to [Algebraic equation](https://en.wikipedia.org/wiki/Algebraic_equation).

+++

Regarding the discovery in 1824 by Niels Abel, see [Abel–Ruffini theorem](https://en.wikipedia.org/wiki/Abel%E2%80%93Ruffini_theorem). Galois worked from 1828-1832.

+++

## 10.2 More big questions

+++

See [Number § Main classification](https://en.wikipedia.org/wiki/Number#Classification) for an even finer classification of the types of numbers.

+++

Compare Key Point 10.5 and the surrounding paragraphs to [Galois theory § Application to classical problems](https://en.wikipedia.org/wiki/Galois_theory#Application_to_classical_problems).

+++

## 10.3 Visualizing field extensions

+++

Compare the first paragraph of this section to [Field extension](https://en.wikipedia.org/wiki/Field_extension).

+++

Compare Theorem 10.3 to [Complex conjugate root theorem](https://en.wikipedia.org/wiki/Complex_conjugate_root_theorem).

+++

## 10.4 Irreducible polynomials

+++

Compare to [Irreducible polynomial](https://en.wikipedia.org/wiki/Irreducible_polynomial).

+++

Compare Theorem 10.4 to [Eisenstein's criterion](https://en.wikipedia.org/wiki/Eisenstein%27s_criterion):

> Suppose we have the following polynomial with integer [coefficients](https://en.wikipedia.org/wiki/Coefficients "Coefficients"):
>
>$$
Q(x) = a_n x^n + a_{n-1} x^{n-1} + \cdots + a_1 x + a_0
$$
>
> If there exists a [prime number](https://en.wikipedia.org/wiki/Prime_number "Prime number") p such that the following three conditions all apply:
>
> -   $p$ divides each $a_i$ for $0 ≤ i < n$,
> -   $p$ does *not* divide $a_n$, and
> -   $p^2$ does *not* divide $a_0$,
>
> then $Q$ is irreducible over the rational numbers.

+++

The definitions are essentially equivalent, except the author combines the first two bullet points into one.

+++

## 10.5 Galois groups

+++

### 10.5.1 A small field extension ℚ(√2)

+++

Compare [Degree of a field extension](https://en.wikipedia.org/wiki/Degree_of_a_field_extension).

+++

### 10.5.2 The symmetries of ℚ(√2)

+++

Compare Definition 10.6 to [Galois group § Definition](https://en.wikipedia.org/wiki/Galois_group#Definition):
> Suppose that $E$ is an extension of the [field](https://en.wikipedia.org/wiki/Field_(mathematics) "Field (mathematics)") $F$ (written as  $E/F$ and read "$E$ over $F$"). An [automorphism](https://en.wikipedia.org/wiki/Automorphism "Automorphism") of $E/F$ is defined to be an automorphism of $E$ that fixes $F$ pointwise. In other words, an automorphism of $E/F$ is an [isomorphism](https://en.wikipedia.org/wiki/Isomorphism "Isomorphism") $α: E → E$ such that $α(x) = x$ for each $x ∈ F$. The [set](https://en.wikipedia.org/wiki/Set_(mathematics) "Set (mathematics)") of all automorphisms of $E/F$ forms a group with the operation of [function composition](https://en.wikipedia.org/wiki/Function_composition "Function composition"). This group is sometimes denoted by $Aut(E/F)$.
>
> If $E/F$ is a [Galois extension](https://en.wikipedia.org/wiki/Galois_extension "Galois extension"), then $Aut(E/F)$ is called the **Galois group** of $E/F$, and is usually denoted by $Gal(E/F)$.

+++

This definition doesn't quite match the authors, which is discussed at the end of section 10.5.3.

+++

### 10.5.3 Symmetries of field extensions

+++

Compare to the following from [Automorphism § Examples](https://en.wikipedia.org/wiki/Automorphism#Examples):

> - A field automorphism is a [bijective](https://en.wikipedia.org/wiki/Bijection "Bijection") [ring homomorphism](https://en.wikipedia.org/wiki/Ring_homomorphism "Ring homomorphism") from a [field](https://en.wikipedia.org/wiki/Field_(mathematics) "Field (mathematics)") to itself.
>   - The field ℚ of the [rational numbers](https://en.wikipedia.org/wiki/Rational_number "Rational number") has no other automorphism than the identity, since an automorphism must fix the [additive identity](https://en.wikipedia.org/wiki/Additive_identity "Additive identity") 0 and the [multiplicative identity](https://en.wikipedia.org/wiki/Multiplicative_identity "Multiplicative identity") 1; the sum of a finite number of 1 must be fixed, as well as the additive inverses of these sums (that is, the automorphism fixes all [integers](https://en.wikipedia.org/wiki/Integers "Integers")); finally, since every rational number is the quotient of two integers, all rational numbers must be fixed by any automorphism.
>   - ...
>   -  The study of automorphisms of [algebraic field extensions](https://en.wikipedia.org/wiki/Algebraic_field_extension "Algebraic field extension") is the starting point and the main object of [Galois theory](https://en.wikipedia.org/wiki/Galois_theory "Galois theory").

+++

To be clear, the three groups the author is referring to at the end of this section are:
- The "Galois group" according to Definition 10.6, meaning the domain of an isomorphism $ψ$ from the "Galois group" to permutations of the roots of a polynomial.
- The codomain of $ψ$ i.e. the permutations of the roots of a polynomial that are undetectable by equations of arithmetic (which form a permutation group).
- The "Galois group" according to [Galois group § Definition](https://en.wikipedia.org/wiki/Galois_group#Definition) is the group of all field automorphisms $ϕ$. These field automorphisms $ϕ$ are much "bigger" in some sense than the $ψ$ because they switch not only the roots but all the elements of a field (other than the elements fixed by the automorphism).

+++

### 10.5.4 The symmetries of ℚ(√2,√3)

+++

From the errata (⚠️):

> Page 241, Figure 10.13: The figure uses red and blue backwards. In order to be consistent with Figure 10.12, the red should be blue and vice versa. Here is a corrected version.
>
> ![x](static/Figure_10_13_correction.png)

+++

### 10.5.5 The symmetries of ℚ(∛2)

+++

From the errata (⚠️):

> Page 242, line 6: The phrase "neither $r_1$ nor $r_2$" should be "neither $r_2$ nor $r_3$."

+++

Compare the author's defintion of **normal extension** to [Normal extension](https://en.wikipedia.org/wiki/Normal_extension).

+++

## 10.6 The heart of Galois theory

+++

Compare Theorem 10.10 to the [Fundamental theorem of Galois theory](https://en.wikipedia.org/wiki/Fundamental_theorem_of_Galois_theory).

+++

Compare Theorem 10.11 to [Solvable group § Definition](https://en.wikipedia.org/wiki/Solvable_group#Definition).

+++

From the errata (⚠️):

> Page 246, Figure 10.20: The subgroups in the figure marked as $V_4$ should be marked as $C_4$ instead. Furthermore, the equality signs in the figure are incorrect; the groups are isomorphic, not equal. (The congruence sign should be used instead.)

+++

## 10.7 Unsolvability

+++

### 10.7.1 An unsolvable group

+++

From the errata (⚠️):

> Page 249, paragraph above 10.7.2: The following sentence is inaccurate:
>
> > Furthermore, no group containing A5 can be solvable, because the smallest first step in any chain of normal subgroups in such a group would be the invalid step {e} ⊲ A5.
>
> It should be rewritten along the following lines:
>
> > Furthermore, no group containing A5 can be solvable. No step A ⊲ B in such a chain can have the quotient B/A isomorphic to A5, because it is not abelian. And yet it can also be shown that a step in the chain including just "part" of A5 could be used to reveal a normal subgroup in A5, an impossibility.

+++

### 10.7.2 An unsolvable polynomial

+++

It may seem "unsatisfying" to only refer to the roots $\{r_1,r_2,\dots,r_5\}$ via variable names. Is the solution $\frac{-b±\sqrt{b^2-4ac}}{2a}$ much better, though? It may be what we're used to, but it's really not that simple or satisfying. Expressing the solution to cubic equations is a practical nightmare (try it in Exercise 10.7 part (c)).

+++

If it wasn't for radicals being invented, we could have referred to the solutions to e.g. $3x^2 + x + 1$ without having to write them out (which takes more space than "the solutions to $3x^2 + x + 1$"). If it's more satisfying to refer to it symbolically, then define $f(x) = 3x^2 + x + 1$ and refer to $f^{-1}(0)$ (the kernel of $f$, see [Zero of a function](https://en.wikipedia.org/wiki/Zero_of_a_function)).
