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

+++

## Why category theory (CT)?

+++

Category theory is ubiquitous in mathematics; it's difficult to read mathematical articles on Wikipedia without an understanding of the topic. See also [Mathematical subjects you wish you learned earlier - MSE](https://math.stackexchange.com/questions/213/mathematical-subjects-you-wish-you-learned-earlier). This may reflect the fact that more mathematicians are using category theory as a basis for mathematics rather than set theory; see [Topos § Elementary topoi (topoi in logic)](https://en.wikipedia.org/wiki/Topos#Elementary_topoi_(topoi_in_logic)) and [nLab](https://ncatlab.org/nlab/show/HomePage).

Category theory is also fundamental to programming, and in particular to functional programming. See
[Is Category Theory useful for learning functional programming? - CS
SE](https://cs.stackexchange.com/questions/3028) and [Cats |
Semigroup](https://www.scala-exercises.org/cats/semigroup). For the formal relationship between category theory and programming, see [Curry–Howard
correspondence](https://en.wikipedia.org/wiki/Curry%E2%80%93Howard_correspondence) and [Cartesian
closed category](https://en.wikipedia.org/wiki/Cartesian_closed_category). These are at least partially addressed by the end of the book.

We use CT for category theory following `math.CT` in [arXiv - Mathematics](https://arxiv.org/archive/math.CT).

+++

## Why [Seven Sketches](https://math.mit.edu/~dspivak/teaching/sp18/) (7S) for CT?

+++

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

+++

What makes "Seven Sketches" stand out is that it is:
1. Tied to Wikipedia
2. Open source

+++

If you need a letter-only acronym for the book, consider SSC (Seven Sketches in Compositionality). This acronym/title could also be used to emphasize a commitment to the [Principle of compositionality](https://en.wikipedia.org/wiki/Principle_of_compositionality).

+++

### Tied to Wikipedia

+++

Category theory is an old topic and shouldn't include much original research. You'll find most of this book's instructions have directly applicable or equivalent articles on Wikipedia; you'll likely eventually want to graduate to using only references (non-pedagogical resources) like Wikipedia and nLab. We'll assume the authors never inspected Wikipedia and that therefore there are no circular references if we cite it from these sites 😉.

In the following (much longer) commentary on this book we'll provide links to the Wikipedia articles that most closely match the content that we are covering in the text. When the text does not provide a great explanation, these links can provide a second perspective.

[azurl]: https://www.amazon.com/Invitation-Applied-Category-Theory-Compositionality/dp/1108711820/ref=sr_1_1?keywords=Invitation-Applied-Category-Theory-Compositionality&qid=1664376287&qu=eyJxc2MiOiIwLjYzIiwicXNhIjoiMC4wMCIsInFzcCI6IjAuMDAifQ%3D%3D&sr=8-1&ufe=app_do%3Aamzn1.fos.d977788f-1483-4f76-90a3-786e4cdc8f10

% TODO: Add an Amazon review when you're done, good or bad. See [Amazon.com: 7S][azurl].

+++

### Open source

+++

The PDF is open source and published on arXiv. At the least, this makes it easy to search for content (e.g. latex macros). You could in theory pull only the source of a question out into some other context (perhaps next to your answer, to avoid the split attention effect).

Although there were many small errors (errata, grammar, etc.) in the original PDF, the advantage of open source is that these can not only be expressed to the authors, but fixed. See the latest pipeline in [Pipelines · applied-category-theory / seven-sketches · GitLab](https://gitlab.com/applied-category-theory/seven-sketches/-/pipelines) for a PDF with some of these kinds of errors fixed.

Even if you're not fixing errors, being able to build the PDF can be useful for other reasons. You may want to change e.g. the formatting slightly so that it fits more nicely on your computer monitors, or remove content that isn't particularly interesting.

+++

#### Building the PDF

+++

[insep]: https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages
[pdffs]: https://arxiv.org/format/1803.05316v3

See also [LaTeX/Installing Extra Packages - Wikibooks][insep]. The `.bib` file (the following is line 53 of `7Sketches.tex`) is missing from [Format selector for 1803.05316v3][pdffs]:
```
\addbibresource{Library20180913.bib}
```

The authors seem open/friendly and kindly provided this file via email; see [Library20180913.bib · 5462bb5616b48e89c5775a13409204338a695f8e](https://gitlab.com/applied-category-theory/seven-sketches/-/blob/5462bb5616b48e89c5775a13409204338a695f8e/Library20180913.bib) for the original.

+++

## Reference materials

+++

See [Category:Categories in category theory](
https://en.wikipedia.org/wiki/Category:Categories_in_category_theory) for a list of example
categories, or [Category (mathematics) - Examples](
https://en.wikipedia.org/wiki/Category_(mathematics)#Examples). See also:
- [Template:Category theory](https://en.wikipedia.org/wiki/Template:Category_theory)
- [Glossary of category theory](https://en.wikipedia.org/wiki/Glossary_of_category_theory)
- [Outline of category theory](https://en.wikipedia.org/wiki/Outline_of_category_theory)

+++

## Suggested workflow

+++

### Starting a chapter

+++

[ssce]: https://docs.google.com/document/d/160G9OFcP5DWT8Stn7TxdVx83DJnnf7d5GML0_FOD5Wg/edit

Don't run into the same issue someone else already struggled with; use the errata in [Seven-Sketches suggestions][ssce]. At the start of every chapter, copy the chapter's comments to a new Google Doc (for an example, see [Review "Seven-Sketches suggestions"](https://docs.google.com/document/d/1HC_BRM2deHxS7FiIto2bfrM81grKu8vDiI-JgCY5eXU/edit)). As you read errors/suggestions in your copy of the errata, strikethrough entries that you've read and documented in this review (Ctrl-Alt-Shift-5 in Google Docs).

For simple issues (e.g. typos) fix the problem in the `tex` source of the PDF and submit a patch to [applied-category-theory / seven-sketches · GitLab](https://gitlab.com/applied-category-theory/seven-sketches). You don't want to read these over and over. However, you also don't want to make major changes that significantly affect e.g. page numbers you may have naturally memorized or affect the map between your commentary and the commentary of others. Highlight these green until they're on the main branch.

For more complicated issues, add a +1 with your name in the original [Seven-Sketches suggestions][ssce]. Then strikethrough the comment in your own copy of the errata and highlight it red (to reflect your classification). Then copy/move the commentary to your own commentary (in this case, these HTML notes). You'll want a record of all the errors this in book that affected you in your own review. Why? Similar to typos, you don't want to have to search for them over and over. When you read your old answers and commentary (review your review), you aren't going to want to go back to the original errata. In my experience, before I started copying errors/commentary to my own commentary, I got confused several times when trying to understand a particular section and only [Seven-Sketches suggestions][ssce] had commentary, not my own. These more complicated issues should more appropriately be fixed in a second edition of the book.

You could also just delete the comments in [Review "Seven-Sketches suggestions"](https://docs.google.com/document/d/1HC_BRM2deHxS7FiIto2bfrM81grKu8vDiI-JgCY5eXU/edit), but on the off chance that you want to bring in new errors that others bring up later this allows for it. That is, maintain a monotone map from one Google document to the other that labels errata you’ve addressed as processed.

I'm also effectively maintaining a monotone map from the PDF to these html notes through chapter/section numbering, etc. You really have to take this approach with *any* read-only material that you need to edit: everything must be an annotation. In this case, neither the original PDF nor [Seven-Sketches suggestions][ssce] are completely read-only, but we don't want to heavily edit either. You also don't want to look for annotations in two places (in other reader's commentary and your own) so you move their commentary to your own. As is the case for many issues in [Seven-Sketches suggestions][ssce], you may not even want to pull in all other commentary.

Commentary in the errata that didn't bother you, didn't seem to be worth copying, or that you didn't understand and therefore ignored, can be highlighted light blue (not light cornflower blue). Commentary that you haven't decided what to do with can remain black with a strikethrough.

+++

### Reading a chapter

+++

Arrows sometimes appear to be missing in `zathura`; see e.g. Equation 1.5 and Example 4.11. The solution is to zoom in more. The disadvantage to being zoomed in more is that you lose more context, and when you click on links in the PDF part of the dual pages are cut off.

The advantage to reading the PDF is that you can follow links (a jump in `zathura`) to different parts of the PDF, and you can search for text (PNGs are not searchable). The advantage to reading directly from Jupyter Book is the additional commentary, including additional links to the web.

To tweak e.g. `setlrmargins`, see:
- [The memoir class](https://texdoc.org/serve/memoir/0)
- [Margin (typography) - Wikipedia](https://en.wikipedia.org/wiki/Margin_(typography))

Why narrow the margins? One advantage is that you gain a lot of context while still being able to click on internal PDF links without zoom issues. Gaining more context in exchange for whitespace is also an advantage when reading on a tablet.

The disadvantages are that your page numbers don't match the original PDF, and less whitespace is harder for first-time readers (or readers who have not seen the text in some time). An alternative to more context in the PDF on one monitor is opening commentary on it in the browser on different monitors (or to open the PDF on multiple monitors).

To convert content to PNG see [How to make a color transparent in GIMP](https://graphicdesign.stackexchange.com/questions/36520/how-to-make-a-color-transparent-in-gimp) (use `Ctrl-o` with mnemonic c**o**lor) and [How do I use the Selection tool to move things in GIMP?](https://superuser.com/a/662813/293032) (use `R`, `Ctrl-Shift-L` with mnemonic f**l**oat/**l**ift, and `Ctrl-h` with mnemonic anc**h**or).
