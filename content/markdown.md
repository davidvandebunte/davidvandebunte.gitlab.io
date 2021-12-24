---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.2
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Markdown Files

Whether you write your book's content in Jupyter Notebooks (`.ipynb`) or
in regular markdown files (`.md`), you'll write in the same flavor of markdown
called **MyST Markdown**.

MyST stands for "Markedly Structured Text". It is a slight variation on a flavor of markdown called
"CommonMark" markdown, with small syntax extensions to allow you to write **roles** and
**directives** in the Sphinx ecosystem.

Roles and directives are two of the most powerful tools in Jupyter Book. They are kind of like
functions, but written in a markup language. They both serve a similar purpose, but **roles are
written in one line**, whereas **directives span many lines**. They both accept different kinds of
inputs, and what they do with those inputs depends on the specific role or directive that is being
called.

Roles will only work if `rolename` is a valid role's name. For example, the `doc` role can be used
to refer to another page in your book. You can refer directly to another page by its relative path.
For example, the role syntax `` {doc}`page/about` `` will result in: {doc}`page/about`.

```{code-cell}
from IPython.display import Markdown
display(Markdown("**asdf**"))
```

More comments:

```{code-cell}
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


    print("test")
    display(Markdown('*exp_table*'))
    print(exp_table)

    display(Markdown('*conjugacy_table2*'))
    print(conjugacy_table2)

[display_symmetric(n) for n in range(3,4)]
```
