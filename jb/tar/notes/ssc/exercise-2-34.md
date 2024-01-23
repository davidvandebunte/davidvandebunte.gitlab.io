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

# Exercise 2.34

+++

![x](raster/2023-10-27T15-51-19.png)

+++

For `1.`, in the following table we use 0 for no, 0.5 for maybe, and 1 for yes:

```{code-cell} ipython3
import pandas as pd

preorder = [0, 0.5, 1]
min = pd.DataFrame(index=preorder, columns=preorder, data=[[0,0,0], [0,0.5,0.5], [0,0.5,1]])
display(min)
```

[ape]: https://en.wikipedia.org/wiki/Associative_property#Examples

For `2` notice the `min` function is associative; see [Associative property - Examples][ape]. The `yes` element can be used as a monoidal unit. It's easy to see the symmetry/commutativity property is satisfied in the truth table.

To see the monotonicity condition is satisfied we'll use as an inference rule that a
partially-applied `min` function is order-preserving (i.e. [monotone](https://en.wikipedia.org/wiki/Monotonic_function)). That is, if we have that $a_1 \leq a_2$, it
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
