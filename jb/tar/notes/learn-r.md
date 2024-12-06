---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.4
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Learn R

+++

## Cost

+++

Start with [An Introduction to R](https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf). The pdf version is more readable than the html version, likely because the authors of R are from the academic world and are rendering html as an afterthought (i.e. with LaTeX).

See [CRAN: Contributed Documentation](https://cran.r-project.org/other-docs.html) for **R for Beginners** by Emmanuel Paradis ([PDF](https://cran.r-project.org/doc/contrib/Paradis-rdebuts_en.pdf)), as suggested in the preface to SR2.

Functional programming resources:
- [Select a function from the apply family](https://stackoverflow.com/a/7141669/622049)
- [Call apply-like function on each row of a dataframe](https://stackoverflow.com/a/15059327/622049)

To debug, you can insert [`browser`](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/browser) in the code, or run `options(error = browser)` (see [ref](https://support.rstudio.com/hc/en-us/articles/205612627-Debugging-with-the-RStudio-IDE)) to open the debugger on errors. See also [`debug`](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/debug), in particular `debugonce`.
