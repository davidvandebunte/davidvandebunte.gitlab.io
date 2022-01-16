---
title: "Prescribe computing metrics"
date: 2021-08-05
tags: []
---

[pcp]: https://en.wikipedia.org/wiki/Profiling_(computer_programming)#Use_of_profilers
[wsf]: https://serverfault.com/questions/446956/
[dso]: https://stackoverflow.com/questions/41725613/

# Value

Many generic terms are heavily overloaded (reused) in the context of measurement in computing. This
article attempts to restore meaning to these terms based on as many external references as possible,
to at least achieve consistency in the context of this blog.

# Cost

Define a list of terms.

## Pipeline

[pc]: https://en.wikipedia.org/wiki/Pipeline_(computing)

See [Pipeline (computing)][pc]. Following that article, call these pipelines "serial execution
pipelines" to distinguish them from true pipelines. The term "serial pipelines" is potentially
confusing because all pipelines are connected in series.

Call a true pipeline a "multiprocess pipeline" or "parallelized pipeline" when it needs to be
distinguished from a serial execution pipeline. Prefer the term multiprocess pipeline for e.g. Unix
pipelines that run concurrently but not in parallel (e.g. on a single CPU machine). I've not seen
the term "concurrent pipeline" in the wild but if needed it could cover both parallelized and
multiprocess computing pipelines.

In practice, serial execution pipelines are often called a pipeline. This kind of pipeline could in
theory be turned into a concurrent pipeline if the need appeared; if you only ever need one of
something at a time the need is unlikely to appear.

If buffer size is not a concern (and losing cache locality) you could finish running each filter in
a Unix pipeline one at a time or fully process every input unit one at a time and get the same
answer and same execution time. Typically we choose to limit WIP with a Unix pipeline on a single
CPU machine; this gets you first results faster and hides internals (allowing one liners to describe
the whole pipeline).

An example of a pipeline is a machine learning model's evaluation pipeline. The fundamental unit of
work is a visualization of model performance. Intermediate products are a dataset, a trained model,
the results of evaluation inference, and plain text evaluation results. Another example is the
pipelines defined in a `.gitlab-ci.yml` file.

## Process

[process]: https://en.wikipedia.org/wiki/Process
[mtpm]: https://en.wikipedia.org/wiki/Process_(computing)#Multitasking_and_process_management

The term "process" is ambiguous (see [Process][process]). The unqualified term usually means either:
- [Business process](https://en.wikipedia.org/wiki/Business_process)
- [Process (engineering)](https://en.wikipedia.org/wiki/Process_(engineering))

In computing the term "process" can also simply mean "something that takes up time"; in embedded
operating systems what you think of as a computer process is actually called a task (see
[Multitasking and process management][mtpm]).

Even within a Unix or Linux context, the unqualified term "process" does not precisely identify the
abstract computing process we are often talking about. Use the term "main process" or "child
process" or "parent process" to distinguish a computer process from the "overall" process (usually
identified with the main process). See:
- [Parent process](https://en.wikipedia.org/wiki/Parent_process)
- [Child process](https://en.wikipedia.org/wiki/Child_process)

## Trace

[ts]: https://en.wikipedia.org/wiki/Tracing_(software)
[twkt]: https://en.wiktionary.org/wiki/trace

Notice that [Tracing (software)][ts] has no link to [Profiling (computer programming)][pcp] and vice
versa. In my opinion, the term "profiling" should be preferred to "tracing" when you're talking
about numerical statistics. You would do "tracing" to produce low level logging information
(semantic/textual, not numerical). Hence, the trace logging level. In practice, logs contain a mix
of semantic and numerical information. Turn on verbose logging to get "trace" level information; a
trace is small (or detailed) because the phrase "didn't leave a trace" implies it.

The confusion in the term likely originates from the fact that you can use "past evidence" to help
you "draw out" how something works. See [trace - Wiktionary][twkt].

### Past evidence

[elvt]: https://en.wikipedia.org/wiki/Tracing_(software)#Event_logging_versus_tracing
[ttw]: https://stackoverflow.com/tags/trace/info

Define a "trace" as a log of execution of a process or a method, that is, a specialized log:
- ['trace' tag wiki - Stack Overflow][ttw]
- [Definition of debugging, profiling and tracing - Stack Overflow][dso]
- [Tracing (software)][ts]

If tracing is a specialized use of the term logging, when should something be called a trace rather
than a log? See the guidelines in [Event logging versus tracing][elvt].

For example, `strace` provides a specialized log (of system calls), and `ltrace` a specialized log
of library calls.

### Draw out

See "Desk checking" and "Live debugging" in [What's difference between monitoring, tracing and
profiling? - Server Fault][wsf]. Don't use the term this way; prefer "sketch" or "draw" to avoid the
conflict in terms.

## Profile

Profiling is the process of running a profiler (on an application, system, or process). A profiler
is a tool, and every profiler measures something different (see this [Definition of debugging,
profiling and tracing][dso]). Because of this, profilers tend to be specific to a language or the
platform (see [What's difference between monitoring, tracing and profiling?][wsf]).

When a profiler collects numerical/statistical data, it is called a "profile" of the execution. If a
profiler collects plain text it will be called a "trace" or a log (see [Profiling (computer
programming)][pcp]).

### Deterministic (Event-based) Profiling

[ebp]: https://en.wikipedia.org/wiki/Profiling_(computer_programming)#Event-based_profilers
[oca]: http://www.brendangregg.com/offcpuanalysis.html

These are often language specific; see [Event-based profilers][ebp]. In the article [Off-CPU
Analysis][oca], this concept seems to be known as "Application Tracing". See the article for an
explanation of the fundamental difference between this approach and CPU sampling better. In
particular, it explains some of the upsides and downsides of cProfile in Python.

### Statistical Profiling

[sp]: https://en.wikipedia.org/wiki/Profiling_(computer_programming)#Statistical_profilers

See [Statistical profilers][sp].
