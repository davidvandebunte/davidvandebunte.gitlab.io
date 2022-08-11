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

# Retrospect on life

A recording of:
- Time costs
- Action weights (on completed actions, when possible)

It's not enough to retrospect on just the past week. You often don't know whether an action you took
was a good idea until years later. For example, many actions you take are justified based on the
expected payoff over a course of years (e.g. going to college, getting faster feedback in some area
of code). You won't know until much later whether your investment paid off. If you need to
retrospect on items like these, then you may have:
- New calendar reminders or snoozed emails

# Value

More accurate weights on high-cost actions.

# Cost

Are you doing the weightiest actions? What is the scheduling function that selected the actions you
took? In your case your function is the planning function you used at the start of the sprint, e.g.
a sort of E[**V**]/E[**E**] on all the actions you were aware of at the start of your timebox (right
now, based on a search for TODo).

Run a `git grep` for the TODo you removed in the last sprint (filter to e.g. one week ago). Every
completed TODo will generate a statistical error (or disturbance); see [Errors and residuals -
Wikipedia](https://en.wikipedia.org/wiki/Errors_and_residuals#Introduction) applicable to your
estimation functions. If you don't know yet whether a TODo was a good investment, then snooze an
email reminder for when you think you'll know (or add a calendar reminder). All of these errors can
be vectors or tensors, not just scalars.

## Generate Actions Error

What new high weight actions did you discover this week? Run a `git grep` for the TODo you added in
the last sprint (filter to e.g. one week ago). If you had known about them at the start of the
sprint, would you have done them instead?

How did you discover them? For example:
- Bugs, complaints, and errors
- Drastically lower cost ways to complete a feature

## Refine Actions Error

### Test Error

Was the change in output as large as expected? Theoretically, measure E[**T**] - T.

### Value Error

Are you still doing high value work? Is the function from an output delta to a value delta stable?
Theoretically, measure E[**V**] - V.

### Cost Error

Did it take you as long as predicted? Theoretically, measure E[**E**] - E.

#### Planning Error

Did you spend or too little time planning? Adjust the heuristic you use to decide how long to plan
together or separately (e.g. 5% of your time).

#### Count interruptive actions

Measure (acknowledge) where time was spent so you're aware of problems; don't forget the fixes you
do. Record your time costs as expected value (in time savings) on a new or existing task to prevent
the interruption.

Did you properly handle interruptions, staying on focus? See [](./maintain-focus.md).
- [](./handle-interruption.md)

## Backprop Errors

You should be able to backprop these errors into your estimation functions. If your estimation
function is primarily based on previous experience (i.e. reference class forecasting) based on a
population of training data effectively stored in your head, all you need to do is observe the
difference. That is, update your priors.

Sometimes you'll have also estimated based on first principles and need to think about what theory
you got wrong.

% # Training Data

% Uses this process:
% - retrospect-on-team-life.md

% Ask Marin or your kids for a family meeting:
% - conduct-family-retrospective.md

% Ask for a [family weekly planning meeting][fwpm] with your family.
[fwpm]: https://docs.google.com/document/d/1HjGQSigPPYrSC2Yu4Ik7niZz2B71s2SLuCbwf5Gyq-U/edit
