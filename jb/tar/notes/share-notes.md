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

# Share notes

[sc]: ./share-comment.md
[stse]: ./share-to-stack-exchange.md
[stw]: ./share-to-wikimedia.md
[stb]: ./share-to-blog.md
[stjh]: ./share-to-jupyter-html.md
[stjb]: ./share-to-jupyter-book.md
[stjira]: ./share-to-jira.md
[rd]: ./redact.md

Generalizes:
- [Share Comment][sc]
- [Share to Stack Exchange][stse]
- [Share to Wikimedia][stw]
- [Share to Blog][stb]
% - [Share to Jupyter HTML][stjh]
% - [Share to Jupyter Book][stjb]
% - [Share to JIRA][stjira]

## Test

Share personal content to a (more) public medium. There are multiple levels of public. For example,
you can publish to:
- Your team
- Your company (inner source)
- The internet (open source)

How open should you be with your thoughts?

![x](./more-public-domain.svg)

## Value

In order of value.

### Correction

[ts]: https://stackoverflow.com/a/6556453/622049
[ref]: https://unix.stackexchange.com/questions/688195/
[oss]: https://en.wikipedia.org/wiki/Open-source_software

More people are surprised by what they learn from sharing software designs before implementing. Why
not your thoughts? See a clear example in the comments on [Template specialization for types
providing a traits class - Stack Overflow][ts]. The feedback you get online can be incredibly fast,
and continue to improve your design for days beyond your initial query; see for example [Reset ext4
filesystem without changing the filesystem UUID - Unix & Linux Stack Exchange][ref].

At best, strangers online are motivated to fix your mental functions for the same reason you're
motivated to fix theirs; so we all have a single source of correct (or at least consistent) notes.
If they aren't motivated by the greater good, lots of reputation on Stack Overflow is easy to link
to from a resume and is often taken by employers as a good proxy for a candidate's ability. As part
of a set of other proxies like academic degrees and interview performance, this is not unreasonable.

You want to make incremental comments on other people's work (in separate repos, if need be) for the
same reason that you don't want to maintain your own FasterRCNN implementation; because publishing
lets you avoid maintaining the notes/code yourself. See comments on privatization vs. open-sourcing
in [Open-source software][oss]. Said another way, you want to "open-source" your thoughts to reduce
the maintenance burden associated with them (e.g. organizing them, resolving conflicts while merging
upstream thoughts). The same happens when a big company like Google or Facebook takes a library or
tool they're maintaining (PyTorch, Kubernetes) and open sources it.

Open sourcing works because you (as an individual, or outsider) suddenly gain "ownership" in the
tool that is now in the public domain. That is, you can use Wikipedia as a place to store your own
notes immediately next to the notes of others (notes you want to read because they are also useful).
That is, as long as you understand the notes you are merging with, you can improve the "code" or
"notes" with your own notes and take partial ownership. Then you only have a single source of
truth/notes as an individual, benefiting you.

Sharing your notes and drawings doesn't guarantee you won't still be in charge of them; others may
only take a part of the work. In some cases, you may not even need to share editable content (e.g.
share a PDF) to get feedback.

Prefer the term "share" to publicize and publish. The terms publicize and publish assume you have
existing content you need to convert between formats to publish. Much of the time, your thoughts can
go straight into one of the mediums listed above (interpret "share notes" as sharing mental notes,
i.e. sharing your thoughts). Live openly and you can avoid conversions.

Why are so many organizations based around teams? Presumably, peer review by smart people produces
better results faster.

For the special case of working through a textbook sharing your answers lets others self-grade their
answers against yours. This lets you self-grade against theirs if they also publish or comment on
your answers.

#### Correction by Computers

[aei]: https://docs.gitlab.com/ee/ci/yaml/#artifactsexpire_in
[odaz]: https://azure.microsoft.com/en-us/services/open-datasets/#overview
[odam]: https://aws.amazon.com/opendata/

