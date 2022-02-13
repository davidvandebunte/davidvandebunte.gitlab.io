---
title: "Convert to plain text"
date: 2019-05-16
tags: ["notes"]
---

# Test

We spend a dramatic portion of our life writing and committing content to a particular format.
Modern writers can take notes in Microsoft Word, Google Docs, and other capable WYSIWYG editors. Why
convert (or take) notes in plain text (e.g. CommonMark, reStructuredText) instead?

# Value

[1]: https://stackoverflow.com/editing-help
[2]: https://www.ericholscher.com/blog/2016/mar/15/dont-use-markdown-for-technical-docs/

It's easy to publish CommonMark notes. Static site generators almost always accept CommonMark. Stack
overflow content is CommonMark; see [CommonMark Editing Help - Stack Overflow][1].

Documentation can live next to the associated code (change in lock step). See [Why You Shouldn’t Use
“Markdown” for Documentation][2]; consider a plain text besides CommonMark.

Writers can stay on their keyboard (save time). CommonMark was designed to be readable as plain
text. In some scenarios, this lets writers enter "flow" faster. Google Docs are hard to use from the
keyboard in the browser (Vimium can do little to help, but only so much). VIM allows faster
navigation. It’s painful to move stuff around in Google Docs, such as shifting example code over.
Another example is copying and pasting code into a list without getting a bunch of bullet points:
- def showNotification(notification: Notification): String = {
- notification match {
- case Email(email, title) =>
- …

Inkscape SVGs are easy to edit inline in CommonMark. It is a major pain to edit an SVG inline in
Google Docs.

Search notes faster from the command line (with git). Plain text history with git. Resolve merge
conflicts in a standard way. Review changes with "git diff" before pushing them (to catch accidental
changes).

You can more easily convert plain text formats with tools like pandoc and nbconvert.

Plain text notes convert to programming language comments faster.

You can not close your browser (and your laptop) when Google Docs is syncing. You are forced to
"Stay on Page" for as long as it needs, which can sometimes be minutes.

Linux does not have good WYSIWYG equation editors. Microsoft Word isn’t available on Ubuntu (a
decent program for writing equations).

# Cost

You’re forced to wrap at 80 or 100 characters manually. What command line tools do this well
automatically? In VIM, use `gq`. See [word wrap - vim command to restructure/force text to 80
columns](
https://stackoverflow.com/a/3033455/622049).

You don’t need two screens for both the plain text and rendered versions of content.

A major strengh of Google Docs is natural linking between documents. If plain text notes are
rendered on the public web, it's easy to link to them. Links in the other direction aren't allowed
or the public content becomes much less useful.

A solution is to do a global search for files before a rename and manually update all the links to
it. An upside to this solution is that organizers can tell which documents link to the document
being renamed (not possible with Google Docs). When is it ever OK to delete a Google Doc?.

There's a larger barrier to entry for plain text notes; unlike a wiki page or Google document, users
may need to fork a repository to make edits.

# Additional Training Data

- https://docs.google.com/document/d/1DpOP6-CuIn5OQVholgF91vI4l2Fs8FJqs7qGREqW7aI/edit
