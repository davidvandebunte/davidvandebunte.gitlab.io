# Narrow focus

## Estimate value

By closing windows and tabs on your computer, you free up your limited attention for other tasks;
see [](./maintain-focus.md) and [](./expand-focus.md). You also provide temporary mental rest. In
the context of code, you help your team avoid drowning in software. Your notes, windows, tabs, and
code repositories do not automatically forget as your mind does; you must use manual memory
management.

### Curiosity

Curiosity is overlearning; you're not being driven by any "value" error signal but only an error
signal to reduce the difference between reality and your mental model (ideally). It's increasing
your batch size in some area you believe will be important in the future. In some way, it's the
"nice" side of focal is important.

### Execution-based prioritization

A major advantage of execution-based prioritization is that it's cheap way to prioritize that
probably works well enough most of the time. It's essentially a MRU list (see Algorithms to Live
By). If it's focal that means we're executing the mental function and so it's a reasonable heuristic
to assume what is focal is important (if we what we do is important). Said another way, this
heuristic assumes we control our focus so what we focus on is the highest value task out there. But,
this only works if you are executing an important function.

Said another way, the most important technical debt is likely the debt in the code that you use most
often (read most often). You’ll naturally see these tasks more often and think about them more just
because you’re in the area. This is related to how you believe something is more common when you
hear about it more (Bayesian priors and the news). See also [Thinking With Your Thumbs - Part 1 |
Travis White Communications](
https://traviswhitecommunications.com/2012/12/03/thinking-with-your-thumbs-part-1/).

## Design test

Reduce the cardinality of the set of goals you are attempting to attend to. Do you intend to narrow
your focus over the short term, medium term, or long term? Ironically, making space for e.g.
medium-term goals requires a short-term goal to clear open windows and tabs (making space, removing
distractions).

## Estimate cost

### Short

% See also `close-window.md`

Keep the `vim` window you want most focal all the way to the left, so it's next to your browser (and
you can make multi-modal connections across them). See [Vim: Move window left/right? - SO](
https://stackoverflow.com/questions/4556184/vim-move-window-left-right). That is, put the "big
picture" windows to the right (because you should need to visit them less often; they are more
permanent).

When you need to close windows, tabs, etc. on your computer, this also lets you process from the
left to the right. Close browser tabs (least permanent), then the leftmost `vim` window, then as
many other vim windows as you feel is appropriate. You often leave vim windows open as a reminder to
attend to some alternative goal.

Wear headphones with white noise in the presence of stimuli that are likely to produce exogeneous
orienting of your attention. Headphones help you avoid hearing anything not worth writing down or
changing your train of thought, even while going to the bathroom or getting a snack. You often need
to confirm your headphones are on, and even quiet white noise lets you avoid this nervous check.

% Doc: Should you wear headphones?
% https://docs.google.com/document/d/11vV6h5TSu8CP5hl7pYL_cQL8jcbLZw81Pewfe7AMo6Q/edit

### Medium

Look at how many uncommitted changes you have and get them into a git commit. You often leave
uncommitted changes as small goal states. That is, with a goal to save them off in an "organized"
place or at the least save them into an "organized" commit. Still, to save time when you're
narrowing your focus it's perfectly fine to collect many of these miscellaneous additions into an
"Add miscellaneous notes" commit. The advantage of leaving some content uncommitted is you'll easily
be able to look it up (though you could do the same with git logs).

### Long

[sne]: https://mail.google.com/mail/u/0/#snoozed
[gcw]: https://calendar.google.com/calendar/r/week

Go through [snoozed emails][sne]. Open [Week View | Google Calendar][gcw] and search in the next 2-3
weeks for double-bookings and low weight appointments. Convert emails-to-self to plain text as
described in [](./convert-to-plain-text.md).

Archive code or notes so that you don't see them in a `git grep`. All your code and notes should be
associated with some goal. It's often easier to actually search for notes you may be able to remove
as you work on a canonical process; see comments in [](./expand-focus.md) associated with searching
for terms as you start work on improving a process.

### Focal is important

A quote from [Daniel Kahneman](https://en.wikipedia.org/wiki/Daniel_Kahneman) from [Pre-Suasion -
Google Books](https://www.google.com/books/edition/Pre_Suasion/RmOdCwAAQBAJ?hl=en&gbpv=0):

> Nothing in life is as important as you think it is while you are thinking about it.

See also [focal is causal | Travis White
Communications](https://traviswhitecommunications.com/tag/focal-is-causal/).

#### Lacks outside input

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

#### Showing meaningless progress

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

#### Assumes one possible way

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
