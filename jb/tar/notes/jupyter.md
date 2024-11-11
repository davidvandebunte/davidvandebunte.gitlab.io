---
jupytext:
  formats: md:myst
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

# Jupyter

+++

## Collapsing content

+++

Use the left and right arrows to hide sections of a long document.

+++

## LSP

+++

See the `pylsp` server (also known as [python-lsp/python-lsp-server](https://github.com/python-lsp/python-lsp-server)) (listed in [Language servers — Language Server Protocol integration for Jupyter[Lab]](https://jupyterlab-lsp.readthedocs.io/en/latest/Language%20Servers.html)). In practice this tool is annoying; it installs a bunch of linters which just add a ton of noise.

It also requires less than JupyterLab 4.0, which has useful features. Ironically, the release `jupyterlab-lsp 4.2.0` doesn't support JupyterLab 4.0 (despite the numbering). However, this has recently changed (with at least `jupyterlab-lsp 5.1.0`).

For JupyterLab 4.0+ LSP support, see [Language Server Protocol support — JupyterLab 4.3.0 documentation](https://jupyterlab.readthedocs.io/en/latest/user/lsp.html#settings). In settings this is labeled "Experimental" suggesting it may be worth waiting for.
