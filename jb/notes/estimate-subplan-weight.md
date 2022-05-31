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

# Estimate subplan weight

Estimate the weight (give a score to) a subplan, that is, a piece of plan that achieves some
subgoal. Prefer the term "subgoal" to "intermediate" goal; see the language recommendations in
[Goal](https://en.wikipedia.org/wiki/Goal). A [Plan](https://en.wikipedia.org/wiki/Plan) is
typically associated with one goal (see also [Planning](https://en.wikipedia.org/wiki/Planning)),
though we use more use it loosely if we intend to [Kill two birds with one stone](
https://en.wiktionary.org/wiki/kill_two_birds_with_one_stone). It's trivial to define a new goal as
the logical conjunction (AND) of other goals.

To estimate the weight (relative importance) of a subplan (e.g. small enough to do in a day), you
need to consider it in the context of a larger plan, all other plans that pass the same test
(achieve the same goal), and all your goals.

[rl]: https://en.wikipedia.org/wiki/Reinforcement_learning

An "action" is the smallest (atomic, indivisible) possible subplan; see [Reinforcement
learning][rl]. These are more relevant when computers are planning. For a high-level overview
of computer planning, see [Automated planning and scheduling](
https://en.wikipedia.org/wiki/Automated_planning_and_scheduling).

A plan is a set of subplans (paths) that we expect will bring us to any state where some particular
variable (in the state space) has a particular value (to any state in the set of goal states). See
[State space search](https://en.wikipedia.org/wiki/State_space_search).

Said another way, to weigh a subplan you need to consider its own weight as well as the expected
rewards that you can achieve from the new state it brings you to. That is, you must consider the
$R_a$ (rewards) associated with the orange squiggly lines in the drawing in [Markov decision
process](https://en.wikipedia.org/wiki/Markov_decision_process):

![MDP](
https://upload.wikimedia.org/wikipedia/commons/a/ad/Markov_Decision_Process.svg)

## Graph example

In the following git-styled graph, the `*` mark world states. A plan is also denoted git-style with
e.g. `a..b`. In this example, `a..c` is a subplan of `a..e`.

Historically, DAGs have regularly been used for scheduling. See [Directed acyclic graph -
Scheduling](https://en.wikipedia.org/wiki/Directed_acyclic_graph#Scheduling) and [PERT chart](
https://en.wikipedia.org/wiki/Program_evaluation_and_review_technique). The git style makes it
easier to draw (in ASCII) and therefore easier to annotate in ways custom to the planning problem.

This approach is analogous to [GitOps](https://en.wikipedia.org/wiki/DevOps#GitOps), where the state
of a resource (such as a cluster or deployment) is tracked in version control. A major difference of
this system from GitOps are that it looks forward rather than backwards in time ("imagining"
commits). There are some equivalencies between feature branches under review as "imagined"
improvements to the mainline, but this ignores that time cannot be stopped and that the feature is
already (perhaps partially) implemented (and only under review). Relative to GitOps, this system
also expands the state under consideration to the world/universe, which means it will never stay up
to date automatically (it is only updated as often as you come back to planning). For a more
detailed definition of GitOps, see [GitOps | GitOps is Continuous Deployment for cloud native
applications](https://www.gitops.tech/)).

```bash
* h: Pay bills: B 2017-07-07 4PM $120
* g: Mow lawn: L 2017-07-07 3PM $100
* f: Buy a lawn mower: 2017-07-07 1PM $80
| * e: Lawn service mows lawn: S L 2017-07-07 3PM $120
| * d: Play with kids: S K 2017-07-07 3PM $100
| * c: Pay bills: S B 2017-07-07 3PM $80
| * b: Call and pay lawn service: S 2017-07-07 1PM $60
|/
* a: Initial commit: 2017-07-07 12PM $80
```

Notice we assign scores (in \$) to every world state. Putting \$ values on spending time with your
kids and a mowed lawn clearly allows for every kind of [Intangible asset](
https://en.wikipedia.org/wiki/Intangible_asset). These won't show up in your bank account, but they
can still make you the "richest man in town" if they're what you want to measure (see [It's a
Wonderful Life](https://en.wikipedia.org/wiki/It%27s_a_Wonderful_Life)).

Notice world states are marked with what goals they achieve (e.g. B, K, L). The set of goal states
associated with L is {e, g} in this example. L can be specified in greater detail elsewhere, such as
grass in some acceptable height range. Often (not always) a reasonable sanity check is that the same
goal adds the same value (in \$) at every point in the graph.

We'll use capital letters for states we want to emphasize in general, not just goal states. In this
example S represents a subscription to a lawn moving service. When this state is true, we may pay
e.g. \$20/week to get our lawn mowed. We can use this system to describe the administration of other
significant resources as well, such as employees ("human resources") or computers ("computing
resources").

If we were really using git these detailed states (capital letters) would not likely be recorded in
the commit messages, but in files. From that perspective, these capital letters can be seen as the
tree of files in the commit. To generate a short, unique ID (other than a capital letter) you could
use an [Issue tracking system](https://en.wikipedia.org/wiki/Issue_tracking_system). From that
perspective, goal states are "features" (or fixed defects) and achieved states in general might be
"tasks" (e.g. refactors that increase the amount of code that must be managed).

In this example, we would like to compare the subplan `a..b` to `a..f`. Starting along one path
*always* involves forsaking all others (because time cannot be reversed). If we discover along the
way that one approach is going to be e.g. more expensive than expected, we can "rebase" an old
rejected plan into the future.

## VNTE and INVEST

You may notice this article uses VNTE as a synonym for "plan" based on the same three letters in
[INVEST (mnemonic)](https://en.wikipedia.org/wiki/INVEST_(mnemonic)). The letters SI are addressed
indirectly. This acronym is useful because it's more specific than the word "plan" (an overloaded
word) and it summarizes what needs to be considered in creating a goal/plan in the order it needs to
happen (Value first, Negotiability and Testability second, and Estimation last).

## Single-use and multi-use plans

The article [Directed acyclic graph - Applications](
https://en.wikipedia.org/wiki/Directed_acyclic_graph#Applications) lists scheduling and data
processing networks as the first two common applications of DAGs. Is there a fundamental distinction
between scheduling and data processing networks? Both are forward-looking; we expect a data
processing network to run (in the future) when we execute it.

Said another way, a Bayesian network is a data processing network that encodes a "plan" where the
time scale is much shorter than a human-executed plan, and (critically) where we expect the plan to
be reusable. Typically we use a different word (such as "process") for multi-use plans, but when we
expect to use a plan only a few times we may distinguish a "multi-use" plan. See also the
"frequency" characteristic used to describe plans in [Types of Plans in Business: Breadth,
Time-frame, Specificity & Frequency](https://edukedar.com/types-of-plans/).

A circuit's time scale is much shorter, and its uncertainties are drastically different. Because its
uncertainties are lower (though still not zero) we expect the "plan" it will execute to be much more
reusable. We are so confident it will work, in fact, that we've hardcoded it into silicon. Bayesian
statisticians like to point out that standard logic can be seen as a special case of Bayesian logic.

The unifying concept is causality, and similar points are made in [Directed acyclic graph -
Applications - Causal structures](
https://en.wikipedia.org/wiki/Directed_acyclic_graph#Causal_structures) to unify all of the topics
under "Applications" in causal language. In causal networks we tend to drop a specific `datetime`
from the nodes because we expect it to be reusable in the future. Our plans encode our causal
theories about the world; what we expect will work to change state in it.

# Value

Trying to define a numerical value estimate from first principles is mostly a waste of time, because
what you'd need to measure is by definition everything you've decided not to measure (because you're
only considering the value of planning, not doing it). That is, you can't inspect the evolution
of the world's values and costs (tools) beyond your own notes and thoughts (that would be planning).
You also can't expand on and think through your own notes on the topic (that would be planning).
It's possible to provide a numerical estimate of value only from experience in a particular domain,
that is, purely through reference class forecasting.

The frequency of how often you come back to planning should make you think of the step size in
machine learning; a step is analogous to a plan and stepping is the experiment. You can e.g.
accumulate steps and add them up before taking them. It's also a terribly hard hyperparameter to
tune, except through experience on the model you are trying to train.

Said another way, the value in imagining more possible worlds depends on your domain. How
experienced are you in it (how much data do you have)? For example, in war the situation is unstable
and rapidly changing; see the quotations in [Plan](
https://en.wikipedia.org/wiki/Plan#Quotations). See also:
- [Cynefin framework](https://en.wikipedia.org/wiki/Cynefin_framework#cite_note-8)
- [Volatility (finance)](https://en.wikipedia.org/wiki/Volatility_(finance))

If your values are not stable (what your customers are asking for) or your costs are not stable
(what abstractions or resources you need to solve your problems) then you shouldn't plan as far
ahead. You can't stop time, and the rest of the world is moving forward. In terms of a git graph,
you need to regularly "merge" the thoughts of outsiders (who are making world state commits
independent of you). These can be both changes in the market (what the world values) and changes in
tools (what you need to solve a problem).

Humans are good at imagining the future and seem to do so to a fault; we crave stable learning
environments/domains (with stable values and costs). See also:
- [Mental time travel](https://en.wikipedia.org/wiki/Mental_time_travel)
- [Foresight (psychology)](https://en.wikipedia.org/wiki/Foresight_(psychology))
- [Time perception](https://en.wikipedia.org/wiki/Time_perception)
- [Free energy principle](https://en.wikipedia.org/wiki/Free_energy_principle)
- [Prospection](https://en.wikipedia.org/wiki/Prospection)
- [Planning fallacy](https://en.wikipedia.org/wiki/Planning_fallacy)

We use the verb "plan" (the noun was defined above) to mean any of the steps listed in the "Cost"
section below.

Usually, hitting some subgoal should be a trigger to go back to planning (many people have a habit
to do so). Still, this isn't a hard rule. In theory you should compare the estimated weight of a
planning subplan (based on this document) to the estimated weight of your currently selected
subplan.

# Cost

If you only considered the "value" in planning then the frequency at which you planned could be
nearly continuous. That is, you could spend one hour every week, or four hours every month, for a
total cost of about four hours every month either way. However, planning is a skill that takes you
out of focused work on your current subgoal, and requires focused work (to some extent) in itself.
If you are only refining the plan to achieve your current subgoal, then it doesn't take you out of
focused work. However, planning should be about looking for alternatives to your current subgoal
(switching focus) and looking beyond your current subgoal (looking farther into the future).

All plans *tend* to reduce uncertainty, at the cost of more planning time (imagining based on what's
in your head, rather than testing based on what's outside it). An alternative way to reduce
uncertainty, as mentioned, is to execute only the first step in an existing multi-part plan
(preferring experimentation to theory).

In practice we need to plan for a certain minimum number of hours, which indirectly determines the
minimum possible planning frequency we achieve (more frequent is better, and possible with an
established planning process). This minimum affectively determines the minimum size that your
subplans can be (the "action" size). In periods where you come back to planning every time you hit a
subgoal, and your time estimates are accurate, you may notice all subgoals end up being about the
same size. If so, you can avoid a requirement to regularly come back to planning (timeboxes).

Much of this process has not been automated, but see:
- [Brainstorming](https://en.wikipedia.org/wiki/Brainstorming)
- [Computer supported brainstorming](https://en.wikipedia.org/wiki/Computer_supported_brainstorming)

## Update existing plans

You can often restore old plans where you've identified value. The more you plan, the larger this
body of "old" plans becomes (increasing the cost of planning). Only include incremental changes in
time on this graph; absolute dates would quickly go stale.

Many of your TODo should be numbered so you can build them into a "future" git graph. It would be
more convenient to letter them to help you semantically distinguish them (like variable names), but
in practice it's much harder to avoid namespace conflicts with this system. Of course, TODo that are
connected to any other TODo don't need to be in your plan at all (they are clearly a completely
independent plan).

On a team you could have multiple people explore different ideas in parallel; everyone on a team
should be coming up with and presenting ideas regularly.

## Identify value

Search for V. Consider VNTE in widely different parts of the network to start (fewer variations on
the same VNTE). Once you've identified the parts of the network with high weight tasks, get into
more focused planning work in that area of the network (effectively prune actions to modify the rest
of the network).

We write "value" on every VNTE first (hence the order of the acronym). If you don't understand the
value in a plan, ask the requestor for it. If the value is low, then you don't ever have to go as
deeply into the cost estimate (saving planning time). If it's zero or negative, you can throw the
plan away. Value drives all development, every new commit (businesses exist to make money).

What if you were to come to a network where you had no idea what parts of it were most costly to
modify? You have to start with value first in any search for high weight plans. If you had a network
where you understood the costs everywhere, but no indicator of value, no development would happen.
If you didn't want to e.g. increase or decrease output, the conversation about the plan would never
have happened.

## Set goals

Consider either [](./set-wide-goal.md) or [](./set-deep-goal.md).

## Imagine variations

Consider either [](./flatten-plan.md) or [](./identify-resource.md).

## Refine plans

Consider [](./refine-plan.md).
