---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
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

# Exercise 8.32

```{code-cell} ipython3
from itertools import permutations, product
from pprint import pformat

from numpy import zeros
from sympy.combinatorics.generators import symmetric
from IPython.display import Markdown


def display_symmetric(n: int):
    perms = list(symmetric(n))
    perm_dict = dict()
    for i, perm in enumerate(perms):
        perm_dict[i] = perm
    inv_perms = {v: k for k, v in perm_dict.items()}

    display(Markdown(f'**n = {n}**'))
    print(pformat(perm_dict))

    exp_table        = zeros([len(perms), len(perms)], dtype=int)
    conjugacy_table2 = zeros([len(perms), len(perms)], dtype=int)
    for i, j in product(range(len(perms)), repeat=2):
        a = perms[i]
        b = perms[j]
        exp_table[i, j]        = inv_perms[a ^ b]
        conjugacy_table2[i, j] = inv_perms[b * a * ~b]

    display(Markdown('<br/>exp_table'))
    print(exp_table)

    display(Markdown('<br/>conjugacy_table2'))
    print(conjugacy_table2)

[display_symmetric(n) for n in range(3,4)];
```
