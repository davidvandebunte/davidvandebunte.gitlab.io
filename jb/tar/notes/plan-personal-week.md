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

It's what we choose to say yes (and no) to that largely determines our success.

# Test

More accurate weight (priority) estimates on:
- Scheduled calendar plans
- Old plans with new information
- Recently proposed plans

# Estimated cost

## Copy new notes to plain text

For example by copying and pasting emails to yourself. All notes are TODo, even those in email. They
are all *begging* to be read. For example, if they're statements, then you can treat them as a
reminder TODo or training data. If they're large tasks, you can treat them as a standard TODo
(though even reading the story is a reminder of the details of a potential improvement). If they're
a question, then there's implied value in being able to answer the question (effectively a standard
TODo). See [](./convert-to-plain-text.md).

The process of planning should be the process of aggressively pushing down the importance of tasks
you do not think are critical. It's avoiding becoming a slave to yourself and your own notes. That
is, it's the process of *stopping* work and saying no to yourself, critical to delivering more
value. See [](./stay-on-focus.md).

Don't spend half your weekend "copying" notes (i.e. not copying but actually reading and improving
email notes on their way to plain text). This is often shallow work; you're covering many topics and
focusing on none. Instead, copy the notes as quickly as possible (get them in version control and
plain text). Only then clean them up (i.e. read them in detail). Some notes you may not improve on
their way to plain text; just copy and paste.

## Measure Error

[rl]: ./retrospect-on-life.md

[Retrospect][rl] (measure scheduling and software error) on your last week.

## Mandatory Spending

[gcw]: https://calendar.google.com/calendar/r/week

Open [Week View | Google Calendar][gcw]. Check scheduled plans in the next 2-3 weeks for:
- Double-bookings
- Low weight appointments

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

See [](./estimate-subplan-weight.md) for a more general view of planning. Planning at the scale of a
week is about taking a slightly longer view (e.g. 2-3 weeks) so that you don't need to go into as
much planning detail on a daily basis.

Try to focus on one subnetwork (if in JIRA, one epic) to support a large batchsize. Note this
network as the focus of your sprint (sprint goal). The first step in planning is to pick this
"theme" to make your work more efficient.

For plans in your personal life, ask your family for advice or pair programming help. For plans in
your work life, ask coworkers the same.

% ## Process Improvement

% See:
% - improve-plan-personal-week.md
% - improve-implement-feature.md
