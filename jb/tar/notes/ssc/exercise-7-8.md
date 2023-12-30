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

# Exercise 7.8

+++

To show that $f'$ is a monomorphism, then per Definition 7.5 we must show that the left square in the following is a pullback:

+++

![x](exercise-7-8-to-show.svg)

+++

The left square trivially commutes because $id_{A'}⨟f' = id_{A'}⨟f'$, but we must also show it is a pullback. To do so, we could try to show the outer box is a pullback and use Proposition 7.3. The outer box commutes i.e. $id_{A'}⨟g⨟f = id_{A'}⨟f'⨟h$ because $g⨟f = f'⨟h$.

Based on Definition 7.5 and the fact that $f$ is a monomorphism we also know that:

+++

![x](exercise-7-8.svg)

+++

If we extend $g$ to the left, we know that we have a pullback based on part `2.` of Exercise 7.7:

+++

![x](exercise-7-8-extend-base.svg)

+++

Now we can use Proposition 7.3 to conclude the full rectangle is also a pullback. Is this the same as the full rectangle in our original diagram? Only if $g⨟f = f'⨟h$, which we know is true because the right box in the first diagram simply commutes. Again by Proposition 7.3 but using it in the opposite way, if the full rectangle in the original diagram is a pullback then the left square is a pullback (as we wanted to show).
