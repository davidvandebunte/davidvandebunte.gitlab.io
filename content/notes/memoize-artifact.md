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

# Memoize artifact

[mz]: https://en.wikipedia.org/wiki/Memoization

Generalizes:
- [](./memoize-docker-image.md)

## Test

[asd]: https://en.wikipedia.org/wiki/Artifact_(software_development)
[cc]: https://en.wikipedia.org/wiki/Cache_(computing)
[stb]: https://en.wikipedia.org/wiki/Stability
[ccad]: https://docs.bazel.build/versions/main/build-ref.html#actual_and_declared_dependencies

An "artifact" is stored in a persistent storage medium to avoid recomputation later. To analogize to
the human experience, results are written down.

We use the term "artifact" here partially because it's so ill-defined and therefore easy to redefine
(see the terrible article [Artifact (software development)][asd]). We also use the term because it's
so common, such as in the "Artifactory" tool. In GitLab, you can think of all the items under
"Packages and Registries" (such as the container registry) as places to store artifacts.

Some examples of artifacts are Docker images, libraries, packages, .pth files, .html files (manually
or non-manually constructed), C++ files, and .py files, and test results (e.g. pass/fail boolean).
In the language of Bazel, the equivalent concept is a target (see [Core concepts - Actual and
declared dependencies][ccad]). You could take any English text (i.e. notes) as artifacts that e.g.
may depend on concepts from other English text.

We prefer the word [Memoization][mz] to [Caching][cc] because the former is a special case of the
latter, and we specifically intend to refer to the latter, more special case. That is, we won't
consider data locality or spatial locality here, only whether to build a data artifact at all.

This article avoids the term [Stability][stb] in most places, but see [](./update-dependencies.md)
for an attempt at a definition.

### Recursive artifacts

[boot]: https://en.wikipedia.org/wiki/Bootstrapping
[shc]: https://en.wikipedia.org/wiki/Self-hosting_(compilers)

The idea of artifacts is closely tied to the concept of [Bootstrapping][boot]. Examples of recursive
artifacts are [Self-hosting compilers][shc] and operating systems (it's likely the Ubuntu 20.04
developers were using an earlier version of Ubuntu). You can use a docker-in-docker image to build a
docker image with `docker-py` installed, then use that image to build further docker images.

Some of these recursive artifacts are recursive environments. At each level of a bootstrap, you
create a new environment, then enter it and use it to get something done (such as building an
environment). Imagine if you were sent back in time to an ancient civilization. Even if you could
speak their language, would all your future knowledge help them? You were living in a totally
different environment, and most of what you know is for your future world. You aren't going to be
able to teach them everything you know about computers, because there won't be one to demo anything
on.

Said another way, recursive environments are a recursive function-building process, where every
function is a function to build an environment, then enter it and call a new function in a
multi-level stack. Because the function is more than software (e.g. hardware for some compilers), or
because you don't keep track of every part of the function (e.g. other tools used to compile as part
of an old OS), or simply because parts of the process are manual, you can easily lose
reproducibility in this situation. Like libraries however, recursive environments are often
backwards compatible.

We sometimes call "bootstrapping" the process of building up an improved dataset by training a model
on some small dataset, running inference on a larger dataset, having annotators clean the larger
dataset up, and training the model again on the larger dataset. The recursive artifact in this case
is *both* the model and the datasets.

## Value

[cd]: https://en.wikipedia.org/wiki/Concept_drift

Saving an artifact creates a more efficient environment for optimization, assuming the artifact
represents reality (roughly speaking, is reproducible). Consider the common case in machine learning
where a model (e.g. a `pth` file) is saved to disk and run through a variety of tests. It would be
silly to retrain the model before every change to the evaluation code. In particular, an artifact
allows for much faster feedback (in this case, on the evaluation code).

