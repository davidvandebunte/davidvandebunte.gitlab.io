---
jupytext:
  cell_metadata_filter: -all
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

# Share to Wikimedia

+++

## Value

+++

In order of value.

+++

### High-quality content

+++

You're not allowed to put original work on Wikipedia, i.e. anything that you created yourself. That means that it's built completely from people reading other people's content and considering it valuable; a minimum of two people need to approve of all content (the creator and a person referencing the creator's work). It's this approach that likely makes everything higher quality.

If you can't find a solution that you've come up with on Wikipedia, then it's "original" research in your opinion. You need to publish it and then try to get someone else to reference it from Wikipedia so it isn't lost forever.

Still, this critically requires researchers to not inspect Wikipedia and reference it, to avoid circular references. A researcher should only make statements that can in theory be verified from earlier published papers. That is, Wikipedia articles should effectively be "research review" or "review of the research" articles written by experts in a field.

+++

Human knowledge increases systematically with some people being more exploratory, and some being more practical. It seems in general that research papers get conglomerated (or referenced) into other research papers but primarily textbooks (pedagogical material). You might say that "engineers" reference higher-level material like Wikipedia and textbooks, and "researchers" can write textbooks and papers. Engineers discover what's useful out of the material that researchers create (they find a use).

For example, the answers to many of the advanced textbook questions in e.g. [Visual Group Theory](https://bookstore.ams.org/clrm-32/) were once only available in research papers that would have been hard to find. Wikipedia references both research papers and textbooks but primarily textbooks.

+++

### Fast Feedback

+++

Let's say you post crappy content to Wikipedia. Expect to get feedback from the maintainers of the
page; at worst you need to revert what you added and you learned something (even how to edit on
Wikipedia).

+++

### Language

+++

The longer you spend in your own notes, the more tied you'll be to your own wording rather than
publicly available shared notes (like Wikipedia). Are you learning new words in your own notes? Are
you inventing words there is already another word for out there?

When you read Wikipedia, the theory others have developed often don't fit into your personal
theories. Should you develop personal theories in personal notes when you could be reading and
adding to theories others have developed? Don't give up when you see a theory you don't understand
in "their" shared notes.

+++

## Cost

+++

In order of cost.

+++

### Version Control

+++

When there are issues in a Wikipedia article, it's not easy to check history to gain confidence that
some content is not as it should be. Because Wikipedia preceded `git` (and likely many other version
control systems) you can't get the content in this form. It would be helpful for someone to provide
even a read-only version of Wikipedia as a git repository, or if the repository would be too large,
a way to export the history of a particular article to a git repository.

For workarounds, see:
- [Help:Page history - Wikipedia](https://en.wikipedia.org/wiki/Help:Page_history)
- [Wikipedia:WikiBlame - Wikipedia](https://en.wikipedia.org/wiki/Wikipedia:WikiBlame)
- [Suggestions for tracking a MediaWiki wiki with Git version control? - Webmasters Stack Exchange](
https://webmasters.stackexchange.com/questions/137722/)

In a real-world test of WikiBlame, finding the insertion took 22 seconds.

+++

### Age

+++

Wikipedia may become irrelevant as definitions change. Even worse, it may even prevent valuable changes to definitions. In a system with no one in charge, it's hard to be sure that it will be maintained.

For example, see [Dihedral group](https://en.wikipedia.org/wiki/Dihedral_group). There are two conventions for the subscript $D_n$ that conflict with each other in different areas of mathematics. It'd be good to standardize, but who could lead such an effort? You can pick a standard in your own thoughts and notes, to help. By picking a standard yourself, you effectively provide a vote to Wikipedia to move in a particular direction (if anyone ever takes your thoughts as authoritative or includes them in peer-reviewed material).

Some people claim the nLab is the "new way" and that many professional mathematicians work in this world. A point against this is that, unless history is lost (documentation is lost), then the non-mathematical articles on Wikipedia will dominate long-term and prevent other less general systems from replacing it in a particular area (until e.g. strong consensus on nLab is reached and makes it to Wikipedia). If the historical Wikipedia article on e.g. Euclid is always better than the nLab article (if there was one) then it's unlikely that Wikipedia will get a competitor that takes it out unless they effectively fork it. See [List of forks of Wikipedia](https://en.wikipedia.org/wiki/List_of_forks_of_Wikipedia). It does seem that all those forks (Russia and China) are associated with rewriting history.

+++

### Speed

+++

It's slower to type on Wikipedia (in a browser) than to type in plain text. However, developers could use [👻 GhostText](https://ghosttext.fregante.com/) if this ever became a serious concern.

+++

### Form

+++

Wikipedia is fundamentally oriented around nouns rather than verbs. If you prefer functional programming rather than an everything-is-a-noun language like Java, it's easier to think in verbs. In fact, a verb-oriented site (like this one) provides a good complement to that approach because you can assume links to verbs are internal to the site, and links to nouns are to Wikipedia.

When you contribute to a "Talk" page, you're essentially contributing to an "improve define x" article if you see the original article as a "define x" page (thinking in terms of verbs). Thinking in terms of "define x" can make it clear that many of these articles are similar to mathematical axioms. Where's the bottom, though?

% ## Additional Training Data
%
% Move notes to Wikipedia:
% - https://docs.google.com/document/d/1c3ep3G0SBcuibsEoruTfw_G8rZrg9W8v2j9GjvJY6Mk/edit#heading=h.xlo1uvlg7ouw
%
% See [Learn Mathematics From Wikipedia][lmfw].
%
% [lmfw]: ./learn-mathematics-from-wikipedia.md
