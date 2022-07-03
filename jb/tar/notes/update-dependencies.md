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

# Update dependencies

Why update software dependencies? Don't forget that even docker has a dependency on the operating
system, and the operating system depends on the existence of the computer and its hardware, and the
hardware exists because it depends on people who manufactured it and put it there. A dependency
chain has no base case, except perhaps the big bang. The deeper you go the more stable dependencies
tend to get (the length of time they have been pinned) though this is not a guaranteed or reliable
rule.

[sc]: https://en.wikipedia.org/wiki/Supply_chain

These other dependencies may even update before you update your software. Your hardware is probably
pinned for 5-8 years, though it depends (unless you e.g. install more RAM, which won't break
anything). Your operating system is probably only pinned for a few weeks at a time; you need to be
able to regularly run `sudo apt upgrade` for security reasons and to keep the whole system up to
date in general. You don't pin system packages because you often need your system for many other
tasks besides some single application. Consider *all* dependencies, including humans, businesses,
hardware, operating systems, the docker version, etc. That is, try to look beyond the first tier of
your [Supply chain][sc]:

![Supply chain]: https://upload.wikimedia.org/wikipedia/commons/8/8a/Supply_and_demand_network_%28en%29.svg

The major advantage of libraries is that you do not need to write them yourself, effectively
reinventing the wheel. Reading library code is often more enjoyable than reading your own or your
team's code, because you know it is more generally useful outside the context of your current job or
project.

For all the same reasons, you probably want to upgrade regularly so you can work with the same open
source (more general) software out there on the internet. Going through an upgrade of your
dependencies often gives you an opportunity to learn about what is happening in the outside world
rather than chasing after your project's idiosyncratic needs.

More than ever, the software you need to perform a task is being created quickly in an open domain
on the internet. This is driven not only by an increasing number of software developers, but by the
simple fact that there has been more time for consumers to replace proprietry with open source
dependencies. Software developers should spend more and more time evaluating libraries and
incorporating them than writing their own version, assuming this trend continues.

Sitting on the old side of a library's stable version means you'll always be looking up the old
documentation online, because you know the "stable" version may be different than what you're using.
For example, here is a link to [PyTorch 1.3.1][py131]. It's often through accidentally reading the
stable documentation on a project that we discover there are features we want from it.

To some extent, this a question of whether to understand concepts first in your own words and then
in the words of others, or to understand the words of others and then incorporate them into your
own. The latter approach implies staying near the bleeding edge; the former implies staying in
stable territory longer (and avoiding excessive dependencies).

# Test

A library or package is upgraded to a newer version.

An upgrade is often triggered by the desire for an upgrade in a single library or package, even if
in the end it is often necessary to update a set of libraries at a time to find a new working
combination of dependencies. Alternatively, you can adopt a policy of regular updates that ensures
you have the latest version of a library before you need it.

## Stability

[blbc]: https://softwareengineering.stackexchange.com/questions/12401/be-liberal-in-what-you-accept-or-not
[rp]: https://en.wikipedia.org/wiki/Robustness_principle
[stb]: https://en.wikipedia.org/wiki/Stability

We use the term [Stability][stb] although it is somewhat ambiguous. Most people call an interface
"stable" if it doesn't change frequently e.g. no one switches the order of arguments. Most people
would call Ubuntu 20.04 more "stable" than Ubuntu 20.10 in 2021, even if they haven't used 20.10 and
don't know whether it works perfectly fine for everything they want to do. Many people would call an
application more "stable" if it pins more dependencies (artifacts) down.

We'll use the term "stable" to mean the fraction of tests we expect to pass for our particular
top-level application (or library) for a given dependency configurations, or the sum of the fraction
we expect to pass across a range of dependency configurations. Usually this is a belief statement,
that is, a prior given what we know about a particular library, only because it is too expensive to
check everything. For example, we assume a dependency labeled "stable" is best for our particular
application because it apparently passes the largest number of tests for those who evaluate it.