Consider how this last paragraph relates to [Bazel](https://bazel.build/)'s joke:

> {Fast, Correct} - Choose two

When the artifact is a dataset, we refer to the problem as [Concept drift][cd]. When the artifact is
a package or library (e.g. specified in a Dockerfile) the package or library we get is by default
the latest. That is, if you specify a `pandas` dependency without pinning it to a version it's like
using many other English words; concepts can drift.

### Reproducibility

[ac]: https://en.wikipedia.org/wiki/Approximate_computing
[bv]: https://docs.bazel.build/versions/main/bazel-vision.html
[rpro]: https://en.wikipedia.org/wiki/Reproducibility
[det]: https://en.wikipedia.org/wiki/Determinism

These concepts are closely tied to those of [Reproducibility][rpro]. Bazel in fact defines "Correct"
to mean reproducible. That is, if running a clean build does not produce the same result as an
incremental build (a build based on a cache) then the code is not correct. See the [Bazel vision -
Bazel main][bv]. We'll use Correct (with a capital C) to capture this concept of perfect
reproducibility.

Perfect reproducibility is of course practically-speaking impossible, which is why we have concepts
like probability. It's easy for theoretically-minded people to forget that reproducible results
require hardware, which exists in the real world. Even theoretically you need to specify your
hardware; the code you wrote on a machine with 32 GB of RAM isn't going to run on GitLab's free
runners with 2 GB or RAM. Beyond that, hardware lives in the real world and is affected by cosmic
rays and the power turning off. To get more reproducible results often means to collect more
information about an experiment; what are you forgetting to record? We rely on probability when
certain inputs are too expensive to record.

Our belief that we can ultimately get a perfectly reproducible result is related to the idea that
there is no such thing as probability and [Determinism][det]. See also [Approximate computing][ac].

So what do we need to get closer to perfect reproducibility? We need to pin package versions,
specify random seeds, record the time we pulled data from sensors, etc. All of this takes
engineering time. In many cases, we won't be able to achieve "Correct" without tremendous amounts of
work and will instead shoot for some theoretical goal.

#### Estimation

How do you put a numerical estimate on the value of reproducibility? The first step is to estimate
how long your custom software product will run, and then how often it will need to be upgraded (when
reproducibility is most critical).

For companies running web services in a production environment where they've promised 99.999%
reliability to their customers, the value in reproducibility is high. These companies also need to
be able to upgrade quickly, in particular in response to security issues. Google built Bazel based
on these values.

Consider instead a research environment. The data product (e.g. a publication) may only need to be
reproduced a few times if the research produces negative results (in this case, a publication
indicating negative results).

### Fast

Developers need fast feedback, on local systems, and from remote systems.

A major advantage of specifying how to reproduce an artifact is that you effectively get information
on how to reproduce or change a *chain* of artifacts. Build systems like Make and Bazel can use this
information to only rebuild what is necessary (or likely to be necessary, if your rules aren't
perfect). Not only is it hard for humans to remember these chains of dependencies, they otherwise
need to manually run through every step in them.

Dependency resolution tools like `apt`, `conda` or `pip` can use this information to help you rework
what pre-built artifacts you depend on, essentially "building" a new top-level artifact.

An important side effect is that you can use significantly fewer computing resources. For example,
even if the test you care about will run in 10 minutes, you may be wasting an hour of computing
resources for a totally unrelated test that runs when you push to CI. Not only is this wasteful, you
may not get automated feedback if you [](./push-for-feedback) because e.g. GitLab won't push a
pass/fail notification to Slack until the hour-long test has passed.

#### Estimation

How do you put a numerical estimate on the value of fast feedback? First, how much feedback is there
for the computer to give? If developers have written many tests, it will take a long time to provide
feedback if the build system has no record of what tests need to be rerun.

Consider a production and research environment again. In a production environment, fast feedback
will be critical to fast releases of software to customers, and the code will be well-tested. In a
research environment, customers may only get updates infrequently, and there may be no tests yet.

## Cost

### Learn Reusable Tools

[faqb]: https://bazel.build/faq.html
[fbbr]: https://nicolovaligi.com/articles/faster-bazel-remote-caching-benchmark/
[flru]: https://docs.python.org/3/library/functools.html#functools.lru_cache
[make]: https://en.wikipedia.org/wiki/Make_(software)
[nabc]: https://nicolovaligi.com/articles/benchmark-bazel-build-cpp/
[wibse]: https://softwareengineering.stackexchange.com/questions/319359/

If you don't specify a date and manually save a file, it's like specifying a date indirectly, the
file timestamp. The date you started the process that created the file is always sometime before the
file's timestamp. File systems have included this information for longer than many of us have been
alive because it's so important to reproducibility. The excellent tool [Make][make] relies on these
timestamps to help us get closer to our dream of Correct.

Unfortunately Make has shortcomings. You'll struggle to get it to work efficiently in a CI/CD
environment because it relies on timestamps, and CI builds are often run on new machines. Said
another way, running a CI build is like setting up a new machine for a new developer, and a new
developer always has to start with a clean build with Make. See also:
- [Why incremental builds in "make" don't use hashing algorithms? - SE][wibse]
- [Benchmarking the Bazel build system on real-life C++][nabc]
- [Faster Bazel builds with remote caching: a benchmark][fbbr]

Google tried to make Make work for as long as possible when it built Bazel; see [FAQ - Bazel][faqb].
Like many algorithms that do [Memoization][mz], Bazel does this by hashing the inputs to the
functions that create artifacts (e.g. [`functools.lru_cache`][flru]). To learn Bazel is effectively
to learn how to record more of what you relied on to build an artifact.

Some tools automatically record the dependency tree. In PyTorch, Theano, Tensorflow, etc. you can
see the net activations as artifacts, and the backpropagation graph as a record of how all the
artifacts connect.

### Update Dependencies

A reproducible build, by definition, requires that cached artifacts remain "Correct" for an
indefinite amount of time. This implies e.g. pinning package versions or copying and pasting
(forking) code, both of which freeze a particular package at a version in the past. By disallowing
concept drift, we effectively freeze ourselves at some point in the past.

#### Estimation

[pspp]: https://pythonspeed.com/articles/when-update-dependencies/

As part of any decision about how much to memoize and how much to let float (unpinned), you should
estimate the cost of upgrades. For example, let's say in your particular domain you estimate you
will want to upgrade to the latest versions of packages only rarely, but it's critical that you be
able to reproduce results in e.g. a production environment. You will probably want to update your
dependencies less frequently (e.g. once a month), but invest more time in the upgrade to make sure
you will continue to be able to develop in the environment you are creating (e.g. bug fixing, in a
production environment).

```{code-cell}
import pint
ureg = pint.UnitRegistry()

# All of these are estimates, despite the lack of uncertainties
lifetime = 2 * ureg.year
upgrade_freq = 1 * ureg.month
upgrade_cost = 1 * ureg.day

total_cost = upgrade_cost * (lifetime / upgrade_freq).to_reduced_units()
print(total_cost)
```

Companies like Canonical and Microsoft build versioned software that effectively depends on a huge
number of independently evolving software packages. In their business model, they know how long they
will need to support a product and may actually do the calculation above (with extremely uncertain
numbers).

Companies like Google, Facebook, and Amazon provide web services without explicit versioning.
Assuming we want the cost per month:

```{code-cell}
upgrade_freq = 1 * ureg.month
upgrade_cost = 1 * ureg.day

total_cost = upgrade_cost / upgrade_freq
print(total_cost)
```

How long an individual upgrade will take depends on the quality of your tools, how much of the
process you've automated, and how often you upgrade, among other things. To estimate `upgrade_cost`,
see [](./update-dependencies.md).

See also:
- [Push and pull: when and why to update your dependencies][pspp]
