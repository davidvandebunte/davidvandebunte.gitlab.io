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

Why do we plan? Trying to assign a numerical value estimate from first principles is mostly a waste
of time, because what you'd need to measure is by definition everything you've decided not to
measure (assuming you're only considering the value of planning, not doing it). That is, you can't
inspect the evolution of the world's values and costs (tools) beyond your own notes and thoughts
(that would be planning). You also can't expand on and think through your own notes on the topic
(that would be planning). It's possible to provide a numerical estimate of value only from reference
class forecasting, that is, experience in a particular domain.

Said another way, you have two options for estimating the value of planning. First, schedule a small
planning session (i.e. a planning subplan) and see how much value you get out of it. That is, did
you change what you are most likely to work on next? Are you likely to be able to reuse the plans
you did create? Did the rescheduling improvements on the items you will do make up for the cost of
planning? Second, you can try to remember how continued planning in a particular area (a "domain")
paid off in the past (i.e. without collecting new data).

The frequency of how often you come back to planning should make you think of the step size in
machine learning; a step is analogous to a plan and stepping is the experiment. You can e.g.
accumulate steps and add them up before taking them (build up a plan). It's also a terribly hard
hyperparameter to tune, except through experience on the model you are trying to train. To pick a
step size you often have to simply guess and experimentally check if the loss goes down.

[cf]: https://en.wikipedia.org/wiki/Cynefin_framework
[vf]: https://en.wikipedia.org/wiki/Volatility_(finance)

Said another way, the value in imagining more possible worlds depends on your domain. How
experienced are you in it (how much data do you have)? For example, in war the situation is unstable
and rapidly changing; see the quotations in [Plan](
https://en.wikipedia.org/wiki/Plan#Quotations). See also [Cynefin framework][cf] and [Volatility
(finance)][vf].

If your values are not stable (what your customers are asking for) or your costs are not stable
(what abstractions or resources you need to solve your problems) then you shouldn't plan as far
ahead. You can't stop time, and the rest of the world is moving forward. In the terms of a version
control system, you need to regularly "merge" the thoughts of outsiders (who are making world state
commits independent of you). These can be both changes in the market (what the world values) and
changes in tools (what you need to solve a problem).

Usually, hitting some subgoal should be a trigger to go back to planning (many people have a habit
to do so). Usually, the associated decrease in your uncertainties may lead to a change in your
plans, and even if it doesn't you likely to need to plan out your next steps in more detail. Still,
this isn't a hard rule. In theory you should compare the estimated weight of a planning subplan
(based on this document) to the estimated weight of your currently selected subplan.

The noun "plan" is defined in the **Test** section below. We use the verb "plan" to mean any of the
steps listed in the "Cost" section. Humans are good at imagining the future and seem to do so to a
fault; we crave stable learning environments/domains (with stable values and costs). See also:
- [Mental time travel](https://en.wikipedia.org/wiki/Mental_time_travel)
- [Foresight (psychology)](https://en.wikipedia.org/wiki/Foresight_(psychology))
- [Time perception](https://en.wikipedia.org/wiki/Time_perception)
- [Free energy principle](https://en.wikipedia.org/wiki/Free_energy_principle)
- [Prospection](https://en.wikipedia.org/wiki/Prospection)
- [Planning fallacy](https://en.wikipedia.org/wiki/Planning_fallacy)

# Test

Estimate the weight (give a score to) a subplan, that is, a piece of plan that achieves some
subgoal. Prefer the term "subgoal" to "intermediate" goal; see the language recommendations in
[Goal](https://en.wikipedia.org/wiki/Goal). A [Plan](https://en.wikipedia.org/wiki/Plan) is
typically associated with one goal (see also [Planning](https://en.wikipedia.org/wiki/Planning)),
though we use more use it loosely if we intend to kill two birds with one stone. It's trivial to
define a new goal as the logical conjunction (AND) of other goals.

To estimate the weight (relative importance) of a subplan (e.g. small enough to do in a day), you
need to consider it in the context of a larger plan (e.g. something that takes a week), all other
larger plans that pass the same test (achieve the same goal), and all your goals (since it may help
you achieve multiple goals).

[rl]: https://en.wikipedia.org/wiki/Reinforcement_learning

An "action" is the smallest (atomic, indivisible) possible subplan; see [Reinforcement
learning][rl]. For a high-level overview of computer planning, see [Automated planning and
scheduling]( https://en.wikipedia.org/wiki/Automated_planning_and_scheduling).

A plan is a set of subplans (paths) that we expect will bring us to any state where some particular
variable (in the state space) has a particular value (to any state in the set of goal states). See
[State space search](https://en.wikipedia.org/wiki/State_space_search).

Said another way, to weigh a subplan you need to consider its own weight as well as the expected
rewards that you can achieve from the new state it brings you to. That is, you must consider the
$R_a$ (rewards) associated with the orange squiggly lines in the drawing in [Markov decision
process](https://en.wikipedia.org/wiki/Markov_decision_process):

![MDP](https://upload.wikimedia.org/wikipedia/commons/a/ad/Markov_Decision_Process.svg)

See also [Goal setting](https://en.wikipedia.org/wiki/Goal_setting).

## Graph example

In the following git-styled graph, the `*` mark world states. A plan is also denoted git-style with
e.g. `a..b`. In this example, `a..c` is a subplan of `a..e`. DAGs have long been used for
scheduling. See [Directed acyclic graph -
Scheduling](https://en.wikipedia.org/wiki/Directed_acyclic_graph#Scheduling) and [PERT chart](
https://en.wikipedia.org/wiki/Program_evaluation_and_review_technique). The git style makes it
easier to draw (in ASCII) and therefore easier to annotate in ways custom to the planning problem.

This approach is analogous to [GitOps](https://en.wikipedia.org/wiki/DevOps#GitOps), where the state
of a resource (such as a cluster or deployment) is tracked in version control. The first major
difference of this system from GitOps are that it looks forward rather than backwards in time
("imagining" commits). That is, it is prescriptive rather than descriptive. Relative to GitOps, this
system also expands the state under consideration to the world/universe, which means it will never
stay up to date automatically (it is only updated as often as you come back to planning). For a more
detailed definition of GitOps, see [GitOps | GitOps is Continuous Deployment for cloud native
applications](https://www.gitops.tech/)).

```
* h: Pay bills: B 2017-07-07 4PM $110
* g: Mow lawn: L 2017-07-07 3PM $90
* f: Buy a lawn mower: 2017-07-07 1PM $70 (immediate $10 deprecation of mower)
| * e: Lawn service mows lawn: S L 2017-07-07 3PM $120
| * d: Play with kids: S K 2017-07-07 3PM $100
| * c: Pay bills: S B 2017-07-07 3PM $80
| * b: Call and pay lawn service: S 2017-07-07 1PM $60
|/
* a: Initial commit: 2017-07-07 12PM $80
```

We assign scores (in \$) to every world state. Putting \$ values on spending time with your kids and
a mowed lawn clearly allows for every kind of [Intangible asset](
https://en.wikipedia.org/wiki/Intangible_asset). These won't show up in your bank account, but they
can still make you the "richest man in town" if they're what you want to measure (quote from [It's a
Wonderful Life](https://en.wikipedia.org/wiki/It%27s_a_Wonderful_Life)).

World states are marked with what goals they achieve (e.g. B, K, L). The set of goal states
associated with L is {e, g} in this example. L can be specified in greater detail elsewhere, such as
grass in some acceptable height range. Often (not always) a reasonable sanity check is that the same
goal adds the same value (in \$) at every point in the graph.

We'll use capital letters for states we want to emphasize in general, not just goal states. In this
example S represents a subscription to a lawn moving service. When this state is true, we may pay
e.g. \$20/week to get our lawn mowed. We can use this system to describe the administration of other
significant resources as well, such as employees ("human resources") or computers ("computing
resources").

If we were really using `git` these detailed states (capital letters) would not likely be recorded
in the commit messages, but in files. From that perspective, these capital letters can be seen as
the tree of files in the commit. To generate a short, unique ID (other than a capital letter) you
could use an [Issue tracking system](https://en.wikipedia.org/wiki/Issue_tracking_system). From that
perspective, goal states are "features" (or fixed defects) and achieved states in general might be
"tasks" (e.g. refactors that increase the amount of code that must be managed).

In this example, we would like to compare the subplan `a..b` to `a..f`. Starting along one path
*always* involves forsaking all others (because time cannot be reversed). If we discover along the
way that one approach is going to be e.g. more expensive than expected, we can "rebase" an old
rejected plan into the future.

## VNTE and INVEST

This article uses VNTE as a synonym for "plan" based on the same three letters in [INVEST
(mnemonic)](https://en.wikipedia.org/wiki/INVEST_(mnemonic)). The letters SI are addressed
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

## Necessity

In the language of [Types of Plans in Business: Breadth, Time-frame, Specificity & Frequency](
https://edukedar.com/types-of-plans/) and [Plan](https://en.wikipedia.org/wiki/Plan), we must always
keep an eye on the "breadth" of our plans. Generally speaking, this is the amount of state we plan
to manage or create as part of the plan. It's not wise for an individual to execute a plan of high
breadth directly for a variety of reasons (individual memory limitations, risk of too much theory
without experimentation, ignoring value in executing faster with a team).

# Estimated cost

[brs]: https://en.wikipedia.org/wiki/Brainstorming
[cbrs]: https://en.wikipedia.org/wiki/Computer_supported_brainstorming

Much of this process has not been automated, but see [Brainstorming][brs] and [Computer supported
brainstorming][cbrs].

## Limit planning time

If you only considered the "value" in planning then the frequency at which you planned could be
nearly continuous. That is, you could spend one hour every week, or four hours every month, for a
total cost of about four hours every month either way. However, planning is a skill that takes you
out of focused work on your current subgoal, and requires focused work (to some extent) in itself.

Therefore in practice we need to plan for a certain minimum number of hours, which indirectly
determines the minimum possible planning frequency we achieve (more frequent is better, and possible
with an established planning process). This minimum effectively determines the minimum size that
your subplans can be (the "action" size). In periods where you come back to planning every time you
hit a subgoal, and your time estimates are accurate, you may notice all subgoals end up being about
the same size. If so, you can avoid a requirement to regularly come back to planning (timeboxes).

All plans *tend* to reduce uncertainty about your action choice, at the cost of more planning time
(imagining based on what's in your head, rather than testing based on what's outside it). An
alternative way to reduce uncertainty, as mentioned, is to execute only the first step in an
existing multi-part plan (preferring experimentation to theory).

## Reuse unexecuted plans

You can often restore (rebase) old plans where you've identified value. The more you plan, the
larger this body of "old" plans becomes (becoming both a burden and a helpful resource). Only
include incremental changes in time on this graph; absolute dates would quickly go stale. On a team
you could have multiple people explore different ideas in parallel. Everyone on a team should be
coming up with and presenting ideas regularly, further complicating management of this artifact. For
an example, see [](./select-subplan.md).

[cits]: https://en.wikipedia.org/wiki/Comparison_of_issue-tracking_systems
[cpms]: https://en.wikipedia.org/wiki/Comparison_of_project_management_software

One way to look at planning is as a process to let you [](./expand-focus.md) to everything you care
about; the big picture. If you can see the big picture then you know it is more likely you won't
"miss" high value (critical) or low cost (opportunistic) tasks. Planning tools and artifacts let you
see a "compressed" picture of the state you care about to help you plan better. In theory, we expect
the CEO of a company or the leader of a team to use planning artifacts to see the big picture and
select the best actions for the group from all available options. These artifacts are small and so
can easily be converted (on demand, i.e. the subset of tasks that is required) to e.g. the [Jira
(software)](https://en.wikipedia.org/wiki/Jira_(software)) format. See also [Comparison of
issue-tracking systems][cits] and [Comparison of project management software][cpms].

## Reuse experiences

Let's say you want to reuse your past experience to get to a friend's house:

```
* Drive to friend's: ???
* At home: Fri 11:00
...
* Now: Wed 14:00
...
* Drive to friend's: Mon 15:30
* At home: Mon 15:00
```

[prw]: https://en.wikipedia.org/wiki/Pattern_recognition

You have one experience that should help you achieve the same goal you achieved in the past again.
As much as your car is a "tool" (a resource, dependency) that will help you achieve the goal, you
have a process in your head (or notes) that is a "tool" you can use to plan your trip to your
friend's house. The key here is to use [Pattern recognition][prw] to identify whether many of many
possible actions you've collected in your head "fit" the new experience.

For example, if you kept track of (can remember i.e. have priors, or wrote down) how long it took to
do something in the past, you should be able to estimate how long it will take to do in the future.
If it took 30m to get to your friend's house last time, you can guess it will be about 30m this
time. If you've been to your friend's house multiple times and you notice it typically takes 30-40m
to get there, you may be able to more accurately predict it will take 35m to get there.

You have likely generalized the many experiences you've had of driving into a reusable action for
getting from A to B. Then even if you've never been to your friend's house but know the distance to
get there, you can "rebase" that action (commit) or subhistory (branch) to your future and use your
process associated with the plan to make a prediction about e.g. how long it will take.

[pmw]: https://en.wikipedia.org/wiki/Pattern_matching

Said another way, you have many mental (or written) functions that you [Pattern match][pmw] against
your current subplan. You may see multiple fit the goal, in which case you have to choose the best
fit (e.g. an action to drive from A to B and action to drive to your friend's). This pattern
matching can easily fail; all your mental/written functions are tools and if you've only been
thinking about one recently (i.e. a hammer) then everything will look like a nail.

These functions should take as an input a goal, and a function to estimate the increase in value and
the cost. The first function ("Estimate value") will estimate the increase in value (due to state
changes) associated with taking the action, given a stable loss function and certain specifics of
the state the action acts on. The second function ("Estimate cost") will estimate the time cost of
taking the action given some of the same specifics (e.g. it may be slower on larger inputs). Both
are compressed forms of all your past experiences taking the action, in order to run faster than
considering all your experiences (though you may want to save the data).

The "Estimate cost" function is also a good starting point for solving the new problem, if not the
solution in itself. If you have to fix conflicts in this function when you rebase it to your new
inputs, you're learning something from a new training example. You can see the "Estimate cost"
function as producing a sales quote and the "Estimate value" function an advertisement (or sales
pitch).

In practice, you may need to use your "common sense" to tune the estimates produced by these
functions as you rebase. Still, your "common sense" can only be based on your past experiences. You
may simply be adding more recent (or more) of your own experiences to the estimates produced by the
functions.

A major advantage of having such a library of reusable actions is that, if the actions are small,
you should be able to combine these old but reusable actions into new subplans. For example, if you
had broken down the steps to get to your friend's house and your mom's house you may have discovered
some are repeated (e.g. closing the garage door) and some are easily generalizable (e.g. entering an
address in an app to get directions).

[fgm]: https://bazel.build/basics/dependencies#using_fine-grained_modules_and_the_111_rule

See [Grok Your Bazel Build: The Action Graph](https://jin.crypt.sg/articles/bazel-action-graph.html)
for an introduction to actions in Bazel. The action graph is Bazel's "plan" for executing the build,
constructed from the highly reusable plans encoded in `BUILD` files. A preference for small actions
is explicitly discussed in [Dependency Management | Bazel][fgm]. In this context, smaller actions
also make re-executing actions faster (through parallelization and caching).

Do not assume any dependency is necessary or good or bad. See:
- [](./flatten-plan.md) for tips on stripping dependencies
- [](./identify-resource.md) for tips on finding them

## Find value

We write "value" on every VNTE first (hence the order of the acronym). If you don't understand the
value in a plan, ask the requestor for it. If the value is low, then you don't ever have to go as
deeply into the cost estimate (saving planning time). If it's zero or negative, you can throw the
plan away. Value drives all development, every new commit (businesses exist to make money).

What if you were to come to a network where you had no idea what parts of it were most costly to
modify? You have to start with value first in any search for high weight plans. If you had a network
where you understood the costs everywhere, but no indicator of value, no development would happen.
If you didn't want to e.g. increase or decrease output, the conversation about the plan would never
have happened.

What if you were to come to a network where you wanted to improve it without considering any of your
own values (if e.g. you have none)? You'd have to ask someone who did have values with respect to
the network. Bill Gates was famous for selling products that never existed; he was an early adopter
of the vaporware approach. With vaporware, you can query the market for the value of something
before it even exists or you have any idea how to do it. In issue-tracking systems we often talk
about TODO-x where x is a number; it's possible to estimate the value of a goal before anyone has
any precise (e.g. numerical) understanding of how to do it. Of course, no one would have created the
goal if no one saw value in it.

So where do you start? As previously discussed, most actions have inputs and outputs. For example,
to [](./share-comment.md) you need to have a comment ready in your head and a web app to post it on.
To [](./set-subgoal.md) you need a TODO-x to act on. Until we generate at least one idea
about how to make money, we can't evaluate it (assuming you have no reusable plans or experience).

Said another way, most actions require an imagined world where the input exists as state somewhere
in it (before you apply the function to it). You might say these actions depend on particular state
in the world, in the same way that a target in a build system depends on it's dependencies.

Are there any actions that require no input (depend on nothing) or produce no output (don't define a
target)? If an action didn't produce any output or modify some piece of world state, it couldn't add
value (though many actions only depend on space to "write" to). Similarly, no actions depend on
nothing. Everything we do depends on our own existence; see comments in
[](./update-dependencies.md).

In the language of attention, these inputs are what are focal as you work on the task (the state you
are attending to). When you're planning, you are expanding your focus to all the state that is
necessary to control the state you are interested in changing, which is initially everything you
care about. See [](./expand-focus.md).

What actions involve expanding your focus to your whole life, everything you care about? We could
call these "implicit" actions because they are the first part of the planning subplan (and therefore
are always an action option), even if you have no reusable life experience or reusable plans to go
on. In terms of a git graph, they are always there for you to pick:

```
...
| * Implicit action B
|/
| * Implicit action A
|/
* Now
```

Search for "V" with these implicit actions. For examples of these kinds of actions, see
[](./explore-domain.md).

## No to negligence

We have a million possible actions we could be taking in every moment. Every action you say yes to
is a no to a million others. The power of the answer "no" to people making requests of you is that
you're avoiding tunnel vision on the one action that is focal to both of you (and valuing more than
only your relationship with the person).

[nglc]: https://en.wikipedia.org/wiki/Neglect

When you say no to these million different "wide" subplans, you are effectively picking the "do
nothing" plan on the state they target instead. That is, time leads to effects on state. We often
act only to avoid the consequences of the "do nothing" option (e.g. if you don't take care of the
lawn, your child, etc.). When does value ever go down? The "no-op" action can be expensive and it's
important to include it as another implicit action. See also [Neglect][nglc] and [Negligence](
https://en.wikipedia.org/wiki/Negligence).

It's hard to accept that value can go down. It's also hard to model a world where so many actions
are happening in parallel, rather than you as the agent selecting a single action (of any duration)
from many. Two options for dealing with the problem are to use a service to manage the state, or to
schedule reminders to add actions to update the state.

% TODO-ngl: Is there a better way to avoid neglect than reminders?

## Contrast subplans

When you're down to e.g. 3-4 subplans you often need to "contrast" (i.e. emphasize the differences)
between them to help make a final decision among them. See [](./set-subgoal.md) to improve all 3-4
ideas to add more details until you get to a point where there's a clear weight difference among
them.

Refining the plan on the idea you will end up working on is not a waste of time because you will
need to do it anyways to come up with a first step. It may be a waste to refine the other 2-3 ideas,
unless you end up working on them later (ideally you have stable values, so that you do). Avoid a
bias towards refining the plan on only your currently favored option unless you are willing to make
changes that will hurt its weight (not just decrease the time cost). That is, emphasize the
differences in value rather than cost.

Once you've picked out an item, you must narrow your focus (see [](./narrow-focus.md)) on it. That
is, close all your planning documents and everything else that may be a distraction while you dig
into the topic.