We want to use a library that doesn't change it's API so that our tests are already working with a
greater range of its versions. Pinning more dependencies down may not be the best way to make our
application more stable, since we may actually want to write our code to work with several different
versions of a dependency. See also:
- [Robustness principle][rp]
- [Be liberal in what you accept... or not? - SE][blbc]

# Estimate cost

[wssp]: https://pythonspeed.com/articles/switch-python-3.10/
[sm]: https://en.wikipedia.org/wiki/Software_maintenance
[bp]: https://en.wikipedia.org/wiki/Backporting

Let's say a team of maintainers of Library A have avoided all dependencies (excluding the standard
libraries). They hear about some Library B that does something they are already doing. The other
library has some great ideas and is essentially doing what the team is already doing in a better
way. Said another way, they are going in the wrong direction with their own code. They decide it's
OK to take this whole library as a dependency and refactor the code to depend on Library B.

A library maintainer knows that you can't test everything. You have many users, sometimes with
unique needs, and they aren't sharing all their tests with you. Often their tests are manual rather
than automatic. It's possible the library's automatic tests are known to be incomplete in important
areas. Typically a "bleeding edge" release identifies where your package is unstable, but this is a
fuzzy line. See also [When you should switch to Python 3.10][wssp].

The team also doesn't maintain old branches indefinitely even when a few users ask. It's not
valuable enough to backport bug fixes back years when most users are asking for features on newer
versions. See also [Software maintenance][sm] and [Backporting][bp].

Library B doesn't explicitly indicate which versions are maintenance, stable, bleeding edge. etc. so
you guess which version is the most stable. Let's plot the mean of these priors, assuming a library
with integer versions:

```{code-cell}
import matplotlib.pyplot as plt
import numpy as np

def stability_1d(versions, time_or_version):
    return np.maximum(1 - np.abs((versions - time_or_version) / 4), 0)

def plot_1d_stability(versions, lib_stab):
    fig, ax = plt.subplots(figsize=(10,10))
    ax.stem(versions, lib_stab)
    ax.set_xlim(-0.2, time_or_version + 1.2)
    ax.set_xlabel("Library B")
    ax.set_ylabel("Assumed Stability")

versions = np.arange(11)
time_or_version = 5
lib_stab = stability_1d(versions, time_or_version)
plot_1d_stability(versions, lib_stab)
```

You refactor your code, making a version of Library A work with what you believe is the highest
stability version of Library B. If you refactor everything at once, this version of Library A may be
a "bleeding edge" version for longer than normal. If you incrementally adopt the library, however,
you'll have to come in and out of focused work on the topic.

Let's say someone were to ask how hard it would be to backport your refactor to an older version of
your source code, perhaps to release a feature enabled by the library on an older branch. They're
also curious how hard it would be upgrade or downgrade Library B, in case a user already has an
older version installed.

We'll assume your own library also uses integer versions. In this plot, the alpha channel represents
the fraction of your tests you believe would pass if you merged your changes to use Library B's API,
for various versions of Library A and B. Assume a duck-typed language, where the whole build
wouldn't fail.

```{code-cell}
def stability_2d(versions, time_or_version):
    lib_stab_b = stability_1d(versions, time_or_version)
    lib_stab_a = stability_1d(versions, time_or_version + 1)
    return np.maximum(lib_stab_b[:, np.newaxis] + lib_stab_a[np.newaxis, :] - 1, 0)

def plot_stability(libs_stab, time_or_version):
    fig, ax = plt.subplots(figsize=(10,10))
    version_a, version_b = np.meshgrid(versions, versions)
    ax.scatter(version_a, version_b, alpha=libs_stab, color="black")
    ax.set_xlim(-0.2, time_or_version + 1.2)
    ax.set_ylim(-0.2, time_or_version + 1.2)
    ax.set_xlabel("Library A")
    ax.set_ylabel("Library B")

libs_stab = stability_2d(versions, time_or_version)
plot_stability(libs_stab, time_or_version)
```

Notice the update is applied to the "bleeding edge" version of Library A. If you had a dependency on
Library A, your ability to upgrade to the latest version of Library B would depend on how quickly
Library A was updating.

## Upgrade Strategies

There are (generally speaking) two update strategies: when the need arises, or on a regular
schedule.

