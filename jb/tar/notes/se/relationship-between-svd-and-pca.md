---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
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

# SVD for PCA

Supplementary material to the answer by `amoeba` to [Relationship between SVD and PCA. How to use
SVD to perform PCA? - Cross Validated](https://stats.stackexchange.com/a/134283/189415).

```{code-cell} ipython3
import numpy as np
from numpy import linalg as la
np.random.seed(42)
```

Let the data matrix $\mathbf X$ be of $n \times p$ size, where *n* is the number of samples and *p* is the
number of variables (see [Tidy data](https://tidyr.tidyverse.org/articles/tidy-data.html)).

```{code-cell} ipython3
n, p = 5, 3
X = np.random.randint(0, 8, [n, p]).astype(float)
X
```

Let us assume that it is *centered*, i.e. column means have been subtracted and are now equal to
zero.

```{code-cell} ipython3
X -= np.mean(X, axis=0)
X
```

[cm]: https://en.wikipedia.org/wiki/Covariance_matrix

Then the $p \times p$ [covariance matrix][cm] $\mathbf C$ is given by $\mathbf C = \mathbf X^\top \mathbf
X/(n-1)$:

```{code-cell} ipython3
C = np.cov(X, rowvar=False)
C
```

[edsp]: https://en.wikipedia.org/wiki/Eigendecomposition_of_a_matrix#Decomposition_for_special_matrices

It is a symmetric matrix and so it can be diagonalized (see [Eigendecomposition - Decomposition for
special matrices][edsp]):

$$
\mathbf C = \mathbf V \mathbf L \mathbf V^\top
$$

The eigenvalues in decreasing order:

```{code-cell} ipython3
l, principal_axes = la.eig(C)
idx = l.argsort()[::-1]
l, principal_axes = l[idx], principal_axes[:, idx]
l
```

Where $\mathbf V$ is a matrix of eigenvectors (each column is an eigenvector):

```{code-cell} ipython3
principal_axes
```

The eigenvectors are called *principal axes* or *principal directions* of the data.

Projections of the data on the principal axes  are called *principal components*, also known as *PC
scores*; these can be seen as new, transformed, variables. The $j$-th principal component is given
by $j$-th column of $\mathbf {XV}$. The coordinates of the $i$-th data point in the new PC space are
given by the $i$-th row of $\mathbf{XV}$.

```{code-cell} ipython3
principal_components = X.dot(principal_axes)
principal_components
```

If we now perform singular value decomposition of $\mathbf X$, we obtain a decomposition:

$$
\mathbf X = \mathbf U \mathbf S \mathbf V^\top$$

where $\mathbf U$ is a unitary matrix and $\mathbf S$ is the diagonal matrix of singular values
$s_i$.

See [Singular value decomposition - Thin SVD](
https://en.wikipedia.org/wiki/Singular_value_decomposition#Thin_SVD):

```{code-cell} ipython3
U, s, Vt = la.svd(X, full_matrices=False)
V = Vt.T
S = np.diag(s)
```

From here one can easily see that:

$$
\mathbf C = \mathbf V \mathbf S \mathbf U^\top \mathbf U \mathbf S \mathbf V^\top /(n-1) = \mathbf V
\frac{\mathbf S^2}{n-1}\mathbf V^\top
$$

meaning that right singular vectors $\mathbf V$ are principal directions and that singular values
are related to the eigenvalues of covariance matrix via $\lambda_i = s_i^2/(n-1)$. Principal
components are given by $\mathbf X \mathbf V = \mathbf U \mathbf S \mathbf V^\top \mathbf V =
\mathbf U \mathbf S$.

```{code-cell} ipython3
def flip_signs(A, B):
    """
    utility function for resolving the sign ambiguity in SVD
    http://stats.stackexchange.com/q/34396/115202
    """
    signs = np.sign(A) * np.sign(B)
    return A, B * signs
```

To summarize:

- If $\mathbf X = \mathbf U \mathbf S \mathbf V^\top$, then columns of $\mathbf V$ are principal
  directions/axes.

```{code-cell} ipython3
assert np.allclose(*flip_signs(V, principal_axes))
```

- Columns of $\mathbf {US}$ are principal components ("scores").

```{code-cell} ipython3
assert np.allclose(*flip_signs(U.dot(S), principal_components))
```

- Singular values are related to the eigenvalues of covariance matrix via $\lambda_i =
  s_i^2/(n-1)$. Eigenvalues $\lambda_i$ show variances of the respective PCs.

```{code-cell} ipython3
assert np.allclose((s ** 2) / (n - 1), l)
```

- Standardized scores are given by columns of $\sqrt{n-1}\mathbf U$ and loadings are given by
  columns of $\mathbf V \mathbf S/\sqrt{n-1}$. See e.g.
[here](https://stats.stackexchange.com/questions/125684) and
[here](https://stats.stackexchange.com/questions/143905) for why "loadings" should not be confused
with principal directions.
- **The above is correct only if $\mathbf X$ is centered.** Only then is covariance matrix equal to
  $\mathbf X^\top \mathbf X/(n-1)$.
- The above is correct only for $\mathbf X$ having samples in rows and variables in columns. If
  variables are in rows and samples in columns, then $\mathbf U$ and $\mathbf V$ exchange
interpretations.
- If one wants to perform PCA on a correlation matrix (instead of a covariance matrix), then
  columns of $\mathbf X$ should not only be centered, but standardized as well, i.e. divided by
their standard deviations.

- To reduce the dimensionality of the data from $p$ to $k < p$, select $k$ first columns of
  $\mathbf U$, and $k\times k$ upper-left part of $\mathbf S$. Their product $\mathbf U_k \mathbf
S_k$ is the required $n \times k$ matrix containing first $k$ PCs.

```{code-cell} ipython3
k = 2
PC_k = principal_components[:, :k]
US_k = U[:, :k].dot(S[:k, :k])
assert np.allclose(*flip_signs(PC_k, US_k))
```

- Further multiplying the first $k$ PCs by the corresponding principal axes $\mathbf V_k^\top$
  yields $\mathbf X_k = \mathbf U_k^\vphantom \top \mathbf S_k^\vphantom \top \mathbf V_k^\top$
matrix that has the original $n \times p$ size but is *of lower rank* (of rank $k$). This matrix
$\mathbf X_k$ provides a *reconstruction* of the original data from the first $k$ PCs. It has the
lowest possible reconstruction error, [see the answer
here](https://stats.stackexchange.com/questions/130721).

```{code-cell} ipython3
Xk = US_k.dot(Vt[:k, :])
Xk
```

```{code-cell} ipython3
[la.matrix_rank(X), la.matrix_rank(Xk)]
```

- Strictly speaking, $\mathbf U$ is of $n\times n$ size and $\mathbf V$ is of $p \times p$ size.
  However, if $n>p$ then the last $n-p$ columns of $\mathbf U$ are arbitrary (and corresponding
rows of $\mathbf S$ are constant zero); one should therefore use an *economy size* (or *thin*) SVD
that returns $\mathbf U$ of $n\times p$ size, dropping the useless columns. For large $n\gg p$ the
matrix $\mathbf U$ would otherwise be unnecessarily huge. The same applies for an opposite situation
of $n\ll p$.

```{code-cell} ipython3
assert U.shape == (n, p)
assert S.shape == (p, p)
assert V.shape == (p, p)
```

# See also

- [Principal component analysis - Singular value decomposition - Wikipedia](
https://en.wikipedia.org/wiki/Principal_component_analysis#Singular_value_decomposition)
- [Singular value decomposition - Relation to eigenvalue decomposition](https://en.wikipedia.org/wiki/Singular_value_decomposition#Relation_to_eigenvalue_decomposition)
- [Singular value](https://en.wikipedia.org/wiki/Singular_value)

% See TODO-rbsap
