---
jupytext:
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

# Review

+++

We'll use "VGT" as an acronym for Visual Group Theory. See the [VGT Website](http://web.bentley.edu/empl/c/ncarter/vgt/) for a quick summary of the book.

This review will rely on Inkscape heavily to construct answers; it's not clear what tool the author used for his drawings but it would work as well.

+++

## Why VGT for group theory?

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

## Tags

+++

We'll use these tags throughout this review:

+++

### 📑: Available answer

+++

This review uses 📑 on questions to indicate an answer to the question is available at the end of the book. Other books mark questions that have an answer available in the back of the book with an asterisk or some other symbol, but for some reason this author chose not to do so.

These answers are also included inline in this Jupyer Book, partially because this review is essentially an answer key already (with another student's answers). A second benefit to providing these solutions inline is an opportunity to fix the author's answers (based on in particular, the errata) or comment on them. The third benefit is providing these answers directly next to the solution, to avoid the [Split attention effect](https://en.wikipedia.org/wiki/Split_attention_effect) (when that might be desired).

+++

### ⚠: Known issue

+++

We'll mark questions and sections with a ⚠ if one should reference the errata before starting. We won't do this for typos but only non-trivial problems where it would be helpful to see the errata before reading or trying to answer a question.

+++

### 🕳️: Appendix issue

+++

Sometimes both a question and its answer have issues (the author was having a bad day). We'll use 🕳️ rather than 📑 when an answer has issues so we don't check the errata only when we start the question (see [VGT Errata § Appendix](http://web.bentley.edu/empl/c/ncarter/vgt/errata.html#appendix)).

+++

### 🔨: Work in progress

+++

Some questions don't have complete answers, either because we decided it didn't seem valuable to finish answering the question (there was little insight to be gained) or the question was simply too difficult. Comments on how to move forward are always welcome!

+++

### 📌: Unresolved issue

+++

Some content still appears to be incorrect, and the issue is not mentioned in the errata. Can you help verify there's a problem?

+++

## Group lists

+++

These are also often called group libraries. The author points to [Group Explorer](https://nathancarter.github.io/group-explorer/index.html) several times in the text. It's functioning as of September 2024; see also [Wayback Machine: GroupExplorer](https://web.archive.org/web/20240000000000*/https://nathancarter.github.io/group-explorer/GroupExplorer.html). Alternatives include (all with slightly different functionality):
- [List of small groups](https://en.wikipedia.org/wiki/List_of_small_groups#cite_note-Dockchitser-2)
  - See in particular [List of small groups § Small Groups Library](https://en.wikipedia.org/wiki/List_of_small_groups#Small_Groups_Library), a part of GAP.
- [GroupNames (maintained by Tim Dokchitser)](https://people.maths.bris.ac.uk/~matyd/GroupNames/)
  - Includes subgroup lattices within the articles on specific groups, including the [Lattice of normal subgroups](https://en.wikipedia.org/wiki/Normal_subgroup#Lattice_of_normal_subgroups) in red.
- [ProofWiki](https://proofwiki.org/wiki/Main_Page)