### Intermittent Updates

Let's say the developers of Library A want to update their dependency on Library B, but it has been
so long that the API has changed in every source file where they used the previous version of the
library. Said another way, they have to do as much work as they did to adopt the library in the
first place.

This upgrade is necessarily a large (non-incremental) refactor because you can't depend on two
versions of a library at once. A major downside of non-incremental refactors is that the change is
likely to conflict with other developer's work on features in the library during the course of
development. Any feature you plan to release based on your upgrade will also take longer to get out
the door not only because the refactor took a long time, but because it was large and therefore also
introduces more risk. That is, the release will stay in the "bleeding edge" stage for longer.

```{code-cell}
time_or_version_v2 = time_or_version + 4
new_work = stability_2d(versions, time_or_version_v2)
libs_stab_v2 = np.maximum(libs_stab, new_work)

plot_stability(libs_stab_v2, time_or_version_v2)
```

One downside to this approach is that is often valuable to be able to say you depend on a range of
versions of a library rather than a single versions. Some dependency stating systems do not have a
way to say you can depend on e.g. v5 and v7 but not v6, but they do have a way to state you can
depend on a range of versions. If you never have a release on v6 and instead only run your tests on
it once, you may be missing issues it temporarily introduces.

Your users may complain you only support one version of the library at a time, rather than a range.
If they depend on the same library, they'll have to pin it to the exact same version that you use.
Even if they don't pin it at all but depend on another library that states a dependency on an
incompatible version of the library you depend on, their dependency resolver isn't going to be able
to find a solution that includes your library. If you state you can support v6 but in practice
didn't get enough time testing on it, they're going to file a defect when it doesn't work.

This approach effectively creates stable islands that your users must jump between during upgrades.
An advantage to this approach is that if there is a large space between islands you can avoid
dealing with any back and forth that happened between the islands. Since you aren't jumping on
either the bleeding edge or even the stable release of your dependency, you don't have to deal with
any temporary defects happening on either of those channels.

Companies that create versioned software generally require their users to jump between versions. For
example, there are multiple versions of Ubuntu (18.04, 20.04) that users must jump between for
upgrades, and less-stable islands between these islands (18.10, 19.04, 19.10). Unlike the situation
described above, Canonical developers are constantly working on keeping the distribution stable
between releases but only commit to keeping checkpoints that have been given more time (like 20.04)
stable.

### Regular Updates

Another strategy is to simply stay on the latest or near the latest version of a library, even if
you don't immediately need the features provided by it. This creates a stable tunnel rather than
islands:

```{code-cell}
import functools

def update_stab(libs_stab, time_or_version):
    new_work = stability_2d(versions, time_or_version)
    return np.maximum(libs_stab, new_work)

update_range = range(time_or_version, time_or_version + 4)
libs_stab_reg = functools.reduce(update_stab, update_range, libs_stab)

plot_stability(libs_stab_reg, time_or_version_v2)
```

A major advantage to this approach is that because you likely don't immediately need any features
for the library you are upgrading, you can file an issue and leave time for the developers of your
dependency to fix it before you upgrade. That is, check if the update is easy, and if it isn't say
something and go back to what you were doing.

## Dependency Resolvers

[dh]: https://en.wikipedia.org/wiki/Dependency_hell
[drdc]: https://unix.stackexchange.com/questions/141247/what-is-the-difference-between-a-recursive-dependency-check-and-a-reverse-depend

Whenever possible you should be using a dependency resolver rather than manual guess and check. See
for example [](./switch-to-conda.md) and [Dependency hell][dh] for examples of common tools.

