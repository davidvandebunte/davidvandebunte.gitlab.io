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

# Flatten plan

Should you attempt to flatten this graph:

```bash
* c: baz: G2
* b: bar: G1
* a
```

Into this graph?

```bash
* b: bar: G1
| * d: baz: G2
|/
* a
```

Or attempt to flatten G1 into parallel tasks?

```bash
* g: merge: G1
|\
| * f: tac
* | e: tic
|/
* a
```

# Value

## Maximize work not done

[afa]: https://agileforall.com/new-to-agile-invest-in-good-user-stories/
[esgb]: https://books.google.com/books?id=3vGEcOfCkdwC&lpg=PA87&dq=sprintable+user+story&source=bl&ots=-BC9smev3k&sig=e80MdZj7HJN8DDPjj2O2E4gKuuI&hl=en&sa=X&output=reader&pg=GBS.PA88.w.18.0.48

See [New to agile? INVEST in good user stories – Agile for All][afa] and [Essential Scrum - Google
Books][esgb]. These resources make essentially the same point; when dependencies come into play it
may not be possible to implement a valuable story without implementing other much less valuable
stories.

From [Principles behind the Agile Manifesto](http://agilemanifesto.org/principles.html):

> Simplicity -- the art of maximizing the amount of work not done -- is essential.

% For example: You think it is necessary to get airflow working to test a change, but it’s possible
% by just restarting an existing cluster.

## Parallelization

You can get stories done faster (in parallel) when they are more independent. Typically you need to
do this when faster execution (on a team) is more important than efficiency. This is obviously less
desirable than not doing the work at all.

Parallelization naturally creates one focus for a team (sprint goal), which leads to knowledge
sharing and eases reviews. By parallelizing, you essentially created a sprint goal/theme in one
space even if you previously didn’t have enough independent stories on one topic.

# Cost

## Regularly fails

It's often not possible to remove dependencies; this task may be impossible. Don't force
parallelization if you feel confident it will actually lead to slower than serial (i.e.
single-person) execution.

## Adds inflexiblity

It can be expensive to flatten graphs when you are uncertain about how you will achieve a particular
goal. For example, it's often possible to have one developer "plan out" a solution (or even have the
team plan it out in a meeting) and then have several individuals implement part of the solution.
The plan (if everyone finished at the same time) would be to perform some kind of "octopus merge":

```bash
*-. e: G
|\ \
| | * d
| * | c
| |/
* / b
|/
* a
```

This approach is risky (and expensive) because it often requires the parties involved to negotiate
an interface before they know the details of their implementations. See also [Waterfall model](
https://en.wikipedia.org/wiki/Waterfall_model).
