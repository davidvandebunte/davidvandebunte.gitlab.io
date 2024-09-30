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

# 10.8 Exercises

+++

## 10.8.1 Basics

+++

### Exercise 10.1

+++

> (a) a number in ℕ

+++

4

+++

> (b) a number in ℤ but not ℕ

+++

-4

+++

> (c) a number in ℚ but not ℤ

+++

3/7

+++

> (d) a number in ℝ but not ℚ (i.e. irrational)

+++

$π$

+++

> (e) an algebraic number not in ℝ

+++

$\sqrt{2}$

+++

> (f) a number in ℂ that's not algebraic (i.e. transcendental)

+++

$π$

+++

> (g) a number in ℂ that's not algebraic nor in ℝ

+++

$π + i$

+++

### Exercise 10.2

+++

> Simplify each of these complex-number expressions.
> 
> (a) $(12 + i)(3 - i)$

+++

$36 + 3i - 12i + 1 = 37 - 9i$

+++

> (b) $2i(1 + i + i³) - 9$

+++

$2i - 2 + 2 - 9 = -9 + 2i$

+++

### Exercise 10.3 (📑)

+++

> Identify which of the following statements are true and which are false, and explain why.
>
> (a) Saying a polynomial is "solvable" means that it has solutions.

+++

False. The term "solvable" means "solvable by radicals" (confusingly).

+++

> (b) Every quartic polynomial is solvable.

+++

True

+++

> (c) Every quintic polynomial is solvable.

+++

False. See section 10.7.2 for an example.

+++

> (d) No quintic polynomial is solvable.

+++

