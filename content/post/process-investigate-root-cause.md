---
title: "Process: Investigate root cause"
date: 2019-05-16
draft: true
tags: ["debug"]
---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Develop hypotheses](#develop-hypotheses)
    - [Collect other symptoms](#collect-other-symptoms)
    - [Standard hypothesis: The defect is a regression](#standard-hypothesis-the-defect-is-a-regression)
    - [Research underlying systems (read code)](#research-underlying-systems-read-code)
        - [Advantages](#advantages)
        - [Disadvantages](#disadvantages)
    - [Collaborate](#collaborate)
    - [Establish a timeline](#establish-a-timeline)
        - [Logs](#logs)
        - [Debugger](#debugger)
- [Test hypotheses](#test-hypotheses)
    - [Reproduce with less human effort](#reproduce-with-less-human-effort)
    - [Reproduce faster](#reproduce-faster)
    - [Analyze a core dump](#analyze-a-core-dump)
    - [Reproduce in a debugger](#reproduce-in-a-debugger)
- [Assumptions](#assumptions)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Software developers spend an incredible amount of time fixing defects and
debugging. A standard framework for root cause analysis can save significant
amounts of time.

The goal is to build a causal graph between the root cause and the defect.
Visually, the goal is to reveal a graph similar to:

![RCA sequence of events](/rca-sequence-of-events.svg)

Every defect can be attacked from a variety of angles; tasks are highly
parallelizable. Individuals should take the tasks with the greatest time
savings / time cost ratio.

## Develop hypotheses

Put likelihoods on all theories proposed to help decide whether to continue to
develop theories or start to test them.

Eric Raymond claims "given enough eyeballs, all defects are shallow" (see
[Linus's Law][1]). It is probably enough to limit your interruptions to 2-4
other developers. Suggestions:

- Discover who was working in an area recently with git. A fresh mind may be
  better than the one that designed the system:

  ```bash
  $ git log --grep="Sine" --grep="COLA" --all-match
  <suspicious commits>
  ```

- Pull in developers who review widely; you may find someone knows someone else
  who submitted code in an area recently.

The developer leading the investigation does not need to be intimately familiar
with the code at fault. The team may still be able to generate hypotheses when
we see new data because others understand the domain.

### Standard hypothesis: The defect is a regression

Build failures are almost always regressions. Was there any point in the past
when the feature worked as desired? Try to narrow the range of commits in which
the regrestion was introduced. Send an email to only the developers on commits
between the broken and working commits to help develop theories.

### Standard hypotheses: Reject assumptions

Assumptions are theories formed by rejecting a statement you expect to be true.

### Collect detailed symptoms

Potential time savings:

- Another symptom can present the same problem in a different light that makes
  the root cause obvious to someone involved.
- Symptoms are equivalent to new questions for restarting the scientific
  method, and the right question can jump you to the root cause.

Process:

- Describe the fault/problem/defect in detail.
- Agonize over every word of the exception message and all logs.
- Establish the initial set of symptoms that look related to the defect.
- Inspect logs and call stacks for suspicious activity.

### Research underlying systems

Potential time savings:

- Until at least one individual understands the code at fault, there can be no
  continuing hypothesis development or resolution of the defect. That is, it is
  easy to end up in a situation like the following:
  ![RCA sequence of events](/rca-incomplete-domain-knowledge.svg)
  Eventually, someone needs to understand the code no one available
  understands. Stop beating around the bush and understand code the team has
  ownership of.
- It is often better to be reading code than writing it. You only learn when
  you are reading, unless the writing quickly leads to validated learning.

Process:

- Read code so far identified as the source of the defect at a higher level
  for a bigger picture.

### Establish a timeline

Debugging of functional code is easier because state/context is easier to get
(root cause analysis).

In functional programs, the context is visible all the way up the call stack.
You don't have state scattered all over.

Potential time savings:

- Causal reasoning is based in time; so establish a timeline (or sequence of
  events) with the observed symptoms. The causal graph will often quickly
  follow.

Is the defect a regression? Diff the current logs with past successful logs
to determine when and how the behavior went off track.

The amount of time passed is sometimes relevant. Did the executable crash
immediately after the last log statement, or run for a few more seconds?

#### Decision: Prefer logging to debugging?

##### Advantages

- The choice between logging and debugging is an example of the space-time
  tradeoff. Logging takes more space; debugging takes more time. In most cases
  time is more valuable than computer resources (space).

#### Logs

A log with timestamps is a timeline:

```bash
Wed Mar 07 12:27:28 2012: Everything appears fine.
Wed Mar 07 12:27:29 2012: What does this mean?
Wed Mar 07 12:27:30 2012: Error!
```

Add context logging. Context logging makes logs a table, with an additional
column for every kind of context. Common columns:

- Function name. Use vim's :ta to jump straight to the function from the
  name.

Turn up logging levels temporarily (-v, -vvv, --verbose). Consider logs other
than the application's (strace, /var/log). 

Prefer log statements so you get permanent code changes? Argument for logging
over debugging: http://logging.apache.org/log4j/1.2/manual.html

In open source code you can narrow down where the crash occurred by asking:

- What was the last logging statement to be printed? In every function of your
  assumed call stack.
- What was the first logging statement that was NOT printed?

1. For every symptom, try to find an equivalent manifestation of it in the logs
   between where you can see the symptom clearly and where you aren’t sure it
   has started.
    - While you do this, you’ll be reading extremely relevant code to what will be
      the solution. Start from the logging where you see the symptom and work
      backwards adding more logging. You’ll become less and less certain that the
      logging you are adding is going to be as you expect as you work backwards in
      time; once you’re totally unsure what it’s going to print then run the job
      again.
        - Should you do this only once you’re down to a set amount of code?
          Perhaps 300 lines?
        - Why not also work forward from where you don’t have the symptom?

#### Debugger

Add a breakpoint on the logging statement before a crash occurs, then step from
there until the logging statement that you know was missed. The breakpoint may
need to be conditioned on certain state you took from logging.

## Test hypotheses

By asking “why” you may actually figure out how to reproduce the problem
extremely fast (jump straight to the root cause). If you can answer “why” to
the most obvious symptom, you enter an area of risk though. What if you answer
the “why” incorrectly? Go through a chain of “why” questions until you’re at
50% (or below?) confidence you understand what is going on? I’d say even lower
than that before putting effort into understanding the code. You only give up
when you can’t think of 50% or better theories.

### Inspect historical behavior

To test whether the cause is a particular commit, revert and experiment. To
test whether the cause is somewhere in a range of commits, attempt a git bisect
(many experiments).

### Reproduce faster

#### Human time cost

In general, reproduce with less human effort (not just faster for the
computer). We could confirm that one cause is as we expect, but if takes
significant manual effort to perform the experiment we are better off just
understanding what could lead to the problem before we experiment again.

#### Computer delay

If you can come up with root cause from just the exception message, you can try
a local experiment to reproduce the issue and save a ton of time iterating.

It’s really not about being able to reproduce faster, it’s about being able to
answer your “why” questions faster. Sometimes you can reproduce quickly, but
you can’t get more debug messages to figure out what is going on because there
is no --verbose flag or you can’t build the code and add debug statements or
you can’t debug the code.

If it takes a long time to test hypotheses (e.g. hours) you can spend downtime
either developing more hypotheses or studying how to test hypotheses faster (a
long cycle doesn't imply you must spend no time creating hypotheses).

* Reaching the root cause will take forever if you never improve your tooling
  and narrow down on the problem. Imagine discovering an issue that takes hours
  to reproduce and using only logging statements to test hypotheses:
  ![RCA naive experiments](/rca-experiment-only.svg)
* If it takes 2 minutes to reproduce the problem, it makes little sense to put
  hours into reproducing it even faster.
* If you can reproduce in a test that takes less than one minute you can just pull
  state from the debugger for your unit test (tedious to print all the state you
  need as log statements).
* The longer it takes to reproduce, the more time you should spend cutting
  down the time to test hypotheses.

If it's not easy to test more than one theory in parallel, there is even less
reason to kick off experiments.

If we did this and it was is as expected, what would we do next? Often
necessary when feedback is too slow.

Obviously if it takes 3 hours to reproduce you have to think of several “why”
questions to ask and get answers to. If it takes 5 minutes to reproduce you can
ask one why question and quickly get the answer to it.

* Reproducing faster for the sake of reproducing faster. If you can't add debug
  the issue faster or get new logs faster, there's no point in reproducing
  faster.

To reproduce faster, can you just linearly scale down the amount of input to
the algorithm? Only possible if you don’t think there is anything special about
your input that is causing the problem.

Don’t ask “why” a particular defect is occurring. Ask “why” you can’t reproduce
it when you run it with similar context in a new setting (ask what
context/state is different). The context/state you need to reproduce more
quickly are the most valuable clues for determining what the root cause of the
defect is; you’re narrowing down the problem to where it occurs in time (and
code, by knowing the state and which functions to apply it to).

To find context/state that will help you reproduce faster (without even having
to use the core dump, if you’re still working on getting that). Check the logs.
Add more logging statements to print state that would be relevant to
reproducing this problem more quickly, but also any similar problem. Ideally
you can print this state in a way that you can serialize it back into a unit
test (serialize to and from a string).

When you narrow the problem and can’t reproduce, it means you got the state
going into the code that is failing wrong. Check all your state assumptions.

The extreme example of being able to reproduce locally and quickly is a unit
test (not just locally meaning on your machine, but locally in terms of code
and time).

### Analyze a core dump

If the defect is an uncaught exception or segfault, do you have a core dump? If
you don’t, create a story to get one for your application, this should always
be possible. If you can only reproduce the issue in the “cloud” or in some
place that’s hard to get core dumps, the first step is to reproduce the problem
locally. Create tasks to improve your process to make reproducing locally easy.

### Reproduce in a debugger

Most of the effort required to reproduce in a debugger is reproducing locally.

If you know what function an error occurs in but not how we got there, consider
logging the stacktrace with boost::stacktrace. You can’t leave this in the code
(way too much noise).

Why?

- A call stack.
- Debugging lets you answer any question without the effort of modifying the
  source (faster); logging also lets you answer any question but often in a way
  that is specific to the problem (and so shouldn’t be in a log). Perhaps logging
  is useful in general for creating context but not for the root cause of every
  defect (not all details).

## Assumptions

- [Scientific process][2]
- This process assumes the investigation is being done by a team capable and
  interested in carrying the investigation and application of a fix to
  completion. It's rare to do an investigation without a fix since the task is
  simply not valuable alone. In many scenarios it is more appropriate to just
  report the defect.

[1]: https://en.wikipedia.org/wiki/Linus%27s_Law
[2]: https://en.wikipedia.org/w/index.php?title=Scientific_method&oldid=897409401#Process
