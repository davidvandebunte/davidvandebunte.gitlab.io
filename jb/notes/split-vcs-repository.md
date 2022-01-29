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

# Split VCS Repository

## Test

A new version control repository exists, with code/notes split out from another repository. Implicit
in starting a new project is making a decision whether to create a new repository or work in a new
directory or on a branch of the most closely-related repository.

Examples of the most closely-related (default) repository:
- Your personal-notes
- Your shared-notes
- A book's associated repository (VGT, SR2, LYHGG)
- Your coworker's repository

Any of your personal or public repositories:
- https://gitlab.com/davidvandebunte
- https://github.com/davidvandebunte

If you feel uncertain about what your non-split options are, consider:
- `!glab`
- `!gh`

## Value

In general, this approach encourages independence and isolation.

### Dependency Management

[ca]: ./containerize-application.md

See the reasons you split docker images in [Containerize Application][ca]; but splitting images does
not strictly require splitting repositories. Conversely, it makes little sense to split repositories
for code that has nearly zero special dependencies. For example:
- Plain text English notes
- bash
- git
- python (without packages)

### Simpler CI/CD

Ironically, not not splitting repositories (i.e. splitting repositories) saves you time by letting
you work with "standard" CI/CD processes. Said another way, splitting repositories (taking the
manyrepo/polyrepo approach) allows for simpler tools.

Your CI/CD pipeline can run on every commit. If you have multiple docker images in a single
repository, you'll be unnecessarily rebuilding all of them every time a change is made in any
directory, regardless of whether it's relevant. Is this so bad, though? It's not hard to limit
builds to a directory in .gitlab-ci.yml files (or likely any other CI/CD language). You don't really
mind building too much, either, because external services can affect the stability of builds.

### Speed

[mpdn]: https://medium.com/@mattklein123/monorepos-please-dont-e9a279be011b
[mvm]: https://chengl.com/multirepo-vs-monorepo/

Search. You can expect `git grep` and `git log -G` to slow down as the size of a repository
increases. What if you limit your search to a directory, though?

Pulls. How long does it take to pull the repository to a new developer's machine?

See also "VCS Scalability" in [Monorepos: Please don’t!][mpdn], "Tooling" in [Multirepo vs
Monorepo][mvm], and "Scalability Challenges" in `!w Monorepo`.

### Publication

[sn]: ./share-notes.md

See [Share Notes][sn]. We often need to split across the public/private divide. You can do this
without splitting repositories; instead fork the public repository and create a private "backup"
repository to push to.

The downside is if you are regularly using your fork/branch, you'll be constantly rebasing that code
on the upstream until it is merged. To reduce this pain, you can add one of these tags to the front
of commits you want to keep on your branch:
- `wip:`
- `temp:`
- `exp:`
- `hack:`

Alternatively, write commits you know you will need to move to the public branch using whatever
standard you use on the public branch (e.g. starting with a filename).

## Cost

[aom]: https://danluu.com/monorepo/

In general, this approach encourages shared responsibility and centralization.

### Search

For example, so you can search only your personal notes repo for some thought you had. A web search
is much less effective and flexible than `git grep` (even if you know which site to search).

### Modularization Premium

[smb]: https://martinfowler.com/articles/microservice-trade-offs.html#boundaries
[mp]: https://martinfowler.com/bliki/MicroservicePremium.html
[mf]: https://martinfowler.com/bliki/MonolithFirst.html

Said another way, it's difficult to iterate quickly on a set of manyrepo (cost to feedback speed).

In general, modularizing code has a cost. Even refactoring code takes time, and you shouldn't do it
earlier than you need to. Slightly larger costs include even defining a simple API (such as an
evaluation docker's API) and creating version numbers you manually increment.

The modularization premium may include setting up some kind of "metarepo" (e.g. an orchestration
repo).

See also [Strong Module Boundaries][smb] and its discussions of [MonolithFirst][mf]. A split of
repositories often means a split into separate microservices. Consider the [MicroservicePremium][mp]
specifically as well.

### Cross-Project CI/CD

[mmm]: https://notes.burke.libbey.me/metarepo/

See "Tooling" in [Monorepo, Manyrepo, Metarepo][mmm] and [Advantages of monorepos][aom]. An
unmentioned advantage is the manyrepo approach potentially lets you use only git rather than the
cross-project options offered by GitLab and GitHub (tying you to their platforms).

### Simpler Reorganization

See "Simplified organization" in [Advantages of monorepos][aom]. When you want to reorganize docker
boundaries or "projects" in general you can do so without going to GitLab or GitHub. Consider the
value in organizing notes.

### Forced Collaboration

[mpd]: https://medium.com/@adamhjk/monorepo-please-do-3657e08a4b70

See [Monorepo: please do!][mpd].

### Simpler Retrospective

If you only have one or a few repos, it's much easier to review all the commits that one person or
the team did in a sprint.

## Training Data

### Wikipedia

Wikipedia is a great example of how you can avoid splitting your thoughts (it's similar to a
monorepo of notes) and still work on the public side of the line; the downside is how it can be hard
to contribute to because it has so many "conceptual" dependencies.