False. The equation $x^5 = 0$ is solvable (it's zero).

+++

> (e) Every sextic (degree 6) polynomial is solvable.

+++

False

+++

> (f) No sextic polynomial is solvable.

+++

False. The equation $x^6 = 0$ is solvable (it's zero).

+++

> (g) Because every Galois group contains the complex conjugacy operation, every Galois group has even order.

+++

False. The field extension $ℚ(\sqrt{2})$ does not include the complex conjugacy operation.

+++

> (h) Every polynomial $x^2 - a$ (for $a > 0$ in $ℚ$) is irreducible.

+++

False. Consider $x^2 - 1 = (x + 1)(x - 1)$ and $x^2 - 4 = (x + 2)(x - 2)$.

+++

> (i) The Eisenstein Criterion can never be used to conclude that a polynomial is factorable. It only tells us when a polynomial is not factorable.

+++

True. It is a sufficient condition but not a necessary one.

+++

> (j) If a quintic polynomial factors over $ℚ$, then it is solvable.

+++

True

+++

> (k) Every Galois group is finite.

+++

False. See [Galois group § Infinite groups](https://en.wikipedia.org/wiki/Galois_group#Infinite_groups).

+++

> (l) Every algebraic number is a real number.

+++

False. Imaginary numbers are algebraic.

+++

> (m) Every real number is an algebraic number.

+++

False. The number $π$ is not real but algebraic. The equation $(x - π)^2 = 0$ doesn't count because the coefficients aren't in $ℚ$.

+++

### Exercise 10.4

+++

Question fixed based on the following from the errata (⚠️):

> Page 253, Exercise 10.4: In part (a), step 2 actually yields $\frac{-x^2-x-2}{x^2+1}$.

+++

> I say in the text that any equation made from the operations of arithmetic can be simplified to a polynomial equal to zero. The following simplification procedure supports my claim.
>
> 1. If needed, subtract to move the right side over to the left, leaving just zero on the right.
> 2. Combine fractions until the left-hand side contains at most one fraction. (More on this step below.)
> 3. Multiply both sides of the equation by the fraction's denominator, leaving a polynomial equal to zero.
>
> Answer the following questions to show that the above procedure works.
>
> (a) Consider $\frac{x-1}{x + \frac{1}{x}} = 2$. Applying step 1 yields $\frac{x-1}{x + \frac{1}{x}} - 2 = 0$, and step
2 then yields $\frac{-x^2-x-2}{x^2+1}$. Explain how step 2 was applied (that is, show the steps).

+++

$$
\begin{align}
\frac{x-1}{x + \frac{1}{x}} - 2 & = 0 \\
\frac{x(x-1)}{x(x + \frac{1}{x})} - 2 & = 0 \\
\frac{x^2-x}{x^2 + 1} - 2 & = 0 \\
\frac{x^2-x}{x^2 + 1} - 2\frac{x^2 + 1}{x^2 + 1} & = 0 \\
\frac{-x^2-x-2}{x^2 + 1} & = 0
\end{align}
$$

+++

> (b) In general, if step 1 results in two fractions subtracted, how should they be combined? What other algebra steps may be needed to get a large, complicated expression down to containing at most one fraction?

+++

The top and bottom of the two fractions should be multiplied by a polynomial that makes both fractions have the same denominator, so they can be combined. In general this is the least common multiple of the two polynomials, but multiplying the two denominators will produce a polynomial that works.

+++

> (c) What might equations from algebra that contain at most one fraction look like? Why does step 3 always turn them into polynomials?

+++

An example might be $\frac{x^5}{1 + x^{-3}} + 6x = 0$. When we multiply by the one fraction's denominator we always remove it.

+++

> (d) What equation results if we apply step 3 to the expression from part (a)?

+++

$-x^2 - x - 2 = 0$

+++

> (e) Explain how any polynomial equation whose coefficients are rational numbers can be turned into one with only integer coefficients. Test your method on $\frac{2}{9}x^7 - \frac{11}{8}x + \frac{1}{2} = 0$.

+++

Multiply the equation by the least common multiple of the denominators i.e. 72:

```{code-cell} ipython3
import math

math.lcm(2,8,9)
```

$$
72\frac{2}{9}x^7 - 72\frac{11}{8}x + 72\frac{1}{2} = 16x^7 - 99x + 36 = 0
$$

+++

### Exercise 10.5 (📑)

+++

> Prove the missing step in Theorem 10.3, that:
>
> $\overline{(a + bi)(c + di)} = (\overline{a + bi})(\overline{c + di})$

+++

$$
\overline{(a + bi)(c + di)} = \overline{ac - bd + (bc + ad)i} = ac - bd - (bc + ad)i = (a - bi)(c - di) = (\overline{a + bi})(\overline{c + di})
$$

+++

### Exercise 10.6 (📑)

+++

See the following from the errata if you use the author's explanation (⚠️):

> Pages 253-254, Exercise 10.6: Every occurrence of 24x in the example polynomial division should actually be 26x.

+++

Otherwise, see [Polynomial long division](https://en.wikipedia.org/wiki/Polynomial_long_division).

+++

> Solve the following polynomial division problems. The solutions for the first two are available in the back of the book.
>
> (a) $\frac{x^3-1}{x-1}$

+++

![x](10-8-ex-6-a.svg)

+++

> (b) $(76x^7 + 20x^6 - 38x^4 - 10x^3 + 2) ÷ (4x^6 - 2x^3)$

+++

See the book's solution.

+++

> (c) $(x^5-1) ÷ (x-1)$

+++

$x^4 + x^3 + x^2 + x + 1$

+++

> (d) Another polynomial

+++

Skipping; it doesn't seem like there'd be much insight to gain from this exercise.

+++

> (e) $\frac{x^n-1}{x-1}$

+++

$x^{n-1} + x^{n-2} + \cdots + x + 1$

+++

> (f) Factor the lower right polynomial in Figure 10.6 into irreducible polynomials.

+++

The polynomial is $8x^5 - 28x^4 - 6x^3 + 83x^2 - 117x + 90$; notice the roots are in that figure as well. So this should be as simple as:

$$
(x + 2)(x - 3/2)(x - 3)(x - (1/2 - i))(x - (1/2 + i)) = (x + 2)(x - 3/2)(x - 3)(x^2 - x + 5/4)
$$

+++

> (g) If a division (such as part (d)) does not come out even, but has a remainder, does that make the polynomial irreducible?

+++

No, we may have simply divided by an expression that is not a factor.

+++

### Exercise 10.7

+++

> Discern whether the following polynomials are irreducible. For those that are reducible, factor them.
>
> (a) $x^2 - 14x + 51$

+++

For an order-2 polynomial we can rely on the [Quadratic equation](https://en.wikipedia.org/wiki/Quadratic_equation). The [Discriminant](https://en.wikipedia.org/wiki/Discriminant) is:

+++

$$
b^2 - 4ac = 196 - 204 = -8
$$

+++

Since this is negative, the polynomial is irreducible.

+++

> (b) $60x^2 + 50x - 10$

+++

To avoid big numbers, we can immediately reduce this to $6x^2 + 5x - 1 = 0$.

$$
\frac{-b±\sqrt{b^2-4ac}}{2a} = \frac{-5±\sqrt{25+24}}{12} = \left\{\frac{1}{6}, -1\right\}
$$

+++

(c) $9x^3 - 36x^2 + x - 4$

+++

See [Cubic equation](https://en.wikipedia.org/wiki/Cubic_equation#History). Cardano's formula is rather complicated, so we'll use technology to guess-and-check:

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(-2,5,100)
y = [np.polyval([9,-36,1,-4], i) for i in x]
plt.grid(); plt.plot(x,y); plt.show()
```

![x](10-8-ex-7-c.svg)
