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

# Exercise 7.6

+++

![x](raster/2023-09-11T21-46-07.png)

+++

To answer `1.` let's start with the fact that $f$ is a monomorphism i.e. a [left-cancellative](https://en.wikipedia.org/wiki/Cancellation_property) morphism:

$$
\begin{align}
f∘a = f∘b & ⇒ a = b
\end{align}
$$

In **Set** we know that all of $f,a,b$ are simply functions, so we can re-express composition as:

$$
\begin{align}
f(a()) = f(b()) & ⇒ a = b
\end{align}
$$

Notice we make $Z=X^0$ or the empty tuple so that we can see $a$ and $b$ as nullary operations (language from [Pointed set](https://en.wikipedia.org/wiki/Pointed_set)). To make these maps from e.g. $Z=\underline{2}$ would only add unnecessary complexity i.e. indirection, essentially precomposing to produce something like:

$$
\begin{align}
f∘a∘z & = f∘b∘z \\
f(a(z)) & = f(b(z))
\end{align}
$$

Instead, let's simply see $a,b$ as objects again so that:

$$
\begin{align}
f(a) = f(b) & ⇒ a = b
\end{align}
$$

See [Injective function](https://en.wikipedia.org/wiki/Injective_function) for the formal requirements to be an injective function, in particular [Injective function § Proving that functions are injective](https://en.wikipedia.org/wiki/Injective_function#Proving_that_functions_are_injective). This is the definition of an injective function.

+++

To answer `2.` we can simply follow the same steps in reverse.
