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

Category theory is an old topic and shouldn't include much original research. You'll find most of
this book's instructions have directly applicable or equivalent articles on Wikipedia (which is
good).

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

Although the text is open source, practically speaking it's not as if someone else could edit it with these issues. For a fork of this content to provide any value (get any use) relative to the original author's copy of the content, these issues would have to be addressed.

+++

## Reference materials

See [Category:Categories in category theory](
https://en.wikipedia.org/wiki/Category:Categories_in_category_theory) for a list of example
categories, or [Category (mathematics) - Examples](
https://en.wikipedia.org/wiki/Category_(mathematics)#Examples).

See also:
- [Template:Category theory](https://en.wikipedia.org/wiki/Template:Category_theory)
- [Glossary of category theory](https://en.wikipedia.org/wiki/Glossary_of_category_theory)
- [Outline of category theory](https://en.wikipedia.org/wiki/Outline_of_category_theory)

+++

## Personal workflow

### Starting a chapter

[ssce]: https://docs.google.com/document/d/160G9OFcP5DWT8Stn7TxdVx83DJnnf7d5GML0_FOD5Wg/edit

Don't run into the same issue someone else already struggled with; use the errata in [Seven-Sketches
suggestions][ssce]. For a strategy for how to use it, see the following.

At the start of every chapter, copy the chapter's comments to a new Google Doc (for an example, see [Review "Seven-Sketches suggestions"](https://docs.google.com/document/d/1HC_BRM2deHxS7FiIto2bfrM81grKu8vDiI-JgCY5eXU/edit)). As you read errors/suggestions in your copy of the errata, strikethrough entries that you've read and documented in this review (Ctrl-Alt-Shift-5 in Google Docs).

For simple issues (typos) fix the problem in the `tex` source of the PDF and rebuild it. Strikethrough the error, and highlight it green (to reflect your classification). You don't want to read these over and over. However, you also don't want to make major changes that significantly affect e.g. page numbers you may have naturally memorized or affect the map between your commentary and the commentary of others.

For more complicated issues, add a +1 with your name in the author's Google Doc. Then strikethrough the comment in your own copy of the errata and highlight it orange (to reflect your classification). Then copy/move the commentary to these html notes. You'll want a record of all the errors this in book that affected you in your own review. Why? Similar to typos, you don't want to have to search for them over and over. When you read your old answers and commentary (review your review), you aren't going to want to go back to the original errata. Before you started copying errors/commentary to your own commentary, you got confused several times when you were trying to understand a particular section and only the author's original errata had commentary, not your content.

Commentary in the errata that didn't bother you, didn't seem to be worth copying, or that you didn't understand and therefore ignored, remain black with a strikethrough. If you don't know the status of whether you've copied the comment somewhere, leave it black.

Ideally you'd "move" his fixes but you can't because you don’t maintain the content; instead you must strike them out in a copy to indicate that you’ve "moved" them. You could also just delete the comments in your copy, but on the off chance that you want to bring in new errors that others bring up later this allows for it. That is, you maintain a monotone map from one Google document to the other that labels errata you’ve addressed as processed. You also effectively maintain a monotone map from this Google document to these html notes through chapter/section numbering, etc.

You really have to take this approach with *any* read-only material that you need to edit: everything must be an annotation. You don't want to look for annotations in two places (in both the author's annotations and your own) so you move his annotations to your own.

+++

### Reading a chapter

If you're not at your Linux desktop, read [1803.05316.pdf](https://arxiv.org/pdf/1803.05316.pdf) in
your browser with two columns up (select "Even Spreads" in Firefox to match `zathura`), and close
the sidebar. Open a second tab scrolled to the solutions. If you are at it, use `zathura` to open
the fixed pdf (and for all the advantages of `zathura`).

This commentary is organized by section, more granular than chapters but less than subsection. The
top of every odd numbered page in the text includes the section (e.g. "1.2. What is Order?" on the
top of pg. 17) which should make it easy to line up the book with the commentary, or vice-versa.

When you're writing detailed answers, use your 1st monitor for Firefox, 2nd for a historical/review
`zathura`, and 3rd/4th for either plain text notes or Inkscape. Keep a new material `zathura`
instance open on the 4th monitor. This way all 4 monitors move from older to newer from left to
right; you'll want your historical zathura next to the old material in your browser (in general, you
can only search what you already know in a browser) to review old commentary with old chapters.

Arrows sometimes appear to be missing in `zathura`; see e.g. Equation 1.5 and Example 4.11. The solution is to zoom in more.

### Finishing a section

Build the notes you've only been looking at in Jupyter, and review the rendered html at the same time you review the answers to the questions (a double review).

+++

## Personal interest in category theory

Category theory is ubiquitous in mathematics; it's difficult to read mathematical articles on
Wikipedia without an understanding of the topic.

Category theory is also fundamental to programming, and in particular to functional programming. See
[Is Category Theory useful for learning functional programming? - CS
SE](https://cs.stackexchange.com/questions/3028) and [Cats |
Semigroup](https://www.scala-exercises.org/cats/semigroup).

For the formal relationship between category theory and programming, see [Curry–Howard
correspondence](https://en.wikipedia.org/wiki/Curry%E2%80%93Howard_correspondence) and [Cartesian
closed category](https://en.wikipedia.org/wiki/Cartesian_closed_category).
