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

# Memoize Jupyter Book

Specializes:
- [](./memoize-artifact.md)

## Value

A book with executable content will take longer and longer to build without some kind of memoization
of execution results. See also the "Value" section in [](./memoize-artifact.md).

## Cost

In order of Correctness:

### Almost Correct: Whole book cache

[jb]: https://jupyterbook.org/intro.html
[jc]: https://jupyter-cache.readthedocs.io/en/latest/
[bsf]: https://jupyterbook.org/customize/toc.html#build-an-article-from-a-single-file

The [Jupyter Book][jb] project provides a caching system, through [Jupyter Cache][jc]. Generally
speaking users build a whole book, although there is an option to [Build an article from a single
file][bsf]. Both options produce an automatically-managed cache (albeit in different directories).

If you save the whole book cache as an artifact (e.g. a tar file) and rely on it for future builds,
you'll save time in the short term. Unfortunately this is inCorrect, since your artifact was
generated in an environment (e.g. a docker image) and this dependency is not recorded with the
artifact, but assumed by the Jupyter Book caching system. That is, changes to your docker image
could break the build of your book from a clean cache.

The cost of this imperfect system is that you need to remember to manually delete your cache (e.g.
the tar file) when you update the docker image, or risk being inCorrect. You could push a cache to a
branch of git in CI/CD (not the same branch triggering the CI/CD job, and with ci.skip), or simply
upload your local cache.

The advantage to this system is you don't need to rerun all your notebooks whenever you modify your
execution environment (docker image). Think of the full jupyter book cache as a list of what you
don't want to run, or the articles you don't care about being reproducible (that you maintain as a
historical record).

### Correct: `jcache`

To integrate this system into a larger Bazel build would require using `jcache` with individual
Jupyter Book source files (e.g. ipynb and md files), constructing a cache in parallel, then doing a
whole book build from the fully constructed cache.
