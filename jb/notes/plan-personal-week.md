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

More accurate weight estimates on:
- Scheduled calendar actions.
- Old actions with new information.
- Recently generated actions.

Smaller and more detailed action items to:
- Reduce action costs.
- Deliver most value without all of it.

# Value

This process promises value in weight differences from reordering items. Include uncertainties on
weight estimates to help you decide wnen to move your "focus" to a nearby area instead (or start
again from the top).

To add weights to new actions you would theoretically need a static:
- Model of your life's computational graph with output measurements.
- Utility function on your life's outputs to produce value measurements.

An action would then take your life's current computational graph and produce a potentially improved
computational graph. Next you would estimate how life outputs would change, how much this would
affect your values, and then (if all went well) make the change.

Notice that your life's computational graph is a recursive artifact, best captured in the current
state of your notes. Every step you take (whether a commit you make while planning, improving
specific notes, or code) is presumably an incremental one in a better direction. The primary
difference is that when you're planning, you're typically taking a view from closer to the top (or
higher levels, avoiding details).

Said another way, it is often the case that low-cost higher-level actions can help you accept or
reject lower-level high-cost actions without incurring the whole cost. This process suggests
low-cost higher-level actions (effectively heuristics). Call these high-cost actions "potential"
actions to be clear, or simply high-cost actions.

# Cost

## Measure Error

[rl]: ./retrospect-on-life.md

[Retrospect][rl] (measure scheduling and software error) on your last week.

## Review Mandatory Spending

[gcw]: https://calendar.google.com/calendar/r/week

Open [Week View | Google Calendar][gcw]. Check scheduled actions in the next 2-3 weeks:
- Double-bookings.
- Low weight scheduled actions.

If you have a weekly reminder and don't want to make it less frequent, it's by definition more
important to you than less frequent reminders. Publish it before other reminders; set the TODo
priority to the reciprocal of the frequency (in days) to remain consistent.

## Review Discretionary Spending Budget

[sg]: https://www.scrumguides.org/scrum-guide.html#events-planning

Estimate schedulable time (assuming some interruptive work) from your calendar. Decide how long you
want to refine weight estimates before starting. Write your timebox duration down if it's more than
an hour. Use as an anchor a 5% timebox, based on [Sprint Planning | Scrum Guide][sg]:

> Sprint Planning is time-boxed to a maximum of eight hours for a one-month Sprint. For shorter
> Sprints, the event is usually shorter.

## Generate Actions

The sum of all your life values is the combination of all the "Value" sections in every document,
and the "Cost" sections represent your computational graph. How you spent your time in the last week
(which you covered in the retrospective) should reflect these values. Generate new actions with
backpropagation by inspecting the output of the last week and asking how it should change (top-down,
high value).

Take time to review the latest research in your field, searching for solutions to the problems you
care about. Said another way, just as you recursively improve the artifact that is your own notes,
you need to keep track of the larger artifact of all human knowledge. In practice, this means much
of your public notes will be links to other's notes.

## Refine Actions

Refine action weight estimates by searching for TODo and tackling the highest weight (bottom-up, low
cost).

% See improve-implement-feature.md for the details of this system.

## Select Actions

In the end, you must have a global view to optimize (neither top-down or bottom-up is enough). That
is, you must regularly make a tough decision on whether to pull from the bottom or push from the
top.

% See organize-notes.md for the importance of a clean life network for the sake of prioritization.

Try to focus on one subnetwork (if in JIRA, one epic) to support a large batchsize. Note this
network as the focus of your sprint (sprint goal).

For actions in your personal life, ask your family for advice or pair programming help. For actions
in your work life, ask coworkers the same.

% ## Process Improvement

% See:
% - improve-plan-personal-week.md
