---
title: "Learn R"
date: 2021-07-24
tags: ['learn']
---

[lbe]: {{< relref "learn-by-example.md" >}}

Specializes [Learn by example][lbe].

## Cost

[browser]: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/browser
[cad]: https://stackoverflow.com/a/15059327/622049
[debug]: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/debug
[itr]: https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf
[rgf]: https://stackoverflow.com/a/7141669/622049
[ref]: https://support.rstudio.com/hc/en-us/articles/205612627-Debugging-with-the-RStudio-IDE

Start with [An Introduction to R][itr]. The pdf version is more readable than the html version,
likely because the authors of R are from the academic world and are rendering html as an
afterthought (i.e. with LaTeX).

Functional programming resources:
- [Select a function from the apply family][rgf]
- [Call apply-like function on each row of a dataframe][cad]

To debug, you can insert [`browser`][browser] in the code, or run `options(error = browser)` (see
[ref][ref]) to open the debugger on errors. See also [`debug`][debug], in particular `debugonce`.
