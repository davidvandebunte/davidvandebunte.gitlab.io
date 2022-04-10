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

[ml]: https://en.wikipedia.org/wiki/Machine_learning
[ul]: https://en.wikipedia.org/wiki/Unsupervised_learning
[rl]: https://en.wikipedia.org/wiki/Reinforcement_learning
[sl]: https://en.wikipedia.org/wiki/Supervised_learning

# Define "Learn"

## Test

[learn]: https://en.wiktionary.org/wiki/learn
[learning]: https://en.wikipedia.org/wiki/Learning
[mla]: https://en.wikipedia.org/wiki/Machine_learning#Approaches

What does it mean to [learn][learn] (see also [Learning][learning])?

As a subgoal, we'd like to more precisely define what the article [Reinforcement learning][rl] calls
the three "paradigms" of machine learning (in the first paragraph):
- [Reinforcement learning][rl]
- [Supervised learning][sl]
- [Unsupervised learning][ul]

See also [Machine learning - Approaches][mla] for another attempt to relate the three paradigms.

## Value

It's a popular word. If "some machines" can learn (see [Machine Learning][ml]) should we learn to
think like them, or they like us? Although this blog typically lets Wikipedia define terms, we will
deviate from that default slightly in this case to allow for precision and "decompress" the
definition a bit.

## Cost

### Learn from data

If you take "experience" as a synonym for "data" then this definition of machine learning (from
[Machine Learning][ml]) implies "learn from data" is insufficient to define machine learning
(lacking a definition of `T` and `P`):
> A computer program is said to learn from experience `E` with respect to some class of tasks `T`
> and performance measure `P` if its performance at tasks in `T`, as measured by `P`, improves with
> experience `E`.

We'll continue to use TPE to decide what fits in at least this definition of machine learning.

### Learn for credit

[br]: https://en.wikipedia.org/wiki/Basic_research
[ci]: https://en.wikipedia.org/wiki/Causal_inference
[why]: https://en.wikipedia.org/wiki/Why

Is it redundant to say we learn for credit? Should you be thinking about your life goals with every
step you take? Should you let yourself "learn" values (see the first paragraph of
[Learning][learning])?

If you take "performance" as a synonym for "credit" then this phrase is also insufficient to
describe machine learning (according to the TPE definition), since it lacks a definition of `E`.

### Why

The word [Why][why] is used (confusingly) in both [Causal inference][ci] and to query the value
behind an action. Does a toaster warm up bread because it's hot or because that makes it delicious?
It's likely this is because we have functions to estimate value in our heads, and to backpropagate
on those value estimation functions we reuse the same word we would use for any mental function
backpropagation.

### Learn by example

Generally speaking, the phrase "learn by example" is associated with [Supervised learning][sl]. An
example defines "truth" (the `P`) and more examples (`E`) should improve performance, so an
algorithm that will "learn by example" should generally be considered a machine learning example by
the TPE definition.

Supervised learning is related to [Reinforcement learning][rl], though it's hard to say that either
is a special case of the other. In SL the value signal is defined in a static way (e.g. through a
function that operates on static data relative to the output) or a semi-static way (semi-supervised
learning). Both methods get down to a single value in the end, but the SL objective function is much
more detailed than the RL objective function (at the cost of being based on a static environment
i.e. the risk of concept drift). RL is explicitly defined to include "state" in the model's
function, but many supervised learning algorithms include state (e.g. signal processing filters and
language models).

Does four years of college without an application in mind make sense? Yes, if you accept one of
multiple value signals. More static (supervised learning) algorithms might try to e.g. mimic your
professor's mental networks exactly (learn to think the way they think, including everything they
say), or get good grades (perhaps based on your own understanding of a topic), or at least get the
final degree (avoid failing grades). A more flexible reinforcement learning based model would test
what you learned from the professor on some real environment (e.g. a lab-based course).

### Unsupervised learning

I'd argue that [Unsupervised learning][ul] is a form of machine learning where the performance
measure `P` (see above) is how well the algorithm discovers "features" that are interpretable by
humans i.e. that we can fit into our natural languages. We might say that a neural network used for
a vision application learns what an "edge" is, but the definition of "edge" it is using is complex,
more complex than we can describe in plain language. See also:
- [Explainable artificial intelligence (`!w interpretability machine learning`)](
https://en.wikipedia.org/wiki/Explainable_artificial_intelligence).

### Statistics

The article [Machine learning][ml] references this comparison between machine learning and
statistics:

> Statistics draws population inferences from a sample, while machine learning finds generalizable
> predictive patterns.

The "Book of Why" would argue that this is the difference between causal inference and statistical
inference, making causal inference equivalent to machine learning (and defined more precisely, in
general).

### Compression

[tru]: https://en.wikipedia.org/wiki/Truth

Can an idea that appears in a dream teach you something, or data generated by a simulation? Consider
the analogy of learning to compression. This analogy asks us to think of the model (with its
hyperparameters) as a form of compression of some real-world process. If you accept this analogy (or
accept it as a synonym), then you can still learn from a simulation if the simulation provides some
valuable alternative approximation of the real-world process you can use to generate data (`E`). To
use a simulation of reality, we assume we want to match a real-world process i.e. reality i.e. the
[Truth][tru] valuable, defining `P`.

This is not to say that machine learning is a compression of the data *generated by* the real-world
process; the data may be completely insufficient to describe the process (or excessive). Said
another way, machine learning (or a neural network) is the approximation (compression) of a
function.

Another article exploring this topic:
- [Will Compression Be Machine Learning’s Killer App? « Pete Warden's blog](
https://petewarden.com/2018/10/16/will-compression-be-machine-learnings-killer-app/)
