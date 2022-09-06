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

# Review: Seven Sketches in Compositionality

Read [1803.05316.pdf](https://arxiv.org/pdf/1803.05316.pdf) in your browser with two columns up.

Errata, etc:
- https://docs.google.com/document/d/160G9OFcP5DWT8Stn7TxdVx83DJnnf7d5GML0_FOD5Wg/edit
- https://math.mit.edu/~dspivak/teaching/sp18/

Download tar of tex sources:
- https://arxiv.org/format/1803.05316

## Chapter 1: Generative effects: Orders and Galois connections

*Exercise 1.1.* Some terminology: a function $f$ is said to be:

1. *order-preserving* if $x\leq y$ implies $f(x)\leq f(y)$, for all $x,y\in\mathbb{R}$
1. *metric-preserving* if $|x-y|=|f(x)-f(y)|$;
1. *addition-preserving* if $f(x+y)=f(x)+f(y)$.


For each of the three properties defined above - call it foo - find an $f$ that is foo-preserving
and an example of an $f$ that is not foo-preserving.

An order-preserving function:

$$
f(x) = x + 1
$$

A function that is not order-preserving:

$$
f(x) = -x
$$

A metric-preserving function:

$$
f(x) = x + 1
$$

A function that is not metric-preserving:

$$
f(x) = 2x
$$

An addition-preserving function:

$$
f(x) = 2x
$$

A function that is not addition-preserving:

$$
f(x) = x^2
$$
