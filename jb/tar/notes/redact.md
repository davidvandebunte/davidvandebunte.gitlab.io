---
jupytext:
  cell_metadata_filter: -all
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

# Redact

+++

## Personal data

+++

[pd]: https://en.wikipedia.org/wiki/Personal_data
[dra]: https://en.wikipedia.org/wiki/Data_re-identification
[da]: https://en.wikipedia.org/wiki/Data_anonymization

Protect [Personal data][pd], to reduce the effectiveness of the [Data re-identification][dra]
algorithms targeting you on the dark web. If they can identify you as an individual, they can start
to build up a network of information about you in order to hack one of your accounts. Remove the
names of individuals you work with or know when telling a story, as if you had to follow HIPAA; see
also [Data anonymization][da].

Your username is one example of PII. If someone has your username on one website and your password
on that website, they can use it to try to get into your account on other websites (if your username
is always the same). PII is any information that can identify, contact, or locate a single person.
Would you share tax documents publicly?

Many websites still rely on a security model that depends on security questions. Someone can go onto
Facebook and find out the answers to these typical questions: In what city was your high school?
What was your childhood nickname?

+++

## Jargon

+++

[mtau]: https://en.wikipedia.org/wiki/Wikipedia:Make_technical_articles_understandable

You sometimes need to dumb down or generalize articles to a wider audience. That is, you need to
explain to grandmother when you would otherwise only have to have explained to:
1. Yourself
1. A coworker
1. An engineer from another company in your same field
1. A technical person
1. Your sister
1. Your dad

Keep technical levels high so you don't make your notes more verbose and therefore less useful to
you. See also [Wikipedia: Make technical articles understandable][mtau].

+++

## Team data

+++

[stow]: https://en.wikipedia.org/wiki/Security_through_obscurity#Obscurity_in_architecture_vs._technique
[oac]: https://openai.com/charter/

NIST recommends security through obscurity as one layer of a valid security tool; see [Security
through obscurity][stow]. Iran doesn’t know how to build a nuclear bomb because they lack technical
knowledge, among other reasons. The [OpenAI Charter][oac] includes a similar sentiment:
> We are committed to providing public goods that help society navigate the path to AGI. Today this
> includes publishing most of our AI research, but we expect that safety and security concerns will
> reduce our traditional publishing in the future, while increasing the importance of sharing
> safety, policy, and standards research.

Many companies have open source rules that don’t even allow you to use their hardware on open source
projects (unless it’s just a bug fix, for example). Most companies take security of their IP
seriously (you've been through several training sessions) and you should as well.

From a company’s perspective, ideas don’t have to be ground-breaking (or often even novel) to be
worth keeping private. The IP system (patents) was intended to protect against competition, while
still encouraging sharing.

+++

### Broken links (and dependencies)

+++

[lc]: https://en.wikipedia.org/wiki/Linker_%28computing%29

Think about dependendencies between projects of notes similar to dependencies between code projects.
You don't want a circular dependency between e.g. two itertools projects or you wouldn't be able to
load either. Really, this is a technical issue. If you could load both projects into memory at once
(knowing they had circular dependencies) and then link them, you could call back and forth between
them. In practice you have to load one into memory, then link to the other (compiling and linking).
Even if this is a technical limitation, it helps to see linking on the web analogously to linking
code (see [Linker (computing)][lc]).

You have a fundamental conflict between the need to link in one direction for privacy, and in
another direction for the sake of recording training examples (equivalently, what a process or
action specializes). For the sake of privacy, you need links to only point from private to work to
public notes (or directly from private to public notes). Many work actions are specializations of
more general actions; you'd like to be able to link back from these general actions to the training
data (work actions) that helped you learn how to perform them. That is, a link to what the action
specializes. Unfortunately, for privacy reasons, you need to throw these links away.

It makes less sense to invest in "specializes" links for this reason, because at some point you're
going to have to throw them away. It's typically more general actions that make it into public notes
first. Obviously you hide all your hidden motivations for why you now consider these general actions
important; some of them may go back to your childhood. If general actions are what go into public
notes first, and they tend to go in incrementally, then you're going to have to throw away the
"specializes" links anyways as you move the notes unless you move large chunks over at once. This
suggests you should only add "specializes" links in the context of your public notes, only to avoid
temporary work. You'll always have the other half of the double link (generalizes and specializes)
if you really need to build some kind of map.

Code is only going to link in the generalizes direction. It'd be really nice for library authors to
understand who is using their code (they try), but this is often nearly impossible to figure out. If
your notes eventually become code, you'll also have to drop the "specializes" half of the double
link.

This is similar to the process of depersonalization that any company must go through with all the
data it collects and uses. Lots of personal data needs to be thrown away in order to come up with
something more generally useful, that is, a tool that isn't a security risk to a person or a
company.

+++

## TODo

+++

Search for "TODo" in your notes to confirm you aren't publishing incomplete work. That final o is
lowercase so this doesn't show up.

% TODO: https://docs.google.com/document/d/1a8qLqYxei1aF0biI2fxe_xcnUWZiC2bm59C5PMtSWTw/edit
