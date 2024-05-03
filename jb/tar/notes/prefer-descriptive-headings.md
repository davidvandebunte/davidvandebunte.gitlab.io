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

# Add descriptive headings

+++

In summary, don't write `2-0.md`. Instead, create documents with names more like `2-0-what-do-groups-look-like.md`.

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

There's also value in a quick mapping from PDF to e.g. HTML commentary. If you retain these numbers, you'll be able to go from the PDF to an `exercise-x-yy.html` file quickly and be able to go from an exercise to the right subheading when you're starting form the HTML. But to go from PDF to HTML, don't you always have to first jump to the exercise in the PDF to get the associated section name first though? If you're doing that anyways, you'll almost surely be able to narrow down what heading to click on in the HTML TOC based on the content of the question. Even the largest sections have only 10-15 questions.

+++

### In-Jupyter TOC

+++

One reason you don't use Jupyter and instead are forced to build JB and inspect the result is that you have a useful TOC in JB that lets you e.g. jump to a part of SSC by section number. You should really have numbered your files by section number (e.g. `ssc-section-4-2.md`) so that the sidebar in Jupyter was essentially a linear TOC. You should try to achieve this in the future however: your JB TOC should roughly be in alphabetical order (whenever possible e.g. you can anticipate your organization).

Unfortunately alphabetical order doesn't always match logical order. You've had the same conflict in your tmux sessions, where you try to organize them artificially. Is this artificial, though? Could you see this as numbering the sections of your notes to make them quicker to jump to? Look at the SSC source .tex files: it also "artifically" puts numbers at the start of filenames.

In fact, you should be able to see the organization of your files on disk as analogous to an extended table of contents. Both are tree data structures; you've noted elsewhere that the sections in a particular document (the `#`, `##`, etc.) are a tree data structure. The filesystem is the same, but using nested directories. You should be able to make your TOC as deep as you want this way; the JB `_toc.yml` is only going to be a flattened version of this organization. Generally speaking, you should be able to make the sections in your `_toc.yml` match the directories you have on disk.

+++

Be aware that numerical order does not match alphabetical order! Consider the sort of these filenames:

+++

```
1-first.md
10-tenth.md
11-eleventh.md
2-second.md
3-third.md
...
```

+++

Because a `-` comes before any of the numbers in [ASCII § Character set](https://en.wikipedia.org/wiki/ASCII#Character_set), you're going to see this unexpected sorting in your file browser. The solution is to zero-pad:

+++

```
01-first.md
02-second.md
03-third.md
...
10-tenth.md
11-eleventh.md
...
```

+++

A major advantage of Jupyter rather than `vim` is that it lets you quickly see this structure of your documents. In many documents you are working with confused headings (confused `#`, `##`, etc.) because you were working in vim and just wanted to write something down quickly. You can't see the big picture in `vim`.

+++

#### Fix numbering

+++

What's frustrating about JB is that you can't easily rename files without breaking links online. You really just need to get in the practice of using the redirect feature you've already looked into. Either that, or you have to let links be broken, or avoid providing direct links you might forget you provided. The last option two options aren't good in other ways though; you should publish quickly and regularly to get feedback. If you break links, you risk someone not giving you feedback when they want to look up a link you provided later.

+++

To continue to see the big picture, you're not going to be able to predict ahead of time all the documents you'll need to add and how they should be named. Renaming can be done in batch (when you're trying to see the big picture) to make it less painful.

+++

### Distinct shortnames

+++

When you start with a description in a `.md` file, you often end up in a situation (when many `.md` files are open) that you can't tell the difference between the documents based on Jupyter's collapse of the document name to a few characters at the top of the UI.

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
