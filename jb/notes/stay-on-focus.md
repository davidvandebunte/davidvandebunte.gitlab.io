---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    Format_version: 0.13
    jupytext_version: 1.11.5
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Stay on focus

Stay in focused work, rather than move on to something else.

Contiguous connected thoughts are a way to measure the degree to which you're in focused work. You
can get this looking out the window of your car while driving (e.g. while being the driver), or from
talking to someone. I'd say arguing is a good way to get into focused work (e.g. with your family or
any coworker). Is this why some people like to argue?

Use your fingers not only for mental lists but to help you remember what you were thinking about,
when you don't have a person or writing tool to keep you on track.

When you're in focused work, you tend to not need to eat unless you're quite hungry.

# Value

## To assign work

Some people spend all their time making work focal, so it becomes more important in other people’s
minds, so it gets done. Use this strategy when you take the time to analyze work and discover it is
high weight; send an email with your analysis to a large group of people just to make it focal
enough that someone does it or you get the green light to assign it to someone. See
[Pre-Suasion, A Revolutionary Way to Influence and Persuade - Google Play Books](
https://play.google.com/books/reader?id=RmOdCwAAQBAJ&printsec=frontcover&pg=GBS.PA367.w.2.0.161).

## Curiosity

Curiosity is overlearning; you're not being driven by any "value" error signal but only an error
signal to reduce the difference between reality and your mental model (ideally). It's increasing
your batch size in some area you believe will be important in the future. In some way, it's the
"nice" side of focal is important.

## Execution-based prioritization

A major advantage of execution-based prioritization is that it's cheap way to prioritize that
probably works well enough most of the time. It's essentially a MRU list (see Algorithms to Live
By).

If it's focal that means we're executing the mental function and so it's a reasonable heuristic to
assume what is focal is important (if we what we do is important). Said another way, this heuristic
assumes we control our focus so what we focus on is the highest value task out there. But, this only
works if you are executing an important function.

