---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.4
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Inkscape

+++

## Install

+++

Use the `ppa` to install Inkscape (see [Installing Inkscape - Inkscape Wiki](https://wiki.inkscape.org/wiki/Installing_Inkscape)). If you install the snap package the file browser (save dialog) won't be integrated with your system and therefore won't let you save a new file in e.g. a recently opened directory or create a new file in the same directory the file you are currently working with is saved in.

See [CONTRIBUTING.md · Inkscape · GitLab](https://gitlab.com/inkscape/inkscape/-/blob/master/CONTRIBUTING.md?ref_type=heads) to potentially add this to your monorepo and build it yourself. Why have the source to be able to read it? You'd like to understand the `preferences.xml` file better (the `dotf` changes seem random). Change into the source directory, run ctags, and per [Preferences subsystem](https://wiki.inkscape.org/wiki/index.php/Preferences_subsystem) find the `Preferences` class in `preferences.h`.

See also "Feature requests" in `draw.md`. You could implement these yourself, but why not get some feedback from others first?

+++

## Configuration

+++

Based on following [How to use the xdg-mime command](https://stackoverflow.com/questions/2060284/how-to-use-the-xdg-mime-command):

```bash
$ ls /usr/share/applications | grep -i inkscape
org.inkscape.Inkscape.desktop
```

+++

So run the command:

+++

```
xdg-mime default org.inkscape.Inkscape.desktop image/svg+xml
```

+++

## Search first

+++

Has anyone already drawn what you are intending to draw? If you're working in the open source world, with well-defined concepts, then you may already be able to find the visualization you're looking for online. Do an image search. How many people have wasted time reproducing something similar to the following drawing?

![x](https://upload.wikimedia.org/wikipedia/commons/d/d1/Taxonomy_of_Complex_Matrices.svg)

It looks like Google's image search is way better than DuckDuckGo's image search:
- [list of matrices normal diagonalizable unitary symmetric site:en.wikipedia.org at DuckDuckGo](https://duckduckgo.com/?q=list+of+matrices+normal+diagonalizable+unitary+symmetric+site%3Aen.wikipedia.org&atb=v310-1&iar=images&iax=images&ia=images)
- [list of matrices normal diagonalizable unitary symmetric site:en.wikipedia.org - Google Search](https://www.google.com/search?q=list+of+matrices+normal+diagonalizable+unitary+symmetric+site:en.wikipedia.org&hl=en&sa=X&ved=2ahUKEwio9dSa49D5AhU7kGoFHSPTD1cQBXoECAEQQw&biw=1368&bih=2419&udm=2)

Use the `!gi` bang for google image search.

+++

## Import PDFs

+++

The strange characters you get when importing mathematical symbols are explained in [(3) Cannot properly import PDF files containing math notations : Inkscape](https://www.reddit.com/r/Inkscape/comments/135icoy/cannot_properly_import_pdf_files_containing_math/). Should this be filed as a defect? It seems to have been unofficially filed in [Is there a way to import a PDF into Inkscape with characters from the unicode supplementary planes? - SO](https://stackoverflow.com/questions/76173402/is-there-a-way-to-import-a-pdf-into-inkscape-with-characters-from-the-unicode-su).

+++

## Export `.tex`

+++

For more on math in Inkscape, see [How I draw figures for my mathematical lecture notes using Inkscape | Gilles Castel](https://castel.dev/post/lecture-notes-2/).

+++

## Exchange objects

+++

You need three spaces to switch the position of two objects. This can be annoying in Inkscape, where you need to pick some random third location. See [How to swap two objects?](https://graphicdesign.stackexchange.com/a/145737/148275); this suggests assigning the keyboard shortcut ⊞+E (Super+E) to exchange objects.
