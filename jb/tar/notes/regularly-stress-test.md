---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.5
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Regularly stress test

There are two likely sources of a low SLA. The first is what we'll call intermittent issues,
reproducibility problems that can be recreated on a regular basis by simply repeating a test.
Examples of this kind of problem are race conditions and cosmic rays. The second are what we'll call
"unpinnable" reproducibility problems, intermittent issues that are caused by changes in
dependencies you are not able to pin. Examples of this kind of problem are services going down,
services changing their API in a backwards-incompatible way, and cats biting cables (if your wife
won't let you get rid of the cat).

You could theoretically have multiple levels of a "master" branch. One level could be for tests that
have passed once, and a second level could be for tests that have passed e.g. 5 times in a row. This
would let you keep moving onto another task after seeing your tests pass once, while still keeping
you aware of any intermittent issues associated with your code.

This system in fact already exists in major companies, where we release code to new [Deployment
environments](https://en.wikipedia.org/wiki/Deployment_environment) as we gain confidence in it.
Stress testing should happen before releases to ensure you are going to continue to meet your SLA.
Do a web search for "GitOps" for an even more advanced system.

Should you regularly stress test (rerun all tests) on the code in your primary build system (build
service)?

## Value

Knowing how reproducible your results are will help you decide what issues to fix first; you want to
fix the most frequent intermittent issues first.

More data on the reproducibility of a problem makes it much easier to work back to the root cause
(see [](./investigate-root-cause.md)).

If e.g. you submit an intermittent issue at 9 AM that gets merged, you'll know by 1 PM or so that it
only works half the time even if no one else is making changes to regularly trigger the build. You
may need to cancel tests for your own changes if you have limited computing resources, which is
usually fine. You need to manage computer time just like human time, and should be in the practice
of cancelling work that is less important than other work; checking reproducibility is less
important than checking your latest code submission.

You also really need this if you want to generalize your code to heterogeneous hardware. You often
get code to run on a four-GPU or one-GPU machine. Will it generalize to all of six office machines
you sometimes use? These machines may have different amounts of RAM as well, and different CPUs.

It helps to know what your regular intermittent issues are, even if you don't fix them. For example,
if a build fails during the day and you are not aware of whether the failure you're looking at is
intermittent, you'll need to restart it and hope for a good result without really being able to move
on to another task. That is, you won't know whether the result is from the change you just made or
is a pre-existing intermittent problem.

If you're using bazel (to pin dependencies during the day) then you can use spare computing
resources to check for both intermittent issues and unpinnable reproducibility problems at night.
That is, you can tell bazel to do multiple clean builds at night. These clean builds will not only
check for regular intermittent issues in artifacts that you previously cached with bazel (because no
artifact is fully reproducible), they'll also help find new easily reproducible errors caused by
changes in unpinned or unpinnable dependencies.

This approach also helps you keep track of how long your build takes; you'll have a lot more
statistics. How can you make your build faster? You'd want to have information on recent code to
make improvements.

If you have a data center, spare machines in the office, or access to Amazon spot instances, then
you can measure reproduciblity when your spare computing resources are available at a lower cost.
For hardware you own, you've already paid for the hardware (a sunk cost) and are only paying for a
little power, the incremental increase in power it takes to use a bit more of the computer's CPU,
GPU, etc.

## Cost

The process of moving an idea to production is the process of increasing its generalizability
(reproducibility) across time, new inputs, etc. You should generalize to all the new inputs you
expect to see in the next tier (e.g. production) first, then run all stress testing. Otherwise, you
may be running tests on code that will have totally different intermittent issues than the final
production model. Do you expect that the intermittent issues you're seeing now will be similar to
what you are seeing when you are code complete?

If you want to run tests during the day, you're going to have to cancel the tests before running
your own (hopefully this is easy, but it's never zero effort). During the day you should spread
tests out more so you feel completely confident you will only need to go looking for one pipeline to
cancel.

No computation is free; you're still burning up your GPUs and wasting power even if it's the middle
of the night.
