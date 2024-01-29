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

Still, it's good to include the number in headings because the PDF still refers to specific numbers. If this numbering were to change, many references all over the PDF would change. So include *both* the exercise number and a short description. If the PDF ever changes, just remove all the numbering. It'd be faster to just move all the PDF content inline than to update everything. Hopefully the remaining short description will still be unique.

Unfortunately URLs are permanent unless you want to create a bunch of redirects. If either you or the author adds more exercises, you'll need to only use the short (and unique) description or risk either clobbering an existing exercise or breaking someone's links. This approach also makes it easier to add new examples in JB (which obviously aren't going to get a number) that fit in with the rest.

```{code-cell} ipython3
# Use `sed` or `python` to search/replace this in the copied file?
doc_title = "Add document"
```

+++ {"tags": ["hide-output"]}

See also [Add document](add-document.md).

```{code-cell} ipython3
doc_name = "notes/ssc/exercise-7-55.md"
```

By copying this same document, we can be confident that all the versions in the header will be up-to-date:

```{code-cell} ipython3
!cp add-document.md {doc_name}
```

The following will need to be cleaned up, but it's better than forgetting to add it:

```{code-cell} ipython3
with open("_toc.yml", "a") as toc:
    toc.write(f"- file: {doc_name}")
```

## What must we show?

+++

## What do we have?
