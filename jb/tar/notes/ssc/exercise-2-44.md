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

# Exercise 2.44

+++

![x](raster/2023-10-27T16-16-48.png)

+++

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
