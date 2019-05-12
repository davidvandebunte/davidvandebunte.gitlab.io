---
title: "Decision: Should you take notes in plain text?"
date: 2019-05-05T09:57:59-05:00
draft: true
---

# Advantages
1. Documentation can live next to the associated code (you can change both in lock step).
1. You can more easily publish Markdown notes.
    - Stack overflow content is Markdown: https://stackoverflow.com/editing-help
    - That is, by writing in Markdown you'll learn the syntax and more easily be able to contribute to Stack Overflow.
1. It’s easier to use open source tools or convert your notes to open source.
    - Search notes faster, completely from the command line (with git).
    - Inkscape SVGs are easier to edit inline in Markdown. To edit an SVG inline in Google Docs, you
      must pull down the SVG, modify it, take a screenshot to put inline as an image, and re-upload it.
1. You can stay on your keyboard (faster).
    - Google Docs are hard to use from the keyboard in the browser (vimium can do little to help, but only
      so much). Locally you can navigate in VIM, which is a little faster. It’s
      very annoying to use Google documents from the keyboard (pretty much impossible).
     - It’s painful to move stuff around in Google documents, such as shifting example code over. Another
       example is copying and pasting code into a list without getting a bunch of bullet points (you cut down the
       length of this example):
         - def showNotification(notification: Notification): String = {
         -  notification match {
         -    case Email(email, title, _) =>
         - …
1. Resolve merge conflicts more easily.
1. Plain text notes convert to programming language comments faster (if you don't want an .md file next to the code).
1. Plaintext history with git.
1. You can more easily convert plain text formats with tools like these:
    - https://pandoc.org/
    - https://nbconvert.readthedocs.io/en/latest/
1. Microsoft word isn’t available on Ubuntu for creating equations (the best program I've used for equations);
   there are good plaintext equivalents that I personally need to learn.

# Disadvantages
1. How would you link between documents?
    - It should be perfectly possible to link from Google Docs to the public web. You can't really go in
      the other direction or your public content becomes much less useful.
        - It should be perfectly possible to private plain text notes to Google Docs and back (if you wanted to do this).
    - The upside here is you’d be forced to organize your notes before converting them to plain text public notes. For other
      reasons this is necessary anyways to create public notes.
    - You can always do a global search for the file you are moving and just manually update all the links to it; this really shouldn’t be too difficult.
        - A huge upside here is that you could tell which documents link to the document you are moving. Right now
          you have no idea what links to a particular google document (whether it is ever OK to delete one).
    - Why not avoid directories and just have all your notes at the top level? You never organize your Google Docs anymore.
      This is a lot more like Wikipedia (no directories of articles).
1. WYSIWYG editors are sometimes easier to work with; you don’t need two screens for both the plain text and
   rendered versions of the content. Markdown was designed to be readable as plain text, though (just check the
   rendering at the end).
1. You’re forced to wrap at 100 lines manually. Can you make VIM do this automatically?
1. Spell check isn’t going to be the same in plain text (though it's easy to ignore this feedback in Google Docs).

