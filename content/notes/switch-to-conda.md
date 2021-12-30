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

# Switch to conda

## Test

Switch from `pip` to `conda` for installing *both* python and non-python package dependencies for
some application. Both `conda` and `pip` can install non-python packages (`pip` uses wheels), but
they do so differently.

## Value

[ucp]: https://www.anaconda.com/blog/understanding-conda-and-pip
[dpc]: https://stackoverflow.com/questions/20994716/what-is-the-difference-between-pip-and-conda

Outsider summaries:
- [Anaconda | Understanding Conda and Pip][ucp]
- [What is the difference between pip and conda? - SO][dpc]

### Smarter dependency resolution

[pndr]: https://github.com/pypa/pip/issues/988
[pdr]: https://pip.pypa.io/en/latest/topics/dependency-resolution

> Pip and conda also differ in how dependency relationships within an environment are fulfilled.
> When installing packages, pip installs dependencies in a recursive, serial loop. No effort is made
> to ensure that the dependencies of all packages are fulfilled simultaneously. This can lead to
> environments that are broken in subtle ways, if packages installed earlier in the order have
> incompatible dependency versions relative to packages installed later in the order. In contrast,
> conda uses a satisfiability (SAT) solver to verify that all requirements of all packages installed
> in an environment are met. This check can take extra time but helps prevent the creation of broken
> environments. As long as package metadata about dependencies is correct, conda will predictably
> produce working environments.

Quote from:
- [Anaconda | Understanding Conda and Pip][ucp]

However, see [pip needs a dependency resolver · Issue #988 · pypa/pip][pndr]. Apparently this issue
has been resolved as of late 2020. See also [Dependency Resolution - pip documentation][pdr].

### Update-to-date and optimized non-python packages

[mys]: https://jakevdp.github.io/blog/2016/08/25/conda-myths-and-misconceptions/#Myth-#6:-Now-that-pip-uses-wheels,-conda-is-no-longer-necessary
[sitp]: https://towardsdatascience.com/stop-installing-tensorflow-using-pip-for-performance-sake-5854f9d9eb0c

Conda also supports more platforms and has more up to date packages than your system package
manager.

Why would someone prefer conda to the system package manager? Why are packages in the conda
ecosystem rather than the Ubuntu ecosystem? The Ubuntu packages will manage all their dependencies,
but not interact with the Python library dependencies. It’s difficult to find a solution that
manages dependencies between C and Python packages; conda often fails to find a solution when you
are trying to install a new mix of C/Python packages. In general you can specify system dependencies
in Docker, but then you aren't going to get any dependency resolution between gcc and your
scientific python packages (like PyTorch).

These non-python packages are often optimized linear algebra libraries for your platform, unlike
what you get with a wheel:
- [Myth #6: Now that pip uses wheels, conda is no longer necessary][mys]
- [Stop Installing Tensorflow using pip for performance sake! | Towards Data Science][sitp]

### Integrated environment management

[cecd]: https://docs.conda.io/projects/conda/en/latest/user-guide/concepts/environments.html
[dcrv]: https://stackoverflow.com/questions/34398676

> Another key difference between the two tools is that conda has the ability to create isolated
> environments that can contain different versions of Python and/or the packages installed in them.
> This can be extremely useful when working with data science tools as different tools may contain
> conflicting requirements which could prevent them all being installed into a single environment.
> Pip has no built in support for environments but rather depends on other tools like virtualenv or
> venv to create isolated environments. Tools such as pipenv, poetry, and hatch wrap pip and
> virtualenv to provide a unified method for working with these environments.

Quote from:
- [Anaconda | Understanding Conda and Pip][ucp]

PyTorch recommends `conda` for the sake of sandboxing:
- [Start Locally | PyTorch](https://pytorch.org/get-started/locally/)

See also:
- [Does Conda replace the need for virtualenv? - SO][dcrv]
- [Conda environments — conda documentation][cecd]

## Cost

Conda is much slower to build because it does more checks. To address this issue, always cache
(memoize) docker image artifacts.
