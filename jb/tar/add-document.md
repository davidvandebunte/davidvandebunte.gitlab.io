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

# Add document

```{code-cell} ipython3
!pwd
```

Consider more descriptive document titles/names than just 7.53 (describe the actual problem). The printed version of this book has completely different numbering, for example, and it's only going to confuse people to have all this hard-coded numbering. No one has the numbers memorized; at best someone remembers what the chapter numbers correspond to.

Still, it's good to include the number in headings because the PDF still refers to specific numbers. If you retain these numbers, you'll be able to go from the PDF to an exercise-x-yy.md file quickly and be able to go from an exercise to the right subheading when you're viewing HTML. Don't you always to have to jump to the exercise in the PDF to get the associated section name first, however? If you're doing that anyways, you'll almost surely be able to narrow down what heading to click on in the HTML TOC based on the content of the question. Even the largest sections have only 10-15 questions. So perhaps the filename should be based on the exercise number, but not the title. In some sense, these exercise numbers are like a git SHA (an encoding/compression), but not really because the SHA doesn't change with a content change. You have to keep content roughly the same for this encoding to work.

If this numbering were to change, many references all over the PDF would change. So include *both* the exercise number and a short description. If the PDF ever changes, just remove all the numbering. It'd be faster to just move all the PDF content inline than to update everything. Hopefully the remaining short description will still be unique.

Removing the numbering is when you really create a "fork" rather than just commentary. You don't want to maintain a fork; you want others to be able to relate your comments to the original PDF quickly. You can expect that the original PDF won't have its numbering changed anytime soon, unless the authors upload something new to arxiv.org (which seems unlikely).

Part of the problem here is that you may also want to refer to examples, and those won't have a separate document. You can refer to the whole section, however, and just give a vague description of where to look in it.

Unfortunately URLs are permanent unless you want to create a bunch of redirects. If either you or the author adds more exercises, you'll need to only use the short (and unique) description or risk either clobbering an existing exercise or breaking someone's links. This approach also makes it easier to add new examples in JB (which obviously aren't going to get a number) that fit in with the rest.

```{code-cell} ipython3
doc_name = "exercise-7-64.md"
doc_path = "notes/ssc/" + doc_name
```

By copying this same document, we can be confident that all the versions in the header will be up-to-date:

```{code-cell} ipython3
# !cp add-document.md {doc_path}
```

```{code-cell} ipython3
doc_title = "Exercise 7.64"
```

```{code-cell} ipython3
# !sed -i "s/Add document/""{doc_title}""/g" {doc_path}
# !sed -i "s|add-document.md|""{doc_name}""|g" {doc_path}
```

+++ {"tags": ["hide-output"]}

See [Add document](add-document.md).

+++

The following will need to be cleaned up, but it's better than forgetting to add it:

```{code-cell} ipython3
# with open("_toc.yml", "a") as toc:
#     toc.write(f"- file: {doc_path}\n")
```

## What must we show?

+++

## What do we have?

+++

## Author's solution

+++

## Alternative answer