A special case of the benefits of publishing for correction is the free computing resources you get
from e.g. GitLab. If you're willing to commit to a particular CI/CD system (like GitLab) every
commit you publish will get computer feedback. On the other hand, these free CI/CD machines are
usually small (e.g. 2 GB of RAM and 1 CPU). In practice, you often have to provide or buy your
computing resources for faster feedback.

It's more rare, but if you have a large amount of data you can sometimes get more space for it if
you're willing to make it public. In GitLab you can store job artifacts for [30 days][aei] (not
seeing a size limit). At least two cloud providers offer to store significant open source datasets
for free:
- [Open Datasets | Microsoft Azure][odaz]
- [Open Data on AWS][odam]

### Credit

Open source contributions look good on a resume. Have you ever searched for someone on LinkedIn,
StackOverflow, or elsewhere before interviewing them? In fact, a blog is like a resume. Is what
you're posting better than nothing?

To get anything done on a team you must share your thoughts. You can work directly in your
employer's systems, but then you may lose notes when you move companies. Run a lunch and learn to
raise your own visibility or your code's visibility. At the least, share your opinions with your
individual coworkers, spouse, or kids. To "publish" code is to release it to production, in the
context of your job (continuous deployment).

### Politick

[tb]: https://en.wikipedia.org/wiki/Textbook

Politicians and celebrities have no privacy. What they get in exchange is the ability to get others
to value their opinion. Similarly, scientists who publish widely are affecting the language that is
used to describe findings, and are determining which hypotheses are most likely to be confirmed or
denied next. If you think of "work" as collecting data to confirm or deny a hypothesis, then
prominent researchers are determining the tasks other researchers work on.

Said in a more pessimistic way, publishing can be a way to push your opinions or desires on others
in the same way spam email or advertising does. Are all the questions at the end of a [Textbook][tb]
worth answering? Is the whole book worth reading?

If a term is popular, then you can essentially define it by how it's used. What shows up when you
search DuckDuckGo? Its algorithm for what a word "means" is likely based on (among other things)
some predefined authority for websites and a regularly updated count of links to them (backlinks).
Similarly, traditional academic references (with only e.g. an author and date) are a popularity
contest as well, though the date of publication is likely given more weight. See for example
[](./define-generative-model.md).