It'll help in the course of the manual work associated with an upgrade to be able to quickly see
your dependency tree. Start with text-based solutions for both recursive and reverse dependency
checks. See also:
- [Difference Between A Recursive Dependency Check And A Reverse Dependency Check? - SE][drdc]
- [pipdeptree](https://github.com/naiquevin/pipdeptree)
- [apt-rdepends](https://askubuntu.com/a/447972/612216)

## Dependency Counts

[cod]: https://en.wikipedia.org/wiki/Curse_of_dimensionality
[ltlr]: https://pip.pypa.io/en/latest/topics/dependency-resolution/#loosen-your-top-level-requirements

The number of additional packages you are installing naturally increases the risk you will fail to
find a usable combination. It's likely the decrease in stability is faster than linear, however.
This is related to the [Curse of dimensionality][cod]; there's simply more "space" in larger
dimensions so that individual samples represent a smaller fraction of the total. Imagine taking the
2-dimensional graphs above to three dimensions.

One of the first steps you should take when you run into an issue is to understand your dependencies
and delete as many as possible. It's often easy to maintain a Linux installation on a machine for
years if you take time to delete dependencies when you run into a problem with `apt`.

If you can't remove dependencies, an understanding of them can help you pin them less tightly. This
gives your dependency resolver more "space" to find a working sample. See [Loosen your top-level
requirements][ltlr].

## Pin Dependencies

### Pin evenly

Try to pin all packages, or none of them. Version numbers of course always increase together, with
time. If you pin only one package and not another, one package may continue to get upgraded until
it's years apart from another (leading to failing tests). Even an existing stable "tunnel" between
two packages won't help with packages that have never been automatically or manually tested
together.

### Pin manually

If you pin many packages, you have to manually update all your pins. Tools like `pipenv` and
`conda-lock` can help, but they often simply upgrade you to the latest version of every dependency.
If that configuration doesn't work you have to manually edit your pinning, anyways. Still, these
tools can provide a starting point. These tools also can't intelligently set dependency ranges, etc.

Pinning may include freezing external dependencies, such as the source you depend on in a `.tar.gz`
file. Saving these artifacts as files is manual work as well, work you must do every you time you
upgrade them.

Generally speaking, the more reproducible your builds, the more work it is to upgrade them. You can
take on this cost through repeated manual work or through setting up an automatic process. It's
likely best to do the manual work a few times until it becomes clear you'll be doing the work
indefinitely.

#### Copy-paste pinning

To take a dependency on a library you can either install a package (with a pin) or copy and paste
only the source code you need from the library. If you only need one or a few functions from a
library, the latter solution may make more sense because you can avoid pulling in unnecessary
dependencies the rest of the package uses.

You can see every source file in your repository as a dependency. These dependencies are effectively
pinned; the pin is e.g. a git SHA. You can copy and paste whole libraries into your source tree as a
way of pinning your dependency on them, for example if you want to:
- Get some bleeding edge-feature, but not them all.
- Include one bug fix but not another.
- Use your own build system rather than the library maintainer's build system.
- Remove features that are causing dependency issues for you.

To copy and paste the source with modifications is to fork the project; you may want to let the
library maintainers see your work. Your next upgrade will continue to be difficult in your changes
never make it upstream.

Copy-paste pinning can be partially automated with a script that updates a git branch then copies
across git branches.

## Function-Level Dependencies

It's common to take a dependency on a library for one or two functions. If you don't copy and paste
in only the functions you need, stick to these functions you really care about rather than trying
out random functions only because they're available. If you do have an issue upgrading the
dependency in the future, perhaps because it is incompatible with another library you use, you can
change how you depend on fewer functions (e.g. by copying and pasting them in).

If you are writing a library yourself, stick to the part of your dependency's API that you expect to
change the least. In some cases, this may mean copying and pasting in new functions marked "alpha"
from the library that only combine other features from the library. If you do have a user that
depends on an older or newer version of the library than you've tested with, it will be more likely
that your code will work with their version.

## Security Upgrades

[semver]: https://semver.org/

You should upgrade dependencies that relate to security immediately. If a particular package is
using [Semantic Versioning][semver], you often want to leave the last digit unpinned. One exception
might be production environments that aren't exposed to users outside your company or team.

## Numerical Estimation

To produce a numerical estimate of the actual time it will take to perform an upgrade, use reference
class forecasting. That is, check how long it took to perform the last upgrade or the last few
upgrades. Typically you can find this information in version control.

How long it takes to perform an upgrade can vary widely however; sometimes you run into an issue and
sometimes it just works.
