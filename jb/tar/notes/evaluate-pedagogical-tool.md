---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.5
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Evaluate pedagogical tool

A score for a learning resource relative to similar resources on the same topic. The score for a
particular learning resource should theoretically be based on the slope of the [Learning curve](
https://en.wikipedia.org/wiki/Learning_curve) for the set of actions you want to able to do after
finishing learning. A *steeper* slope would theoretically produce a higher score.

# Value

We often make massive time investments in learning from a particular topic; a textbook can take a
year to cover in detail. If we can learn more efficiently, we can do more efficiently. Most of the
time, we are evaluating learning resources to help us figure out how to answer a question.

Writing and organizing your own notes depends on an understanding of how to teach effectively, even
if you are only communicating with your future self.

# Cost

## Prefer a single language

The major advantage of a textbook is that the author can define terms early on they use later in
their material. In exchange for a major time investment, you get a (perhaps temporary) language to
communicate in.

Read the table of contents. What percent of it are you going to read? It helps to read the whole
book, because often authors make connections between different parts of the book. For example,
they'll promise to discuss something in a later chapter, or refer back to older chapters in
explaining a new concept. If you don't finish a book, you’ll invest a lot of time loading the first
half of the book into memory and then throw it away when you leave the book.

Still, don't feel you need to finish any textbook despite the major sunk cost you put into reading a
large fraction of it; be flexible and constantly reevaluate the decision of whether to finish. You
may discover while reading it (sometimes, before you start) a better learning resource or a better
learning direction. Delete notes aggressively; delete the book aggressively (by not reading it).

Your own notes are a major learning resource that is already in a language you clearly understand. A
textbook is the author's notes. In your own notes you link between articles; the author of a
traditional textbook is forced to link between sections.

Wikipedia is a major learning resource where, most of the time, the language is standardized across
articles as the community of authors follows links and makes connections.

In summary, the major advantage and disadvantage of a paper book is that you feel like you need to
read it once you start it. You sometimes don't organize your notes while you're working on it,
because you need to stay on focus within the author's world (rather than your own) to answer his
questions efficiently. You’re afraid to get e.g. a topology book because you might focus too much on
it.

### Scale evaluation

Scale your evaluation to the size of the learning resource. The number of words in a book is a good
measure of how long it will take to read; you may also want to fudge your estimate based on an
understanding of how "heavy" or new the material is.

Is there really any difference between an article and a book, besides that the latter is longer? You
should be able to evaluate many static pedagogical resources the same way, just considering length
as one factor.

## Prefer newer tools

Web articles usually include a date of publication. All else being equal (e.g. whether the source is
primary or not), a somewhat reliable heuristic is that newer articles are better than older ones.
Newer textbooks can refer to newer research. When was the last time the source code was edited?

Learning from the original paper is going to be more valuable if you need to reference it; it's
better to reference the original than secondary sources because secondary sources add unnecessary
indirection and potentially bias. On Wikipedia it's still acceptable to cite secondary sources
however; see [Wikipedia:No original research - Primary, secondary, and tertiary sources](
https://en.wikipedia.org/wiki/Wikipedia:No_original_research#Primary,_secondary_and_tertiary_sources).

## Prefer primary sources

This usually conflicts with a preference for newer tools, but regardless, an old primary resource is
often-not-always better than a nearly as old non-primary resource.

## Prefer multi-modal resources

For a textbook, can you get an ebook version? Can you find a DRM-free ebook? Can you get a pdf? Can
you get an audiobook version? If there are technical terms in the book, you’ll learn to pronounce
them.

[ega]: https://docs.google.com/document/d/1pvN9a1-wyGytIcureLBqm8zXgtQNCSZ297pZitAce4c/edit#
[ep]: https://docs.google.com/document/d/1GV8x2JL4cAvQuIycWjeyDYOPq-m6eVmXK2yviz_Y-qE/edit#heading=h.ptg6aneohrgk

% See also:
% - [Decision: Would you rather buy an eBook from Google than Amazon?][ega]
% - [Decision: Do you prefer eBooks to paper?][ep]
% - [HT: Audiobooks](https://docs.google.com/document/d/1rGyAcdxsoP2eNWfooMjNQxmpUhxuHl1fcqjOh0Zu2aA/edit#)

Is there associated code? Should you start learning from the documentation or the code? You usually
want to start from the documentation; the natural language documentation (usually) prefers the big
picture view. Natural language is also often easier to parse since you spend the majority of your
time in it (you almost always think in natural language). Natural language is significantly more
common than artificial languages and more backwards-compatible; it will likely remain the same after
programming languages are gone. Consider how quickly [Statistical Rethinking | Richard McElreath](
https://xcelab.net/rm/statistical-rethinking/) has gone through different programming languages.

Still, you may move to the code earlier or initially if you're more familiar with the programming
language. Many concepts cannot be described or cannot be described precisely in natural language.

Prefer Jupyter notebooks, which avoid the [Split attention effect](
https://en.wikipedia.org/wiki/Split_attention_effect) when it comes to code and natural language.
That is, for at least these two modalities the content is kept together. Tools like [Sphinx](
https://www.sphinx-doc.org/en/master/) are another way to keep these modalities together.

[bda3]: http://www.stat.columbia.edu/~gelman/book/

Examples of the regular conflict between newer and primary resources:
- Jonathan Hui’s articles on RCNN models and the Faster-RCNN paper
- [Statistical Rethinking](./sr2-review.md) and [Bayesian Data Analysis][bda3]

Often you need to learn from new, old, primary, and non-primary sources, making up for bad
explanations in one with better explanations in another.

Can you get an offline (paper) version? To keep your own bookshelf empty, can you get it from a
nearby library when you need the paper copy? It’s likely you'll use it on a camping trip or
vacation, then never touch it again. If you want the paper version again, you can get it from a
library again. Once you finish reading a textbook, you rarely refer to anything but an electronic
version again.

See also:
- [Modality effect](https://en.wikipedia.org/wiki/Modality_effect)
- [Multi-media](https://en.wikipedia.org/wiki/Multimedia)

## Migrate to a single learning focus

How can you directly apply what you learn from this book? Prefer to focus on similar concepts at
work that you are studying at home. Prefer to listen to the same audiobook you are reading, and read
articles on the same topic the textbook you are studying is on. If you're doing it right, you should
see yourself taking notes in one area of your own notes at a time.

Most learning tasks should actually start from a TODo in your own notes, so you can expand (e.g.
record answers to practice questions) or clean up your own notes as you work. What question are you
answering? Will you be able to easily integrate the book’s mental functions into your own personal
notes (mental functions)? Be aware of the [Expertise reversal effect](
https://en.wikipedia.org/wiki/Expertise_reversal_effect); if you are an expert already then reduced
guidance often results in better performance than well-guided instruction. In general, if you pick
too simple a tool to learn from you'll also likely struggle to build knowledge efficiently for the
simple reason that you'll have to skim for material you don't know, or you'll relearn the same
material in new words without ever connecting it to the words you already have (mental duplication).

## Prefer interactive tools

Can you find a video or browser game that covers the topic? Don't assume you can't for advanced
topics; web search for e.g. "topology game" (don't forget to test the plural in web searches, i.e.
"games") and you'll find some interactive material. If you (physically) know someone else interested
in the topic, you could buy a board game.

Is the material editable? Can you or the author easily fix issues you find? Ask the author a
question. Does he/she respond at all? You almost always generate errata while reading a book.
Collect these to provide public feedback to the author. Does the author ignore your suggestions, add
them to a master errata, or provide a fixed version of the PDF or eBook you're reading?

When you are a significant way through a book, contact the author with any other artifacts (e.g.
chapter solutions) you generate so he can link to them. Why not help others? You may even get
feedback from him/her.

### Prefer copyleft licenses

If the material comes with source code, it's usually editable. However, you could copy and paste any
web article (in e.g. natural language) and edit it. Is the content also have a permissive or
copyleft license? If not, you won't be able to share your modifications and will need to worry about
fair use if you e.g. need to reproduce part of the material to review it.

It can be hard to tell if a website is based on open-source content. For example, even open source
content based sites can require you to log in (though they are less likely to do so). [Dive into
Deep Learning](https://d2l.ai/) looks like it isn't at first, but you can see GitHub links at the
top.

Look for "Terms" or "About" at the bottom of the page, most of the time. You can search for
"opyright" in the Terms for information on how e.g. they own everything you submit to their
platform. Read the terms before "signing" (in this case by reading the contents of the page, i.e.
creating a mental link). Another option is to web search for their content license, i.e. "quora
content license" for the website Quora.

If you can't tell in one minute, block them. Clearly they're not advertising their license, which
they would if it was focused on their user.

## Prefer free tools

It's difficult to refer to e.g. books behind a paywall even if you have access (these systems often
have poor support for e.g. linking to a specific page). Your own readers will surely be blocked.

Books are often an example of the fallacy that the more you pay, the better a product you are
getting. Because you can't inspect a book completely without buying it (assuming it is not free),
it's often impossible to evaluate whether the book is good until after you've purchased it (unless
someone writes a review). Who says online resources aren’t as good as books? You tend to not read
long web articles because you think you should focus on focused learning in a book instead, but this
is almost surely not the right decision in many cases. Free resources are almost surely getting more
feedback from more people, simply because they're free.

Language that has been tested by a large number of people is common; not standard. That is, it
occurs in the mental networks of a large number of people because it has proved useful in the minds
of a large number of people. For example, [Koine Greek](https://en.wikipedia.org/wiki/Koine_Greek)
was well-tested because so many people spoke it. This is related to the [The Cathedral and the
Bazaar](https://en.wikipedia.org/wiki/The_Cathedral_and_the_Bazaar) argument; there are more people
in the bazaar because it's free to get in. Open source code tends to be well-tested, if not in
automatic tests then in tests by who really matters, people (and who can also provide some value
feedback/tests).

## Check for known issues

Is there a public place for other readers or consumers to provide feedback? How many issues are
reported on the code examples, and are they being resolved? See e.g. [Issues ·
rmcelreath/rethinking](https://github.com/rmcelreath/rethinking/issues). Is there an errata for
published material? If there's no errata, it's likely there are a lot of issues. See
[](./sr2-review.md).

## Ask for an independent evaluation

Who do you trust to tell you about the quality of a learning resource? A sharp coworker? Your
professors? What shows up you web search for reviews? You can also find lower quality book reviews
on e.g. Amazon.

## Well-tested instructions

Ideally, you would not like to be the first person reading through instructional material. If you
are the first person reading through it, you can expect to discover typos, errors, and other issues.
See [](./sr2-review.md).

How do you test, in general, that instructional material has been "peer-reviewed" by others? When we
want to test that natural language is peer-reviewed, we test it. That is, peer-reviewed material is
human-tested. If we ported (translated) the concept to an artificial programming language, then we
can use computers to test as well.

If language is both computer-tested and human-tested, this will cause it to be minimal (not vice
versa, for sure). If you've ever worked in a company's proprietary codebase you've probably
discovered large amounts of code that no one is using e.g. because only one person has ever seen the
code (you're probably the second).

This is a problem, because there's a conflict between minimizing material and providing a thorough
explanation. Everyone comes to new material with a different background; what unwritten dependencies
does the material have? This is related to the "single language" requirement; a long textbook lets
the author state all their dependencies. The more dependencies we cut out, the less useful material
is for learning.

There's a difference between learning dependencies (e.g. you need a middle school rather than an
undergraduate education) and programming language dependencies, though. The first is a dependency
between recursively formed mental states (what you know, versus what you will know after following
the learning instructions) and the second is a dependency on what you need to perform a task you
already know how to do.

Learning is not the process of doing some task, it is the process of learning to do some task. It
literally involves the formation of new language; you should be acquiring new words when you learn
(new definitions i.e. new words built on old words). It's more analogous to writing new code, in a
series of commits in your version control system, that rely on old code.

Said another way, your "peers" when you are learning are those who came to the same material without
about the same level of background as you did when you arrived it. If every student came to the
teacher with the same background, having taken the same e.g. courses, then teaching is easier. Of
course, universities do this efficiently by providing a list of prerequisities and fitting students
into a [Cohort (educational group)](https://en.wikipedia.org/wiki/Cohort_(educational_group)). The
more diverse a class, the more "conflict resolution" the teacher will have to do to get them to the
same place in the end.

In this analogy, instructional material is like a branch in version control history, but a more
robust version of it. You test the material (branch) on students. Teachers provide the continuity
between the continuity between versions of the branch that are applied on different students,
because no two students come to the material with the exact same mental state. Teachers here are
analogous to a developer who constantly takes the same code commit and rebases it on the same parent
commit (or different parent commits) over and over. If you enjoy rebasing your code to make your
reviewer's life easier, perhaps you should be a teacher (better, don't get so far ahead of your
reviewers, or just fork the code i.e. create a long-lived branch).

For someone reading through a branch, certain series of commits are going to be better to help them
understand how to go from what they know (commit A) to the end of the new branch. Said another way,
instructional materials don't throw away the history of how to get from A to Z; and because they are
tested on many students, a single person (the teacher) has a good idea of what series of commits are
best for bringing the student from mental model A to mental model Z.

In the same way, your own notes are a record of how to go from what you know you know (what you
effectively have memorized) to a place that you've reached once but may not always be at. No one
repeats what they already know they know in their notes; you don't retell your future self how to do
elementary algebra because you assume he has not forgotten it. Said another way, your own notes only
have the dependencies you need to get from e.g. T to Z. If you're already at T, then you don't need
someone to explain commits A to T.

Should technical instructors provide not only source code, but a history of how to edit source code
to their students? Students would effectively "review" a long branch of commits, alternating between
new problems and the solutions to them (worked examples).

You don't want to maintain too many of your own notes for similar reasons to why you don't want to
maintain your own software; your explanation of how to remember how to go from T to Z is probably
not as good as an instructor's explanation and would require you writing a significant amount of
material that essentially duplicates what your instructor wrote to teach you (drawings, etc.).
Better, rely on others to provide materials that you take from your memorized state to the state
you've been to once in the past, only appending your own notes on the instructor's notes. To try to
forget only what you want to forget, you should also aggressively clean up your notes and throw away
instructional material you aren't going to forget. For more details, see [](./organize-notes.md).

To summarize, you're looking for instructional material provided by someone in education, who has
spent time actively working with modern students (similar to yourself) and seeing their struggles.

% Additional training data

[dbwa]: https://docs.google.com/document/d/1EYSFyGvPETr4wHeYOoEI1N_x1VMexlebklI790rxnPU/edit#

% [Decision: Do you prefer books to web articles?][dbwa]
