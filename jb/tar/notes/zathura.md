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

# Zathura

+++

A `zathura.md` file is like commentary on the source code of the program, or more precisely the associated git repository. You should similarly have an `inkscape.md` and a `firefox.md` just like you have a `terrestrial-drive-alignment.md`. These can be a whole "part" of your Jupyter book.

+++

## Configuration

+++

Based on [zathura](https://wiki.archlinux.org/title/Zathura), as part of machine setup you should run:

```
xdg-mime default org.pwmt.zathura.desktop application/pdf
```

Then you can use `xdg-open` to open a PDF from the command line, and if you click on a PDF in a file browser it will open in zathura.

+++

## Prefer bookmarks to quickmarks

+++

Only because they persist through restarts. See:
- [Can I retain quickmarks (not bookmarks) in Zathura after closing?](https://unix.stackexchange.com/questions/502829/can-i-retain-quickmarks-not-bookmarks-in-zathura-after-closing/535887#535887)
- [How to get list of all bookmarks in Zathura](https://superuser.com/questions/1266882/how-to-get-list-of-all-bookmarks-in-zathura/1606512#1606512) (or `bl` for short)
- [Where does Zathura store bookmarks in Linux?](https://superuser.com/questions/1310114/where-does-zathura-store-bookmarks-in-linux)

+++

## Export pages to SVG

+++

To import a particular page of a PDF into SVG, take the page number from the top of your zathura instance (e.g. `225/339`). The page number that zathura displays when you have dual pages up is the page number of the page in *middle* (strangely) of your screen, on the left. Then run something along the lines of:

```
$ fzf
gitlab/applied-category-theory/seven-sketches/7Sketches.pdf
$ pdfjam gitlab/applied-category-theory/seven-sketches/7Sketches.pdf 223-228 -o /tmp/out.pdf
$ inkscape /tmp/out.pdf
```

+++

See also [split - How can I extract a page range / a part of a PDF? - Ask Ubuntu](https://askubuntu.com/a/952025/612216). An alternative is to use "PDF arranger" to get the pages you need, then convert the entirety of the new file to SVG.

+++

## Recent files

+++

The list of recent files in `zathura` is based on your current directory (where you ran `zathura &`).