It's likely this is what drives the unique names used for so many deep learning models. It's easier
to get a name popular if you use something more unique, it's likely to be more memorable, and it's
less likely to be reused in the namespace. If Shannon would have used the generic term "uncertainty"
instead of "entropy" for [Entropy (information theory)](
https://en.wikipedia.org/wiki/Entropy_(information_theory)) the idea may not have taken off.

### Web Linking

Do you want to link to your notes from e.g. Google Calendar reminders? If you publish them you can
read them on your phone rather than needing to be at your computer to start rereading your own
work. That is, you may often want a public link.

If you publish quickly (e.g. straight from your thoughts), you'll be able to browse your notes on
your phone on a trip, for example. What do you look up on your phone when you've got a little free
time? What if you reviewed your last blog post? This keeps you in focused work, better than a
long-term recommended reading list you or some other site maintain.

### Simplified Searching

Prefer sharing to personal notes so you have one place to search: the web. One way to think about
sharing notes is as organizing notes by deleting them from your private repositories if they don't
need to be private. In a similar way, reading anything is effectively making it your notes, taking
"notes" to mean natural language you can use to quickly recall a concept. If you define note
efficiency (pedagogical efficiency) as the speed at which the notes help you recall a concept, these
notes will be less efficient only if you use different internal language than the average English
speaker.

### Transparency

[stow]: https://en.wikipedia.org/wiki/Security_through_obscurity#Obscurity_in_architecture_vs._technique

Obscurity is a limited way to achieve personal and communal security; see [Security through
obscurity][stow]. For the advantages of security through obscurity, see [Redact][rd].

Who are you already sharing with? Do you take notes in Google Docs? Public notes are better than
notes you share with Google (in Docs) because other major companies (Amazon, Apple) will have access
to the same information. If you're backing up your notes in the cloud, you're likely sharing them
with someone.

Sharing spreads power out. It’s unlikely you’ll share an idea and have it suddenly lead to huge
changes; it would have to get spread and experimented with first. By that point everyone would have
the idea and have a chance to catch up. It's also difficult to keep an idea hidden long. The more
people we have who understand a particular concept, the less likely we are to have one person or
group of people monopolize power.

### Organization

To publish notes is to organize notes. Organized notes are easy to publish, and published notes must
already be organized. Considering others is considering yourself. See similar thoughts in
[](./organize-notes.md).

An imaginary reader helps you delete notes you don't know you should delete. For example, you
often need to copy your thoughts to an SO answer to remove a bunch of documentation or links that
are obvious (that you could get from a quick web search). You naturally don't want to be too verbose
in a text conversation with certain (distractable) people, because they may not respond if you send
them a wall of text. To get a response, you naturally cut down your content. You don't read your own
notes for the same reason: too much text you don't have in working memory. If you want to read your
own notes (get any value out of them) you should cut them down, most effectively by sharing them.

If people (including yourself) are bored sick by your articles then they're not going to get read.
That is, sometimes the "value" in the article is not only the changes it makes to your mental model,
etc. but a laugh in the present.

Why share your notes and ideas? You remember when you share something, much better than if you
simply write it down. You want to be able to perform many tasks without needing to refer to your
notes, or only refer them to lightly. Your notes need to be organized at some minimal level for you
to be able to remember what notes you need to refer to perform tasks.

A PhD is one way to force yourself to organize a large amount of notes in a coherent way. Either
that, or a book. If you're motivated by others or a personal commitment to organize notes then it is
more likely to happen.

## Cost

In order of cost.

### [Redact][rd]

### [Select License](./select-license.md)

### Avoid indirection

On stack exchange sites, a "link" answer is generally not encouraged. On Wikipedia, you should not
be referencing your own content. In Confluence (another wiki) users often aren't prepared to follow
a link to an unfamiliar format. Many users want to see results directly in JIRA rather than
following yet another link.

In all these scenarios, use the visual editor of the tool (Wikipedia, Confluence, JIRA, etc.) to
copy and paste in content from Jupyter Book. Surprisingly, this works quite well if you know
beforehand to limit the richness of your content.

In this context to make the copy/paste safer you'll generally want to use Unicode rather than math
mode, include SVGs regularly rather than with the `<object>` tag, and keep extra minor edits only at
the top or bottom of the pasted content.

For the specific case of web links, put them *both* (the one pointing to the source, and the one
pointing to the copy) at the bottom of the content to avoid distracting from it. If you read all
your own notes so you'll see you need to worry about a double link even if it's at the bottom.

Ideally you can even avoid double linking; as long as you remember the source (your own notes) there
may be no need for a link back that you might potentially break and may have little extra detail
(it's a form of compression to skip this link). In fact, if you don't link back you could "doubly"
publish to the alternative medium (e.g. JIRA) before publishing to your own format (your own format
would be the second to be published). There's really no source or copy when you are copy once you're
done double publishing; and it's only when you put up the second copy that you need to do linking on
both ends. If you were to add a third copy, then you might want to think about a master (to avoid
two links out in each, or 6x linking).

Still, it can be worth linking if there's a lot of content or you want to advertise the source. Are
there enough details in the link to make it worth anyone digging into? Is whoever you are publishing
to the type to go digging into them?

If you want to double publish/link, you can't push up a comment saying that you doubly published
before you have actually done so (because you need to first publish the content to html to link to
it, and you may forget to do so). Instead first publish to html, then only later (once the content
is up) do the actual double publish. Finally, add a link in your own notes about the double publish
(so it will show up in a separate commit). It's a three step process, but is manageable if you need
to do it.

% TODO: improve-share-notes.md
