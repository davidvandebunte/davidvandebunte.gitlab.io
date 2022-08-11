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

# Plan personal week

It's what we choose to say yes (and no) to that largely determines our success. This process
specializes [](./estimate-subplan-weight.md) to the duration of a week and batches the process to
e.g. 3-4 subplans you consider important. Planning at the scale of a week is about taking a slightly
longer view (e.g. 2-3 weeks) so that you don't need to go into as much planning detail on a daily
basis.


# Test

More accurate weight (priority) estimates on:
- Scheduled calendar plans
- Old plans with new information
- Recently proposed plans

# Estimated cost

## Measure Error

[rl]: ./retrospect-on-life.md

[Retrospect][rl] (measure scheduling and software error) on your last week. It's tempting to do this
while you're copying notes to plain text; it's better to do this once everything is converted. In
general, try to [](./narrow-focus.md) to get away from focal work (focal is important).

## Discretionary Spending

Estimate schedulable time (assuming some interruptive work) from your calendar. Decide how long you
want to refine weight estimates before starting, or whether the time you have should only be spent
thinking about priorities. Should you spend more time "doing" (building or modifying specific nets)
or "planning" (backpropagating on your values)?

## Generate Actions

The sum of all your life values is the combination of all the "Value" sections in every document,
and the "Cost" sections represent your computational graph. How you spent your time in the last week
(which you covered in the retrospective) should reflect these values. Generate new plans with
backpropagation by inspecting the output of the last week and asking how it should change (top-down,
high value).

## Refine Actions

Refine plan weight estimates by searching for new TODo since your last planning session, and
considering them within the bigger picture. Usually you can identify these with a `git diff` of the
source code that holds your TODo.

## Select Actions

In the end, you must have a global view to optimize (neither top-down or bottom-up is enough). That
is, you must regularly make a tough decision on whether to pull from the bottom or push from the
top. See [](./organize-notes.md) for the relative importance of a clean life network for the sake of
prioritization.

Try to focus on one subnetwork (if in JIRA, one epic) to support a large batchsize. Note this
network as the focus of your sprint (sprint goal). The first step in planning is to pick this
"theme" to make your work more efficient.

For plans in your personal life, ask your family for advice or pair programming help. For plans in
your work life, ask coworkers the same.

% ## Process Improvement

% See:
% - improve-plan-personal-week.md
% - improve-implement-feature.md
