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
!date
```

+++ {"tags": ["hide-output"]}

Try to avoid `exercise-7-21.md` (based on numbers), but being lazy isn't all bad (see [Prefer descriptive headings](notes/prefer-descriptive-headings.md)).

```{code-cell} ipython3
doc_name = "vgt/07-products-and-quotients.md"
doc_path = "notes/" + doc_name
doc_title = "7 Products and quotients"
```

By copying this same document, we can be confident that all the versions in the header will be up-to-date. The change to `.gitlab-ci.yml` will need to be cleaned up, but it's better than forgetting to add it:

```{code-cell} ipython3
# !cp add-document.md {doc_path}
# !sed -i "s/Add document/""{doc_title}""/g" {doc_path}
# !sed -i "s|add-document.md|""{doc_name}""|g" {doc_path}
# with open("_toc.yml", "a") as toc:
#     toc.write(f"- file: {doc_path}\n")
```

+++ {"tags": ["hide-output"]}

See [Add document](add-document.md).

+++

## What must we show?

+++

## What do we have?

+++

## Author's solution

+++

## Alternative answer
