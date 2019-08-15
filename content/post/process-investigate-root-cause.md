---
title: "Process: Investigate root cause"
date: 2019-05-16
tags: ["debug"]
---

## Value

Software developers spend an incredible amount of time fixing defects and
debugging. If we take the time to reflect on *how* we debug we may be able to
debug faster.

## Overview

This document is addressed to "computer scientists." It roughly follows the
[Scientific process][2]. You should jump back and forth between tasks under
[Develop hypotheses](#develop-hypotheses) and [Test
hypotheses](#test-hypotheses). An investigation is highly parallelizable; let
another developer develop hypotheses while you test.

## Develop hypotheses

### Collect symptoms

Collect detailed symptoms in a single location (ideally your issue tracking
system). Try to see the largest possible context and symptom set in a single
document. Agonize over every word of the exception message, logs, call stacks,
etc.

Every new symptom presents the same problem in a different light. The new
question/perspective may make the root cause obvious to someone involved.

### Ask questions

Eric Raymond claims "given enough eyeballs, all defects are shallow" ([Linus's
Law][1]). Who can you brainstorm with?

Discover who was working in an area recently with git:

```bash
# Find suspicious commits by commit message
git log --grep="log" --grep="thread" --all-match
# Find suspicious commits by directory
git log master -- path/to/broken-library
```

Ask a maintainer or developers who review widely. If they do not know, they
know who to ask.

### Establish a sequence of events

In [Root cause analysis][3] the goal is to build a causal graph between the
root cause and the defect. Download this template causal graph:

![RCA sequence of events](/rca-sequence-of-events.svg)

Causal reasoning is intrinsically based in time, so it is usually helpful to
establish a timeline. Start with a sequence of events including the observed
symptoms:

1. The job starts.
1. A warning is printed.
1. An exception is thrown.

Add timestamps to build a timeline later. Logs are an automatically built
sequence of events.

#### Inspect logs

Manual inspection ideas:

- If you have the source, search for the last or recently logged statements. What
logging statements were not printed?
- Diff broken logs with successful logs to determine when and how the behavior
went off track. Do you have successful logs from earlier commits or variations
on the same scenario?

Check for logs other than the application's (`strace`, `/var/log`).

#### Parse logs

Parse logs with context as a table with a column for every kind of context.
Helpful columns:

| Column | Description |
| ------ | ----------- |
| Function name | Use vim's `:ta` to jump to the function. |
| Thread ID | Critical to separate threads in multi-threaded environments. |

### Inspect program state

Is a running program still available? Connect to it in the debugger, dump call
stacks, and disconnect again quickly to keep the state intact.

If the defect is an uncaught exception or segfault, do you have a core dump?
Dump the call stack.

### Design experiments

Re-run with more detailed logging levels:

- At run time with `-v`, `-vvv`, `--verbose`, `--log-level`.
- In shared libraries (e.g. `AWS_LOG_LEVEL=TRACE`)

As you design experiments, should you prefer logging to debugging to answer
your questions?

#### Advantages

From [Apache log4j 1.2 - Short introduction to log4j][5]:

> … debugging statements stay with the program; debugging sessions are
> transient.

The choice between logging and debugging is an example of the space-time
tradeoff. Logging takes more space; debugging takes more time. In most cases
time is more valuable than computer resources (space).

#### Disadvantages

- Excessive logging pollutes the code base with unhelpful comments.
- The call stack (context) at an exception is easier to digest than verbose logs.

### Research underlying systems

Until at least one individual understands the code at fault, there can be no
continuing hypothesis development. That is, no easy answer is available to a
team stuck in a situation like the following:

![RCA sequence of events](/rca-incomplete-domain-knowledge.svg)

As you read, continue to design experiments to achieve validated learning.

### Standard hypotheses

Common starting points for developing testable predictions.

#### Reject assumptions

Assumptions are theories formed by rejecting a statement you expect to be true.
Using your team's knowledge of the system, produce a variety of statements you
expect to be true.

#### The defect is a regression

Was there any point in the past when the feature worked as expected? Narrow the
range of commits in which the regression was introduced with `git bisect`. Ask
the developers on commits between the broken and working commits for help
developing theories.

## Test hypotheses

### Reproduce in new environments

Reproduce the issue in a more flexible or more easily accessible environment
(e.g. locally). A cloud debug environment can be as good as a local
environment, depending on what you need to test. The goal is to answer “why”
questions faster. Sometimes it is easy to reproduce quickly, but you can’t get
more data to figure out what is going on. For example:

- No `--verbose` flag exists.
- You can’t build the code to add logging statements.
- You can’t debug the code.

If it is not easy to test more than one theory in parallel, reproduce in
multiple environments.

### Reproduce faster

Reduce delay in performing experiments.

#### Human time cost

Reproduce with less manual human time investment. It is easy to become focused
on confirming a single cause. We often have many causes to discover before we
reach the root (it is often better to invest long-term).

#### Computer delay

Finding the root cause will take too much wall clock time if a reproducible
problem has a long cycle time. Imagine discovering an issue that takes hours to
reproduce to test hypotheses:
![RCA naive experiments](/rca-experiment-only.svg)

When feedback is slow and single-thread, ask yourselves: If we did this and
it was as expected, what would we do next? If it takes 3 hours to reproduce you
must think of several “why” questions to ask and get answers to. If it takes 5
minutes to reproduce you can ask one why question.

To reproduce faster, can you:

- Linearly scale down the amount of input to the algorithm?
- Cut out part of the context?

If you can’t reproduce a defect when you run it with reduced context in a new
setting, what context made the difference? The state you need to reproduce
faster is often invaluable for determining what the root cause of the defect
is. You’re effectively narrowing down the problem to where it occurs in both
time and code.

To reduce context/state so you can reproduce faster:

- Check the logs for printed state.
- Call a function lower in the call stack with the same context (arguments).

The final result of reproducing with a smaller amount of context and less wall
clock time is a unit test.

### Reproduce related/previous behavior

To test whether the cause is a particular commit, revert and experiment. To
test whether the cause is somewhere in a range of commits, attempt a git bisect
(many experiments).

[1]: https://en.wikipedia.org/wiki/Linus%27s_Law
[2]: https://en.wikipedia.org/w/index.php?title=Scientific_method&oldid=897409401#Process
[3]: https://en.wikipedia.org/wiki/Root_cause_analysis
[4]: https://en.wikipedia.org/wiki/5_Whys
[5]: http://logging.apache.org/log4j/1.2/manual.html
