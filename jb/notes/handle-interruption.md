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

# Handle interruption

# Value

It's hard to estimate the value in a typical request from someone else unless you know them; if so
you can use reference class forecasting.

# Cost

## Really listen

Don’t assume the worst; really listen.

## Form a temporary team

It's important to do just-in-time planning in order to:
- Parallelize.
- Reduce total work by avoiding and grouping tasks.
- Get outside input on the proposed solution.
- Have reviewers ready to get the code merged.

## Special case: Build failure

What if you ran into an intermittent build failure that happened 1 in a million builds? Is it worth
digging into fixing it? You should always put a value on reproducibility in any context. People
working on network services get this; they only promise e.g. 99.9% reliability in SLA. You should
always include an SLA as part of any task you perform; see [](./estimate-improvement-value.md).

Yes, build failures take you out of focused work, but you can fix them later. What if the product is
only going to be sold a few more weeks? Is the future value that the test will provide greater than
the cost you will put into fixing it?

Consider throwing away the information. If you don't need an exact reproducibility percentage
(e.g. 80%) then you can simply keep track of how often you get failures in your head (and don't care
if you forget). Hit retry, and hopefully you'll see a pass.

Consider summarizing what you learned from the failure (if you looked into it) in an email
responding to GitLab's email on the topic. Forward that email into the future, and you'll eventually
collect a bunch of short summaries of what went wrong in a variety of intermittent failures. In
fact, if you know the issue is intermittent (the test passed at least once during the night) then
you can snooze it without doing even basic analysis. Perhaps snooze everything to Monday mornings.
Which are most regular or important?

Don't feel you need to document every failure in plain text. If you aren't going to fix the problem,
then when the code changes (e.g. you work on something else) you can expect your documentation to be
out of date. The more the code changes the less valuable the code comments will be; eventually you
will just delete them.

On the other hand, issues only sometimes fix themselves and you may be living with the problem for a
long time if you don't fix it. Could it be visible to external customers? If you know where in the
code the issue is coming up because you have a stack trace, then point to the issue from the top of
that trace (the first point in your code). This will let you collect failures in the longer term.
Consider commenting out the code completely at this point, or deleting it (i.e. leaving it in
version control) with a comment about it's previous existence and links to to the failed build tags
(perhaps in a separate .md file). Does the test have intrinsic or instrumental value?

If you feel you should fix the issue, first measure reproducibility (this also helps ensure focal is
not important). If you are already regularly stress testing (see [](./regularly-stress-test.md))
then you should be able to look this information up. If you feel the intermittent issue is new, then
start e.g. 5 new pipelines to measure reproducibility; you can cancel them once you have a theory
(but one pipeline will not be enough).

% Moving from:
% - [Process: Handle Interruptions][phi]

[phi]: https://docs.google.com/document/d/1Y0LbIWeP4wnwm09FsC2YejIMFvrG3wfNtiVQVQaG4ew/edit#