Said another way, the most important technical debt is likely the debt in the code that you use most
often (read most often). You’ll naturally see these tasks more often and think about them more just
because you’re in the area. This is related to how you believe something is more common when you
hear about it more (Bayesian priors and the news). See also [Thinking With Your Thumbs - Part 1 |
Travis White Communications](
https://traviswhitecommunications.com/2012/12/03/thinking-with-your-thumbs-part-1/).

## Limited memory

We focus on training an extractor network separately from a detector network (for example) to get a
better result overall. So we prioritize different areas of the network; we have to because of our
limited memory. It's difficult to decide which area needs the most work; we need everyone who is
working on the network (executing it) to make suggestions on what areas have the highest-weight
∂Model to do, but we also have to understand each other without studying every area in detail.

### Temporary cost decrease

Let's say you're able to recall something you're read in the last hour with probability 0.8, in the
last day 0.6, and the last week 0.4. These are like levels of memory (cache, RAM, disk) not only in
speed of recall but in the likelihood you will be *able* to recall. When you recall the past day or
week, you'll build more mental connections to help future recall. When you switch focus, you're
going to be able to recall many things from the last week or day that you simply won't need to
recall (inefficient, fewer connections built).

As we get older we're able to recall farther into history than a child can; we need to because we
have more history (we can recall to e.g. ten years ago). Perhaps we trade off this ability for
plasticity.

# Cost

In short:

> Nothing in life is as important as you think it is while you are thinking about it.

Source:
- [Pre-Suasion - Google Books](
https://www.google.com/books/edition/Pre_Suasion/RmOdCwAAQBAJ?hl=en&gbpv=0)

This quote is from Daniel Kahneman; take more notes in [Daniel Kahneman](
https://en.wikipedia.org/wiki/Daniel_Kahneman). See also [focal is causal | Travis White
Communications](https://traviswhitecommunications.com/tag/focal-is-causal/).

## Maintenance

See focused work like sleeping. What takes you out of focused work?

Thoughts about work or life politics are also an issue; you usually need to just work through these.

Getting cocky and day dreaming. To bring yourself down, consider what you've done rather than what
you're going to do.

Extra browser tabs can be a distraction; use F11 so you can't see them.

Gmail and Outlook are more distracting than plain text notes.

Needing to go to the bathroom or hunger.

Previous time in a "thinking fast" mode makes it hard to focus. The more you think slow, the better
you get at it.

## Lacks outside input

PBI should show up in discussion several times (say a minimum of three times) before they can be put
on a sprint. Give engineers time to sleep on the problem and brainstorm a variety of solutions while
working on other problems. Part of being negotiable.

Why do you even need to write down action ideas to come back to them later? When you're doing
backlog grooming you're often frustrated by the number of actions you have and the minor differences
in weight between them.

One major reason is to avoid what is focal is important; you can easily get lost in implementation.
When you write ideas down (even if you take the action the next day) you force yourself to reassess
the value twice.

A second reason is to give yourself time to improve the action, such as lowering the cost. You
recently thought of several ideas in model evaluation that would take you only a few hours and get
you tons of benefit; an action that rightfully jumps to the top of your backlog. Later, you think of
a way to make the action only take 15 minutes. Even though the action was highest weight, it was
also new. You can usually easily work in other areas of your life network while you let good ideas
improve.

Similarly, you can get improvements to your ideas (perhaps ideas that are already good) from other's
feedback.

## Showing meaningless progress

A major danger in execution-based prioritization is the tendency of humans to look for "success" and
begin to work on only the parts of the network they feel they have control over, have the most
expertise in, or just want to work on (the best work). This can lead to some engineers becoming
production-focused, some research-focused, etc.

Said another way, to backprop on your whole life, execution-based prioritization assumes you only
need to understand where you spend the most time (just like you look at your greatest loss examples
first in any other domain). But, are you executing the most important functions? Are you considering
all possible actions, or only doing what you know? You not only need to "execute" as large as
possible a part of the function/network as you can to make sure you're seeing the big picture on
what needs improvement, you need to consider actions that aren't regular for you.

On at least some of these documents, we say the task is valuable because we spend so much time on
it. Spending time on something doesn't make it valuable; making it faster to do something we do
regularly is important but only if we are doing important things regularly.

## Assumes one possible way

Let's say you are working on some coding task and see some other code that "needs" cleaning up. That
is, if it was cleaned up it would help your current cause (help you reach your goal, finish your
action) and other goals as well.

What you're really starting on is another refactor subtask (a separate action) that you should do
some analysis on before starting. But, the reason you saw a need for it is because you're in focused
work on some other action and in order to complete that action you would benefit from completing
this "side" action. You can add the benefit to speeding up your current action and many other future
actions to the benefit of working on your side task.

If you look far enough into the future (include enough future actions) then you're almost surely
going to be able to justify the side task. What if you are in your personal notes and refactoring
will affect your whole life, not only the time at your current company? What if you considered
future actions by others, beyond your time at a company, or beyond your own life?

The issue is often that you are considering only your own solution. In many cases, someone else is
going to simply provide a solution for you. At the extreme, you've even seen a broken build fix
itself because you had unpinned packages and someone upstream fixed an issue, automatically fixing
your build.

At some point you need to do future discounting, because you simply don't know what other solutions
will exist in the far future. Would you have predicted neural nets in 2010? Would you have predicted
Kubernetes, `bazel`, or `golang`?

You should only do a large task if you run into it several times, and it's clearly not going to fix
itself. There's a lot to be said for ignoring errors, if you're able to.

You need to be able to get out of focused work to find other actions that get you to where you're
going faster than only the actions you know how to do. How would you ever get anything done if you
were the only person in the world, with no input from others? We build on the shoulders of giants.

What if you were an hourly worker with a high school education? Would you spend all your time trying
to save 5 minutes/day trying to get out of bed faster, when you really need to switch careers?
Trying to save time on only the things you're already doing in only the ways you already know how to
solve the problems is unlikely to lead to lead to major time savings. If you only try to save time
on tasks you're already doing (like writing code) you may miss research that shows much faster ways
to do what you want (like machine learning). Perhaps the answer is to read more widely; to always be
up on the latest research.

Said another way, your planning is only considering how to refine actions rather than generate
actions. See [](./plan-personal-week.md).
