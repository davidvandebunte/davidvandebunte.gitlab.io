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
weight estimates to help you decide when to move your "focus" to a nearby area instead (or start
again from the top).

To add weights to new actions you would theoretically need a static:
- Model of your life's computational graph with output measurements.
- Utility function on your life's outputs to produce value measurements.

An action would then take your life's current computational graph and produce a potentially improved
computational graph. Next you would estimate how life outputs would change, how much this would
affect your values, and then (if all went well) make the change.

Notice that your life's computational graph is a recursive artifact, best captured in the current
state of your notes. Every step you take (whether a commit you make while planning, improving
specific notes, or code) is presumably an incremental one in a better direction.

Said another way, it is often the case that low-cost higher-level actions can help you accept or
reject lower-level high-cost actions without incurring the whole cost. This process suggests
low-cost higher-level actions (effectively heuristics). Call these high-cost actions "potential"
actions to be clear, or simply high-cost actions.

# Cost

## Consolidate (convert) new notes

In plain text, for example by copying and pasting emails to yourself. All notes are TODo, even those
in email. They are all begging to be read. For example, if they're statements (training data), then
you can treat them as a reminder TODo. If they're large tasks (additional training data), you can
treat them as a traditional story (where even reading the story is a reminder of the details of a
potential improvement). If they're a question, then there's implied value in being able to answer
the question (effectively a story again).

The process of planning should be the process of aggressively pushing down the importance of tasks
you do not think are critical. It's avoiding becoming a slave to yourself and your own notes; the
notes in your email and the notes that are focal (that you've scored highly because they are focal).
That is, it's the process of *stopping* work and saying no to yourself, critical to delivering more
value. See also [](./stay-on-focus.md).

Don't spend half your weekend "copying" notes (i.e. reading and improving email notes on their way
to plain text). Copying like this is often shallow work; you're covering many topics and focusing on
none (even though you are organizing notes, which you consider "good" in general). Instead, copy the
notes as quickly as possible (get them in version control and plain text) putting the same TODo
score on all of them (your current highest). Only then clean them up (i.e. read them in detail).
Some notes you may never read while they on their way to plain text; just copy and paste.

## Measure Error

[rl]: ./retrospect-on-life.md

[Retrospect][rl] (measure scheduling and software error) on your last week.

## Mandatory Spending

[gcw]: https://calendar.google.com/calendar/r/week

Open [Week View | Google Calendar][gcw]. Check scheduled actions in the next 2-3 weeks:
- Double-bookings.
- Low weight scheduled actions.

If you have a weekly reminder and don't want to make it less frequent, it's by definition more
important to you than less frequent reminders. Publish it before other reminders; set the TODo
priority to the reciprocal of the frequency (in days) to remain consistent.

## Discretionary Spending

Estimate schedulable time (assuming some interruptive work) from your calendar. Decide how long you
want to refine weight estimates before starting, or whether the time you have should only be spent
thinking about priorities. Perhaps the best indicator of whether you should spend more time "doing"
(building or modifying specific nets) or "planning" (backpropagating on your values) is whether you
feel confident the action you are taking next is what you want.

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

Refine action weight estimates by searching for score TODo and tackling the highest weight
(bottom-up, low cost).

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
