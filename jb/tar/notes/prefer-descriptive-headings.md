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

# Prefer descriptive headings

+++

## Motivation for numbering

+++

When you search through a TOC, a descriptive name is going to much more helpful than a plain number for an exercise or definition. What's the motivation for the exercise numbering in [7Sketches.pdf](https://gitlab.com/applied-category-theory/seven-sketches/uploads/33f290d229d6e2a7f3d9a7454b839580/7Sketches.pdf#section.7.4), for example? Many readers would have preferred an exercise description instead, or a title for a definition. Do you want to be scanning for "Definition 1.120" or "Closure operator"? There is no numbering for articles on e.g. Wikipedia.

+++

### Laziness

+++

In most cases, this is just laziness on the part of the author. For the same reason that you often just use the exercise number to refer to something (an easily unique anchor), you don't have to think much when someone has already given you an anchor you can use that you can see is already both short and unique. To try to find something that's short and unique and doesn't clash with other words would take work. In the case of 7S, the source `.tex` will have a good suggestion for the heading (really, this is information that should be extracted). These are the "real" names for exercises, what the authors choose to think in. Unfortunately, they're also usually just abbreviations (not suitable as a heading).

A short, descriptive, and unique name to replace an auto-generated heading is hard. It's OK to be lazy and skip it sometimes, but the investment is sometimes worth it.

+++

### Fast mapping

+++

When two readers agree to use the same version of a PDF, automatic numbering is also a convenient way for them to communicate. If exercise descriptions are too long, then it may be faster to refer to numbers. Unfortunately this also requires an agreement on a context (a specific numbering) that is much less reliable than English.

+++

There's also value in a quick mapping from PDF to e.g. HTML commentary. If you retain these numbers, you'll be able to go from the PDF to an `exercise-x-yy.html` file quickly and be able to go from an exercise to the right subheading when you're starting form the HTML. But go from PDF to HTML, don't you always have to first jump to the exercise in the PDF to get the associated section name first though? If you're doing that anyways, you'll almost surely be able to narrow down what heading to click on in the HTML TOC based on the content of the question. Even the largest sections have only 10-15 questions.

+++

## Conflicting numbering

+++

The printed version of 7S ([An Invitation to Applied Category Theory: Seven Sketches in Compositionality](https://www.amazon.com/Invitation-Applied-Category-Theory-Compositionality/dp/1108711820)) has completely different numbering, for example. No one has the numbers memorized; neither readers or authors. At best someone remembers what the chapter numbers correspond to. In [Visual Group Theory](https://bookstore.ams.org/clrm-32/) and [Statistical Rethinking](https://xcelab.net/rm/statistical-rethinking/) the authors group exercises at the end of chapters, which makes it easier for readers to collaborate when numbering changes on exercises (besides making it easier to renumber the exercises).

+++

## Non-reusable memorization

+++

The human brain is based on words, and the compression and indexing of words. That's the system you want to stick to. You don't want to memorize the numbering a book uses. When humans learn new words, we have to fit them alongside existing words. A document just renumbers everything, destroying all mental links. You don't want to be memorizing numbers in such a fragile system. Even if you were to get a SHA based on content, the SHA is designed to jump the content to some totally different place in a dictionary (to be totally unique). The brain doesn't work that way.

+++

We don't want headings to look like many passwords:

![x](https://imgs.xkcd.com/comics/password_strength.png)
