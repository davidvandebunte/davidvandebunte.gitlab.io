# Identify resource

Who's help do you need? What resources (e.g. computers) do you need? What resources might make your
job easier?

## Test

Another variation on how to achieve a goal. Said another way, should you take the time to imagine a
plan `a..c` as an alternative to `a..b`?

```bash
* b: G1, S2: 3PM
| * c: G1, S1: 2PM
|/
* a: 12PM
```

## Estimate cost

To administrate is to impose your values on another, in the same way that to buy from someone is to
impose your value on them. They trust that your values are "good" when they accept your assets for
some service (or other assets). A computer (as a resource) has no inherent values, so it's not hard
to impose your values on it.

There's a major distinction between seeing yourself as a buyer (manager/administrator/orchestrator)
and a seller (staff/machine/employee). When you are a buyer, you need to go beyond single machine
scheduling. This document will often use the word "resource" for sellers, styled after the language
in [Management](https://en.wikipedia.org/wiki/Management) and [Factors of
production](https://en.wikipedia.org/wiki/Factors_of_production). This is not always appropriate;
for more language see [A word for people who work under a manager - English Language & Usage Stack
Exchange](
https://english.stackexchange.com/questions/278113/a-word-for-people-who-work-under-a-manager).
We use the term administrator (see [Administration](https://en.wikipedia.org/wiki/Administration))
as a synonym for manager.

Buying a machine (or getting reserved instances) is like getting a salaried employee; renting is
like getting temporary workers. Many deep learning machines are now significantly more expensive
than minimum wage; see for example the instances listed under [Amazon EC2 P3 – Ideal for Machine
Learning and HPC](https://aws.amazon.com/ec2/instance-types/p3/). If you want to use a whole
cluster, the costs are even more extreme.

As the manager of a team (of either people or computers) executing or comparing plans, you must
convert the resources you're managing (abstracting from them) to \$ because you aren't doing the
work that they do; you're "hiring" them to be able to abstract from them (you could do everything a
computer does on paper). To keep you (or now, your team's) action weights in e.g. \$/hr you can
simply add the \$/hr of all involved persons together (for as long as you have the same set of
resources).

When you report costs to your administrator, you can provide a single \$/hr estimate. This will
include your own rate e.g. salary (you're selling to them) and the cost of any hardware or other
resources you require amortized over the period they are asking about. From your perspective,
though, all you care about are the hours (achieve your values as fast as possible, find a steeper
gradient) and so there is no need to convert.

Time is not money, so in general you need to consider the \$/hr for AWS instances and employees as
well, not just yourself. Buying a machine for \$4/hr that is 3x slower (on your workload) than a
\$12/hr instance doesn't make sense; you can get faster feedback for free. If you saw time as money,
you would identify that you need e.g. 300 hours on the first machine for a total cost of \$1200, 100
hours on the second for a total of \$1200, and conclude it doesn't matter which you choose. In
general, there's no reason that faster feedback will be any more or less expensive than slower
feedback.

People start as mostly the same "instance type" and diverge. It's their knowledge that really
distinguishes people; we all rely on different abstractions which can make us incredibly more or
less efficient than each other in different domains. What you pay a person should depend on what
they know, which (ideally) you test in some way.
