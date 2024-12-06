---
jupytext:
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

# Introduction

+++

## Why [Group theory](https://en.wikipedia.org/wiki/Group_theory)?

+++

From the Wikipedia article:

> The concept of a group is central to abstract algebra: other well-known algebraic structures, such as [rings](https://en.wikipedia.org/wiki/Ring_(mathematics) "Ring (mathematics)"), [fields](https://en.wikipedia.org/wiki/Field_(mathematics) "Field (mathematics)"), and [vector spaces](https://en.wikipedia.org/wiki/Vector_space "Vector space"), can all be seen as groups endowed with additional [operations](https://en.wikipedia.org/wiki/Operation_(mathematics) "Operation (mathematics)") and [axioms](https://en.wikipedia.org/wiki/Axiom "Axiom").

+++

Abstract algebra is central not only to traditional mathematics but to the interpretation of deep learning models.

+++

Additionally we'll see that group theory is a way to model all kinds of symmetry (clearly a lofty goal).

+++

We'll heavily rely on Inkscape to construct answers; see [Inkscape](./inkscape.md) for tips and tricks.

+++

## Why [Visual Group Theory](http://web.bentley.edu/empl/c/ncarter/vgt/) (VGT) for group theory?

+++

The visualizations are by far the most best aspect of this book, but you may have gotten that from the name. Here are some other reasons:

+++

### PDF

+++

One great feature of this book is that you can get a PDF copy, which you can e.g. track locally via `git lfs`. If somehow you lose it, you can also get your PDF back from [My Bookshelf](https://bookstore.ams.org/Bookshelf). It's much easier to read a PDF with a tool you're familiar with (like `zathura`) than fight some strange online format like Google Books.

+++

For questions like Exercise 3.11, you can import the PDF into Inkscape and copy/paste the parts you need of the drawings to answer the question.

+++

![x](vgt/static/cut-up-leaves.gif)

+++

On my machine it takes 2 minutes (all single CPU) for Inkscape to get to the point of being able to select what pages of the PDF to import, then about 2 minutes to import a chunk of 60 pages.

+++

### Errata

+++

The errata is clean and up-to-date; see [VGT - Errata](http://web.bentley.edu/empl/c/ncarter/vgt/errata.html). You'll see misspellings and even major issues in the book, but they're usually already documented in this errata. The website went down at one point; if this happens again see [Wayback Machine: VGT](https://web.archive.org/web/20230501000000*/http://web.bentley.edu/empl/c/ncarter/vgt/errata.html) to get back to the errata (it seems to have been up for 14+ years, otherwise).

+++

### Solutions

+++

Other books mark questions that have an answer available in the back of the book with an asterisk or some other symbol, but for some reason this author chose not to do so.

+++

## Group lists

+++

These are also often called group libraries. The author points to [Group Explorer](https://nathancarter.github.io/group-explorer/index.html) several times in the text. It's functioning as of September 2024; see also [Wayback Machine: GroupExplorer](https://web.archive.org/web/20240000000000*/https://nathancarter.github.io/group-explorer/GroupExplorer.html). Alternatives include (all with slightly different functionality):
- [List of small groups](https://en.wikipedia.org/wiki/List_of_small_groups#cite_note-Dockchitser-2)
  - See in particular [List of small groups § Small Groups Library](https://en.wikipedia.org/wiki/List_of_small_groups#Small_Groups_Library), a part of GAP.
- [GroupNames (maintained by Tim Dokchitser)](https://people.maths.bris.ac.uk/~matyd/GroupNames/)
  - Includes subgroup lattices within the articles on specific groups, including the [Lattice of normal subgroups](https://en.wikipedia.org/wiki/Normal_subgroup#Lattice_of_normal_subgroups) in red.
- [Category:Particular groups - Groupprops](https://groupprops.subwiki.org/wiki/Category:Particular_groups) (multiple pages)
- [ProofWiki](https://proofwiki.org/wiki/Main_Page)
