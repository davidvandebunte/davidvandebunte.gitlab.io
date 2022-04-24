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
situation, you can talk about the various higher-level reasons that you are doing what you do. This
breaks down the higher-level you get, similar to how a child asking "why" endlessly usually ends
with the parent saying that God asked us to do it in a certain way, sometimes without consulting
with God. That is, God serves as the base case.

## Planning

You may be tempted to say that this process inherits value from planning documents; that it helps
prioritization. While it's true that you will be more decisive and opinionated if you understand
your own values clearly and concisely, you can't say that this is valuable in itself. Is it better
to know what you value and make quick decisions, or be willing to go with the flow?

## Teach a computer

Despite values being quite uncertain, and therefore the value of a specific project or major goal
being even more uncertain, it helps to try to think precisely about them to potentially teach a
computer how to achieve larger goals.

# Cost

## Include Uncertainty

Use reference class forecasting; how "accurate" (consistent) have your estimates been in this domain
in the past? In your personal life, how consistent have your values been? In a business setting, how
consistent is the market? How often do [KPI]( https://en.wikipedia.org/wiki/Performance_indicator)
change?

If your own values are a moving target, then it may be better to let others define them for you (so
you can e.g. make more money). If you don't make one topic "your thing" though, you risk not
building (effective, efficient) deep mental networks that are valuable to others.

## Ultimate Source

Let's borrow two terms from philosophy: intrinsic and instrumental value. For a definition of these
terms, see [Value (ethics and social sciences)](
https://en.wikipedia.org/wiki/Value_(ethics_and_social_sciences)#Intrinsic_or_extrinsic).

### Trusted Instrumental Value

#### Value

In general, trust is a powerful tool to avoid significant work balancing costs and benefits. Kids
trust their parents about what is "good" (e.g. math) without an understanding yet of all the areas
they'll be able to use the skills they use.

When you join a new (large) company or change to a completely different team within your company,
you usually do not have enough background on the software and the business to understand how what
you do affects the bottom line. Instead, you have to trust someone who brought you into the company
to provide some guidance about what to work on until you have a better understanding of what
matters.

Interestingly, if you work on a subteam in a huge company then helping the teams that use your
projects (those TODo) have trusted instrumental value, if you don't understand what they do. For
example, how do the engineers who maintain the company's build system decide which requests to spend
more time on?

You trust your past self when you respect the number on a scored TODo you put on a task in your code
or notes. Although these scores are often produced based on an estimate of both value and cost, we
often forget to update them as we start working on the task and discover more about cost.

Many people see money as having intrinsic value, which is why the monetary system is so effective.
That is, we don't back money by gold or anything else that is intrinsically valuable (e.g. food) but
we all still want it as an end in itself, i.e. because other people want it.

#### Cost

In some sense, within a company, you want to get rid of all calculations based on trusted
instrumental value so the whole network is connected. When we decide how to spend all our time based
on value signals from others we trust, we not only depend on them to make decisions, we may be
putting false trust in someone who is more interested in their own advancement than our own.

Should you see dollars as helping others? Is getting dollars equivalent to loving your neighbor? In
terms of trust, should we trust that the people who are giving us dollars are eventually doing
"good" things with what we give them back? Many people believe that behind every great fortune lies
an even greater crime. Who provides the dollars you are earning, that is, who are you serving?

Ideally, dollars would represent the average opinion of other people about how valuable something
is. If a democratic, fair (good) society is printing the dollars, then this should be closer to
true. What's great about dollars for optimization is they provide a metric people care about when
otherwise there might be none.

Do you trust that those giving you dollars providing goods and services that are "good" with respect
to your values? See [Socially responsible investing](
https://en.wikipedia.org/wiki/Socially_responsible_investing).

### Shifting Sources

It’s OK to have knowledge acquisition stories, but it should be in the form of spikes, prototypes,
etc. (validated learning rather than extensive planning). Similarly, some people like two stories
for defects, one to investigate the root cause of the defect, and a separate story to decide what to
do about it. Once the first story is done, a few people (or even just two) can get together to talk
about the proper solution, rather than just having the first person who found the root cause come up
with a solution. Of course there may only be one obvious solution, or it may be so urgent to fix the
bug that we need to understand the root cause and then interrupt another developer to ask them about
potential solutions.

In general, it's easy to convert one "large" task with e.g. intrinsic value into multiple with
instrumental value by simply taking the first thing you think you need to do for the large task and
separating it into it's own task. Large companies do this when they have an architect break down a
customer feature into many services (whether driven by software services or manually by teams of
people providing a service in the service economy).

Don't get hung up on the distinction between a story and a task in Scrum or on Kanban boards; it's
better to use the philosophical terms (they provide a larger and older, more standard language).
Everyone already knows we should consider what is shown at the sprint review (items with intrinsic
or trusted instrumental value, i.e. relevant to those outside the team). Simply show progress at the
sprint review, even if it's not going to make a difference to your team's service's API (e.g.
whether people want to update). Present those items at the sprint review as well, but more
importantly include them in release notes.

### Future Goals

See [](./define-values.md) for a comparison between values and goals. When you are working on a
specific goal/project, your value estimation function should regularly include the value you put in
acquiring the knowledge that the solution requires. Call what you learn as part of a project
"transfer" value; see:
- [Transfer of learning](https://en.wikipedia.org/wiki/Transfer_of_learning)
- [Transfer learning](https://en.wikipedia.org/wiki/Transfer_learning)

Transfer value is a specific kind of instrumental value, scored based on the set of projects you
expect to work on in the future.

Transfer value is the value of a commit in source code; not the value of running the source code.
See the end of [](evaluate-pedagogical-tool.md) for this extended analogy. Said another way, it's
the value in running training for longer rather than running inference. For a learning task, the
cost is how long we will need to run training (or generate commits), and the value is how the time
we put into that investment pays off in terms of in terms of improved outputs (translated to the
value metric).

## Significant terms

To eventually estimate the cost of an effort numerically (e.g. in time), we often need more details
about the objective function.

### Societal Values

See [](./define-values.md) for a discussion of societal values and how they influence us. Although
these may seem arbitrary and imprecise, they get slightly more interesting if you consider how you
would metricate them in a machine.

In particular, it's important to keep track of these values because they can be major sources of
uncertainty. If the story the team is going to work on next becomes primarily a matter of politics
(like passing laws from a shared backlog) then you need to move on.

#### Normativity

One common societal value is [Normativity](https://en.wikipedia.org/wiki/Normativity); we regularly
influence the opinions of others through [Normative statements](
https://en.wikipedia.org/wiki/Normative_statement).

For example, why do you send a greeting card to a sick relative? If you're doing it because you have
heard that all your other siblings are doing it, then you are acting in response to normative value.

Notice this can be both a positive and negative term. If you will likely be attacked for e.g.
failing to fit in, then the value is negative. If you are instead acting out of a genuine desire to
put value on the opinions of others rather than yourself (putting trust in them) then this is
arguably positive. In some sense, a preference for normativity is a preference for democracy.

A preference for using the language of others rather than your own is normative, and also lets you
pull their thoughts into your own mental networks.

#### Know thyself

In some ways, this is a societal value similar to the more commonly known value we put on
self-expression (in the western world). Unfortunately, it's hard to metricate this. Many people are
likely pulled into "neural networks" because the name promises to help them both understand
themselves and teach computers.

### Value in Reproducibility

Many calculations assume once we know how to do something we won't forget how to do it, and what we
need to perform the task won't change. Let's say there's no value in reproducibility, i.e. you only
need to be able to perform the task once. Is it worth the cost of learning something if you're only
going to need to perform it once, when the next time you may need to follow it will be years from
now, and may require a mostly different process to get the same result?

In the case of a unit test in a build service, where the value in the test is often only to a
developer or developers, we more often need to make hard decisions about whether to even keep
certain tests.

Let's define reproducibility as generalizability across time. If literally nothing changed, that is,
we reproduced the state of the world at the exact time a test passed, the one time it did, then it
would pass again. If results are not reproducible, then something changed. Nothing in life is fully
reproducible, so you will always need to define a minimum e.g. SLA in the definition of the task
(estimated output improvement). For example, we may require that a test will pass on 9/10 builds,
indefinitely.

You can define a minimum SLA in the task, but sometimes you may need to revisit the target SLA as
you discover more about the problem and instead think about the different amounts of value you will
deliver for different levels of reproducibility. That is, there may be different value estimates for
different SLA levels. If it's easy to get the test to pass 99/100 times but 10x more work to get it
to 999/1000 times, then you might want to either drop it altogether or not require it to pass on
every build of the software (e.g. cache the passed test). If you have 1000 tests in your build, then
99% reproducibility is not enough. If you [](./regularly-stress-test.md) you can monitor what
fraction of the time the test passes and notice if e.g. it drops to 0/10 times. Feedback will be
slower, but you won't have to stop running the test.

### Value in Expediency

Also called the "cost of delay" in other material. It may be that a story is becoming less valuable
with time (which makes it harder to schedule, of course).

If there is no or little cost of delay, you should consider doing the story whenever it is
convenient to do; e.g. at the same time as other stories in the same area.

For people, who not only lose mental plasticity with time but have a limited lifespan, the benefits
of learning a particular skill decrease with time. For example, we typically don't have people go
back to college in their 50s and 60s to learn a completely new career (though there's nothing wrong
with this, since the investment can pay back even in this timeframe depending on what they are
currently doing).

This kind of value is also related to the explore-exploit problem; see [Multi-armed bandit](
https://en.wikipedia.org/wiki/Multi-armed_bandit).

When will your time be saved? If a process improvement insight saves you 3 minutes a day for the
rest of your life, then it only costs 6 minutes to delay implementation for two weeks. Don't waste
time working on something until you've thought about it for a bit, and you're sure it’s going to
save time (your priors are more certain). Said another way, when do you pay back your initial
investment? If it's long, you many need to consider the time value of money. In the same way you
don’t just buy something from Amazon when you think of it, you don’t work on something until you’ve
reflected on its value.

### Anticipated Accidental Value

Humans and other animals have curiosity, a desire to learn that is often independent of any value
system. What we are naturally curious about often ends up being closely related to valuable skills,
but it's hard to attribute the drive to that alone.

Should we should support [Basic research](https://en.wikipedia.org/wiki/Basic_research) with
government funding? This kind of research isn't driven to *alter* or control our environment and
therefore isn't likely in itself to be able to bring value (which almost involves control or
change). That is, should we support full time curiosity?

Many of the most important discoveries humans have made have been accidental; see [Role of chance in
scientific discoveries](https://en.wikipedia.org/wiki/Role_of_chance_in_scientific_discoveries).
It's likely many researchers have come up with estimates for what percent of our most valuable
discoveries came about by chance; this calculation should be possible based on a definition a
"valuable" specific to a person or society. If you believe this number is high, then you'd fund more
basic research.

Many once [Unsolved problems in mathematics](
https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_mathematics) were solved because of
someone's natural curiosity. In the modern world charities sometimes provide funds to motivate
solutions to basic mathematical questions (though these sometimes have known practical value). See:
- [Millennium Prize Problems](https://en.wikipedia.org/wiki/Millennium_Prize_Problems)
- [Fermat's Last Theorem - Wikipedia](https://en.wikipedia.org/wiki/Fermat%27s_Last_Theorem)

That is, take the phrase "necessity is the mother of the invention" with a grain of salt.

This kind of value isn't impossible in software; developers often find easy features just by reading
through a section of code. For example, that save hundreds of thousands of dollars in production
costs by removing unnecessary code that was running but actually not required.

## Examples

A refactoring task is a TODo that typically has time value (saving developer time), a form of
instrumental value among the whole project. A "story" TODo typically has intrinsic or trusted
instrumental value given by a company-external customer (value measured in dollars) or
company-internal customer (value requiring a company-internal metric).

Both refactoring and feature tasks may include transfer value (hard to metricate, but see below).
Confirm your coworkers (code reviewers, feedback providers) are interested in learning about the
associated topics.

Both kinds of tasks should come with new tests for the build service that have an SLA negotiated as
part of the work (or defined prior to the work, for a more accurate cost estimate). For tasks on the
opposite end of the spectrum, you may need to guess how much accidental value will come from it
using reference class forecasting.

### Mental function

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

#### Transfer Value, Time Metric

How much does the mental function affect your current reality? Let's say you only produce the same
`Thought`, but faster. Then you would affect your future possible worlds by simply saving time:

$$
\frac{\partial Value}{\partial MentalModel} =
\frac{\partial Value}{\partial MentalSpeed}
\frac{\partial MentalSpeed}{\partial MentalModel}
$$

$$
\frac{\partial Value}{\partial MentalSpeed} =
\frac{\partial Value}{\partial FutureWorld}
\frac{\partial FutureWorld}{\partial MentalSpeed}
$$

Combining these equations:

$$
\frac{\partial Value}{\partial MentalModel} =
\left(\frac{\partial Value}{\partial FutureWorld}
\frac{\partial FutureWorld}{\partial MentalSpeed}\right)
\frac{\partial MentalSpeed}{\partial MentalModel}
$$

For example, if you are measuring value in time:

| Explanation                          | Variable               | Value       |
| ---                                  | ---                    | ---         |
| Would all the time you save on this function come back to you? | ∂Value/∂FutureWorld | 1 |
| How much schedule would you free per increase in thought speed? | ∂FutureWorld/∂MentalSpeed | 2 days/unit |
| Would execution take two rather than three days with a ∂MentalModel? | ∂MentalSpeed/∂MentalModel | 1 day/ex.   |

Then ∂Value for the ∂MentalModel is:

$$
= \left(1 * \frac{2 days}{\frac{1 day}{execution}}\right) * \frac{1 day}{execution} = 2 days
$$

% See also `organize-notes.md`.

% # Additional Training Data

% See `improve-estimate-improvement-value.md`.
