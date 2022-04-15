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

# Estimate improvement value

An estimate of the value of an action.

# Value

You can't estimate the value of estimating value, in general. Eventually you need a base case, or
the recursive value-estimation function is not going to halt. When you're talking about a specific
situation, then yes, you can talk about the various higher-level reasons that you are doing what you
do. This breaks down the higher-level you get, similar to how a child asking "why" endlessly usually
ends with the parent saying that God asked us to do it in a certain way, sometimes without
consulting with God. That is, God serves as the base case.

## Planning

You may be tempted to say that this process inherits value from planning documents; that it helps
prioritization. While it's true that you will be more decisive and opinionated if you understand
your own values clearly and concisely, you can't say that this is valuable in itself. Is it better
to know what you value and make quick decisions, or be willing to go with the flow?

## Consistency

Use reference class forecasting; how "accurate" have your estimates been in this domain in the past?
In your personal life, how consistent have your values been? In a business setting, how consistent
is the market? How often do [KPI]( https://en.wikipedia.org/wiki/Performance_indicator) change?

If your own values are a moving target, then it may be better to let others define them for you (so
you can e.g. make more money). If you don't make one topic "your thing" though, you risk not
building (effective, efficient) deep mental networks that are valuable to others.

## Values and goals

See [](./define-values.md) for a comparison between values and goals. When you are working on a
specific goal, your value estimation function should include *both* the value in the specific goal
and the value you put in acquiring the knowledge that the solution requires. Call the first direct
value, and the second "transfer" value; see:
- [Transfer of learning](https://en.wikipedia.org/wiki/Transfer_of_learning)
- [Transfer learning](https://en.wikipedia.org/wiki/Transfer_learning)

## Teach a computer

Despite values being quite uncertain, and therefore the value of a specific project or major goal
being even more uncertain, it helps to try to think precisely about them to potentially teach a
computer how to achieve larger goals.

# Cost

## Training Data

[nc]: https://en.wikipedia.org/wiki/Neural_circuit
[lsbn]: https://en.wikipedia.org/wiki/Large-scale_brain_networks

Your brain stores mental sub-networks that model real-world systems. See:
- [Neural circuit][nc]
- [Large-scale brain networks][lsbn]

These sub-networks (together with sensory inputs) allow you to perform functions (i.e. processes,
tasks) such as math or the prediction of future world states.

Call the output of a mental function (a MentalModel) a `Thought`. Let's model how our high-levels
goal are affected by our mental sub-networks with backpropagation:

$$
\frac{\partial Value}{\partial MentalModel} =
\frac{\partial Value}{\partial Thought}
\frac{\partial Thought}{\partial MentalModel}
$$

In words, how your life goals are affected by improving the mental sub-network associated with this
task is equal to the multiplication of:
1. How your life goals are affected by the outputs of this function (thoughts).
2. How the outputs of this function are affected by your mental sub-network.

## Transfer Value, Time Metric

How much does the mental function affect your current reality? This determines:

$$
\frac{\partial Value}{\partial MentalModel} =
\frac{\partial Value}{\partial MentalSpeed}
\frac{\partial MentalSpeed}{\partial MentalModel}
$$

$$
\frac{\partial Value}{\partial MentalSpeed} =
\frac{\partial Value}{\partial FutureStates}
\frac{\partial FutureStates}{\partial MentalSpeed}
$$

Combining these equations:

$$
\frac{\partial Value}{\partial MentalModel} =
\left(\frac{\partial Value}{\partial FutureStates}
\frac{\partial FutureStates}{\partial MentalSpeed}\right)
\frac{\partial MentalSpeed}{\partial MentalModel}
$$

For example, if you are measuring value in time:

| Explanation                          | Variable               | Value       |
| ---                                  | ---                    | ---         |
| Would all the time you save on this function come back to you? | ∂Value/∂FutureStates | 1 |
| How much schedule would you free per increase in thought speed? | ∂FutureStates/∂MentalSpeed | 2 days/unit |
| Would execution take two rather than three days with a ∂MentalModel? | ∂MentalSpeed/∂MentalModel | 1 day/ex.   |

Then ∂Value for the ∂MentalModel is:

$$
= \left(1 * \frac{2 days}{\frac{1 day}{execution}}\right) * \frac{1 day}{execution} = 2 days
$$

Use reference class forecasting; how have you achieved the greatest value in this area in the past?
Is this the same kind of action?

Do you have any notes on the mental function you are trying to improve?

% See also `organize-notes.md`.

% # Additional Training Data

% See `improve-estimate-improvement-value.md`.

## Include value (as SLA) of generalizability/reproducibility in every "value" section

These are closely related concepts, where reproducibility is generalizability across time. If
literally nothing changed (we reproduced the state of the world at the exact time the test passed
the one time it did) then it would pass again. If results are not reproducible, then something
changed. Nothing in life is fully reproducible, so you will always need to define an SLA.

What are common causes? Said another way, what about your dependency system changed? This is a
special case of the problem considered in [](./investigate-root-cause.md), where you've seen
something work at least once in the past (a regression). Even more than that, though, it allows for
probabilistic causes outside your service's (e.g. build service's) control.

% TODO 9.8: Integrate with `investigate-root-cause.md`

Network services often go down. See [Fallacies of distributed computing](
https://en.wikipedia.org/wiki/Fallacies_of_distributed_computing). In the modern world, writing
defensive network code is critical to get tests to pass reliably. If a service you rely on only
promises 99.9% uptime, that is an upper bound on the SLA you can promise for your own service.

External services aren't the only issue, though. What if your data center goes down? If you could
control all external services, and in fact the whole universe, then you could always find the root
cause and fix it and provide a 100% SLA. You can increase your SLA based on how far you've dug into
not only your your software dependency chain, but also your hardware dependencies, the supply chain
that builds your hardware, and the likely availability of your network engineers at midnight.

You can even think of the computer sitting in front of you as a service. For the "service" that is
your local desktop machine, what if the power goes out? What if a tornado hits the building you're
in now and throws it out the window? What if the cat bites a power cable? What has happened in the
past?
