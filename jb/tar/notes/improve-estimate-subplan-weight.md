# Improve estimate subplan weight

## TODO-ngl: Is there a better way to avoid neglect than reminders?

Is the solution something like "Love" for all the states that you are currently managing? It's hard
to say that anyone really loves their lawn. Or do they? I think it's harder in a business setting to
justify "Love" as being enough. Lawyers run into the same problem trying to make sure developers
think about the implications of their products before they release them. What makes this so hard is
you have to think about all the things you could possibly care about out in the world (lots of state
to consider). Who wants to think about whether the coffee they are making might be too hot for some
people who don't think about that kind of thing? Perhaps we're simply not caring enough to accept
that we should love these people who we think only want money.

The language of "love" is used on this page; you must "love" everyone who "reasonably" could be
affected by your actions or omissions:
- [Negligence](https://en.wikipedia.org/wiki/Negligence)

See also:
- [Decision: Are you controlling your direction at work? - Google Docs](
https://docs.google.com/document/d/1UcpRBwD7jNzdgFlaDGbkUiBJkExaJXvMy2Bro-C00eM/edit)
- [Handle interruption - Google Docs](
https://docs.google.com/document/d/1Y0LbIWeP4wnwm09FsC2YejIMFvrG3wfNtiVQVQaG4ew/edit)
- [HT: Say no - Google Docs](
https://docs.google.com/document/d/11RWbABvkp0aG9cW-PEEq5i5xUvmnbHnMPRwIW0KbD_U/edit)

This problem is particularly tough because it requires so much common sense. The article on
negligence goes into great detail on cause; you have to be able to think about all the effects that
will arise out of an action, not just your intend to causes. Said another way, you have to think
about side effects. We use functional programming to avoid side effects. See:
- [Side effect (disambiguation)](https://en.wikipedia.org/wiki/Side_effect_(disambiguation))

In fact, risk mitigation is a major issue involved in releasing major models like GPT-3; it's hard
to anticipate what might happen with its release.


## TODO-c: Why convert completed TODo to retrospective TODo (in Training Data)?

Before removing any TODo, review what the actual weight should have been. Only you understand your
own values and can confirm that an action was actually high weight. Are you working with others who
have the same values as you or in general getting ideas from the right sources?

To retrospect is an action in itself; you should convert TODo that you've completed to retrospective
items (or training data) rather than delete them. This is especially important for high-cost actions
and actions that you know you'll do something similar to in the future. Reference class forecasting
is about updating your potentially stale priors (if you forget the past) based on data.

Perhaps every time you finish a TODo you should also retro on the time it took you to discover that
TODo (the planning overhead associated with it). Otherwise, you'll never retro on how long it took
to plan. Did you spend 10 hours planning to read 2 hours of external material, that completely
changed your thinking?

Don't forget overly ambitious projects (audit, OFDM). For example, is NLP or RL too ambitious?

What if you only write down a plan but then never pursue it? For example, you don't learn about RNNs
because better methods become available. I'd say to convert these to reminder TODo as well; they'll
help you see what kind of learning tasks didn't end up being valuable as well. Did you learn much
from VGT you use now?

Is to retrospect on some TODo (TODo are clearly actions, but of varying size) to generalize it from
a single training example into the generalized process you have that is associated with it? It seems
like it. All TODo should have similar lifetimes, going from a future/question TODo to a WIP TODo to
a retro TODo. Perhaps retro TODo are simply reminder TODo (what you think of as plain old notes,
eligible for publication); they're what you don't want to forget.

If you are phrasing all TODo as questions, though, you are going to have trouble when you feel you
come to answers and begin to talk in statements (will need to convert the question). This is similar
to how a hypothesis starts as a question, and ends up as a theory. Even as a theory it is always a
"question" in some sense; but we begin to talk in statements as if it's surely true. When you do
this, you lose the connection between the original question (TODO-x) and the "answer" to the
question (typically a .md file).


## Measuring unimportance

How do you identify tasks that are actually not important, but still on your list of things to do?
For example, tasks that were important because they were focal. You could force yourself to limit
your TODo list (the focal git graph) to a certain size. This has the advantage of requiring you to
look at a shorter list when you're deciding what to do next. The primary purpose of this approach is
that you'll be forced to remove items from your list when you aren't doing them because they are
really only important when you are in focused work (in a certain context). This doesn't mean you
won't do them, only that they aren't important enough to be your focus. It seems like this is
similar to `live.md` but now your TODo list is dynamically changing as how you live (what is
important to you) changes and how your model of how to do it changes. What you already know how to
do, for example, is not important to you to relearn.


## Use jb labels for TODO

You often want to use markdown headers with a TODO-xxx so that you can jump to them quickly (with
ctags generation). That's fine to continue to do, but whenever you need a jb-style link between
article sections you should also use the `todo-xxx` for it. This label will persist before and after
completion of the task.


## SHA on TODO

Make todo IDs unique using git SHA. That is, use the git SHA that the question started on. In some ways this is like labeling a todo with how old it is.

It's also indirectly a way of labeling an idea of what you were looking at when you came up with the idea; all the notes you had at that point (recursive/iterative development). Still, it's not like this is *the* one-and-only reference associated with the task. You merge .dvc branches (sometimes multiple) to help communicate what you were looking at when you did something. What if you needed to refer to multiple SHA in your verbal explanation? You may be combining results from multiple things you’ve seen in the past.

The SHA you tack onto a TODO is really more like a timestamp. It's a bit better than a timestamp though because it's significantly shorter (6-7 characters rather than 10 digits for a unix timestamp). You can also increment it whenever you want, like an ID in a traditional system like JIRA. It's also more readable than plain digits. In fact, these short SHA were designed to be similar to IDs but for referencing past commits rather than future tasks.


## What are `a-` and `q-` in the end?

When we talk about project risk, it’s typically in terms of a given plan (an a-) failing. When you try to explain to someone why a project is highly risky, draw out for them the plan and point at the arrows that are unlikely to produce the expected results.

Is there a fundamental difference between an a- and a q-? A q- should really produce multiple a- to test your different conjectures (low probability theories) about what might be causing the issue. But, you can’t take action until you have some a- anyways. Really, you should keep everything q- as long as possible (come up with better a- e.g. experiments rather than a lot). It’s the experimental/theoretical divide. It sometimes seems like the difference between an “a” and a “q” right now is whether it is small enough to do in the short term (small in INVEST). You meant it to be more of a distinction between whether a task was “begging the question” (assuming one answer) or was really open to multiple answers, it seems. You can turn left then right, or right then left, or be told you must absolutely turn right first.


# Cost-weighted git graphs

Could you label the nodes in a git-graph-like planning graph with the cost (typically a time cost, but include all) associated with getting from point A to point B? This would give you a Cost-category. Then you could easily compute costs between where you are and your goal. This would actually make it fun to do planning and estimation (e.g. for Q4). It’d also be a way to communicate why you think some ideas are better than others. Of course, you’d also have to put values on nodes (estimate the value of a goal state). These would be morphisms between sets, often but not always between sets that represent functions with the same domain and codomain. It's still a morphism if not though.

You really like how this makes it concrete that a change in code (commits) costs something. You're essentially planning git commits out for your quarter, as if you had some imaginary large monorepo.

A git graph is a DAG, which is a preorder, which can be turned into a category. The commits are the morphisms, and you can get to any commit from any other in most (not all) repos (lattice) (has all joins). A monotone map between histories would be rewriting history with a rebase that doesn't reorder commits. Your task IDs are the morphisms between the code (making it better), though they often get put on commit messages.


# Review plans

You should have a review-plans.md document similar to a review-code.md document. For example, send the idea to several individuals via text, or more wastefully, by calling a meeting with lots of people. You often wouldn't even want the low-quality feedback you get in a meeting, though.

You don’t need to do backlog grooming if you’re asking each other questions. If two people agree that a question is a good one, then you have enough consensus. Most people don’t want to answer big questions though because it takes a lot of thought. Start their thinking with your own, by making statements to start the question. The best way to solicit questions is probably to be open and honest, and thanking people for their questions. If you’re working in a factory environment then you may want to actually go and ask your people “on the line” how we could be better; they can point at specific things in the material world. This doesn’t work as well when you’re in a conceptual world where different things are focal at different times.
