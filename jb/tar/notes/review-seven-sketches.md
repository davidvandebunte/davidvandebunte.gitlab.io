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

# Review

Category theory is ubiquitous in mathematics; it's difficult to read mathematical articles on
Wikipedia without an understanding of the topic.

Category theory is also fundamental to programming; see [Is Category Theory useful for learning
functional programming? - CS SE](https://cs.stackexchange.com/questions/3028).

+++

[ssc]: https://math.mit.edu/~dspivak/teaching/sp18/

## Why [Seven Sketches in Compositionality][ssc] for category theory?

Alternative pedagogical resources:
- [Introduction to Category Theory - Wikiversity](
https://en.wikiversity.org/wiki/Introduction_to_Category_Theory)
- [Category Theory - Wikibooks, open books for an open world](
https://en.wikibooks.org/wiki/Category_Theory)
- [reference request - Good books and lecture notes about category theory. - Math SE](
https://math.stackexchange.com/questions/370/good-books-and-lecture-notes-about-category-theory)
- [Highest scored 'category-theory' questions - Mathematics Stack Exchange](
https://math.stackexchange.com/questions/tagged/category-theory)
- [Highest scored 'category-theory' questions - Stack Overflow](
https://stackoverflow.com/questions/tagged/category-theory)

Category theory is an old topic and shouldn't include much original research. In practice, I've
found most of this book's instructions have directly applicable or equivalent articles on Wikipedia
(which is good).

[azurl]: https://www.amazon.com/Invitation-Applied-Category-Theory-Compositionality/dp/1108711820/ref=sr_1_1?keywords=Invitation-Applied-Category-Theory-Compositionality&qid=1664376287&qu=eyJxc2MiOiIwLjYzIiwicXNhIjoiMC4wMCIsInFzcCI6IjAuMDAifQ%3D%3D&sr=8-1&ufe=app_do%3Aamzn1.fos.d977788f-1483-4f76-90a3-786e4cdc8f10

% TODO: Add an Amazon review when you're done, good or bad. See [Amazon.com: SSC][azurl].

### Open source PDF

[pdffs]: https://arxiv.org/format/1803.05316v3

The PDF is open source; see [Format selector for 1803.05316v3][pdffs]. At the least, this makes it
easy to search for content (e.g. latex macros). It allows for many other workflows as well; you
could copy and paste the question out of the source to avoid the split attention effect, or fix
minor errors in your own fork of the pdf.

[insep]: https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages

To build on Ubuntu 20.04 install the `texlive-full` package; see [LaTeX/Installing Extra Packages -
Wikibooks][insep] for suggestions on your own system. Then in a directory with the source:

```bash
rm 7Sketches.bbl
pdflatex -interaction nonstopmode 7Sketches.tex
pdflatex -interaction nonstopmode 7Sketches.tex
```

You do need to build twice or `cleverref` references will be broken. The resulting pdf will be
missing a bibliography because the authors seem to have failed to include the original `.bib` file
in the source, hence the extra `rm` command. If you don't remove it the build will fail and you'll
either find or review this documentation:
- [biber - Package biblatex Warning: File 'filename.bbl' is wrong format version](
https://tex.stackexchange.com/questions/408473)
- [bibliographies - bibtex vs. biber and biblatex vs. natbib - TeX - LaTeX Stack
  Exchange](https://tex.stackexchange.com/questions/25701/bibtex-vs-biber-and-biblatex-vs-natbib)

More specifically the `.bib` file (the following is line 53 of `7Sketches.tex`) is missing:
```
\addbibresource{Library20180913.bib}
```

It's not trivial to build this file from the `.bbl` file they do include; see [bibtex - Convert .bbl
file to .bib file - TeX - LaTeX Stack
Exchange](https://tex.stackexchange.com/questions/203177/convert-bbl-file-to-bib-file).

+++

## Reference materials

See [Category theory](https://en.wikipedia.org/wiki/Category_theory). Examples of categories:
- [Category of sets](https://en.wikipedia.org/wiki/Category_of_sets)
- [Category of groups](https://en.wikipedia.org/wiki/Category_of_groups)
- [Functor category](https://en.wikipedia.org/wiki/Functor_category)

See [Category:Categories in category theory](
https://en.wikipedia.org/wiki/Category:Categories_in_category_theory) for a more complete list of
example categories, or [Category (mathematics) - Examples](
https://en.wikipedia.org/wiki/Category_(mathematics)#Examples).

See also:
- [Glossary of category theory](
https://en.wikipedia.org/wiki/Glossary_of_category_theory)
- [Outline of category theory](https://en.wikipedia.org/wiki/Outline_of_category_theory)

+++

## Personal workflow

Start by reading [1803.05316.pdf](https://arxiv.org/pdf/1803.05316.pdf) in your browser with two
columns up (select "Even Spreads" in Firefox to match `zathura`), and close the sidebar. Open a
second tab scrolled to the solutions.

Otherwise, use `zathura` to avoid needing to go to PgUp and PgDown on your keyboard. You can have
only one window open and use marks to jump to the solution for the current question.

Don't wait for a full build of your jupyter book notes; open an article in Jupyter to check that
e.g. math renders as expected.

Add to the errata in [Seven-Sketches suggestions - Google
Docs](https://docs.google.com/document/d/160G9OFcP5DWT8Stn7TxdVx83DJnnf7d5GML0_FOD5Wg/edit).
