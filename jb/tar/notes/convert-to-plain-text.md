---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.2
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Convert to plain text

## Test

We spend a dramatic portion of our life writing and committing content to a particular format.
Modern writers can take notes in Microsoft Word, Google Docs, and other capable WYSIWYG editors. Why
convert (or take) notes in plain text (e.g. CommonMark, reStructuredText) instead?

## Value

### In-line documentation

Documentation can live next to the associated code (change in lock step). Plain text notes convert
to programming language comments faster. See [Why You Shouldn’t Use "Markdown" for
Documentation][2]; consider a plain text besides CommonMark.

Search notes faster from the command line (with git). Plain text history with git. Resolve merge
conflicts in a standard way. Review changes with "git diff" before pushing them (to catch accidental
changes). You can more easily convert plain text formats with tools like pandoc and nbconvert.

### Markdown

[1]: https://stackoverflow.com/editing-help
[2]: https://www.ericholscher.com/blog/2016/mar/15/dont-use-markdown-for-technical-docs/

It's easy to publish CommonMark notes. Static site generators almost always accept CommonMark. Stack
overflow content is CommonMark; see [CommonMark Editing Help - Stack Overflow][1].

Inkscape SVGs are easy to edit inline in CommonMark and other plain text formats. It is a major pain
to edit an SVG inline in other formats.

### Google Docs

Writers can stay on their keyboard (save time). CommonMark was designed to be readable as plain
text. In some scenarios, this lets writers enter "flow" faster. Google Docs are hard to use from the
keyboard in the browser (Vimium can do little to help, but only so much). VIM allows faster
navigation. It’s painful to move stuff around in Google Docs, such as shifting example code over.
Another example is copying and pasting code into a list without getting a bunch of bullet points:
- def showNotification(notification: Notification): String = {
- notification match {
- case Email(email, title) =>
- …

Google Docs can be slow. You can not close your browser (and your laptop) when Google Docs is
syncing. You are forced to "Stay on Page" for as long as it needs, which can sometimes be minutes.

## Cost

You’re forced to wrap at 80 or 100 characters manually. What command line tools do this well
automatically? In VIM, use `gq`. See [word wrap - vim command to restructure/force text to 80
columns](
https://stackoverflow.com/a/3033455/622049).

Linux does not have good WYSIWYG equation editors. Microsoft Word isn’t available on Ubuntu (a
decent program for writing equations). You don’t need two screens for both the plain text and
rendered versions of content.

### Barrier to entry

There's a larger barrier to entry for plain text notes; unlike a wiki page or Google document, users
may need to fork a repository to make edits. However, see [Web IDE | GitLab](
https://docs.gitlab.com/ee/user/project/web_ide/). Tools like this one let a user edit e.g. .md
files directly in their browser without doing anything on the command line (even creating and
merging commits) as if it was a wiki page. This tool is especially valuable for e.g. testing the
features supported by [GitLab Flavored Markdown (GLFM) | GitLab](
https://docs.gitlab.com/ee/user/markdown.html). GitHub provides nearly the same feature for testing
GHFM.

GitLab's Web IDE lets you take notes on even e.g. a tablet. It's critical to be using a build system
like `bazel` if you're using these tools to avoid long builds for nothing but documentation changes.

### Edit in browser

See [Help:Text editor support - Wikipedia](https://en.wikipedia.org/wiki/Help:Text_editor_support)
for tips on setting up various editors to work on Wikipedia articles. This article suggests
"GhostText" as a general solution for editing online content in plain text, though this solution
requires a server running in your text editor.

% TODO: Link to `share-to-wikimedia.md`?

### Convert emails to plain text

All notes are TODo, even emails-to-self. They are all *begging* to be read. For example, if they're
statements, then you can treat them as a reminder TODo or training data. If they're large tasks, you
can treat them as a standard TODo (though even reading the story is a reminder of the details of a
potential improvement). If they're a question, then there's implied value in being able to answer
the question (effectively a standard TODo).

Don't spend significant time "copying" notes (i.e. not copying but actually reading and improving
email notes on their way to plain text). Instead, copy the notes as quickly as possible (get them in
version control and plain text). Only then clean them up (i.e. read them in detail) and consider an
[](./organize-notes.md) action. Whenever possible, just copy and paste!

% ## Additional Training Data

% - https://docs.google.com/document/d/1DpOP6-CuIn5OQVholgF91vI4l2Fs8FJqs7qGREqW7aI/edit
