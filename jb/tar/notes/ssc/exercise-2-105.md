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

# Exercise 2.105

+++

![x](raster/2023-10-28T16-42-39.png)

+++

```{code-cell} ipython3
import numpy as np

inf = float("inf")
M1 = np.array([[0, inf, 3, inf], [2, 0 , inf, 5], [inf, 3, 0 , inf], [inf, inf, 6, 0]])

# See https://stackoverflow.com/a/55986817/622049
M2 = np.min(M1[:,:,None] + M1[None,:,:], axis=1)
M3 = np.min(M2[:,:,None] + M1[None,:,:], axis=1)
M4 = np.min(M2[:,:,None] + M2[None,:,:], axis=1)

M1, M2, M3, M4
```
