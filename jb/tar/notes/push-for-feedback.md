---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.2
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Push for feedback

## Test

[glab]: https://github.com/profclems/glab
[lab]: https://github.com/zaquestion/lab
[hub]: https://github.com/github/hub

Push to GitLab, GitHub, etc. and use [`glab`][glab], [`lab`][lab], [`hub`][hub], or a similar tool
to check for test results, if not the CI/CD web interface.

## Value

### Fast computer feedback

[gli]: https://docs.gitlab.com/ee/user/project/integrations/overview.html
[ns]: https://askubuntu.com/questions/187022/how-can-i-send-a-custom-desktop-notification
[zn]: https://unix.stackexchange.com/a/144925/233125

Pushing for feedback permits more focused work, letting developers move on to another task (or
better, cleanup) rather than constantly check on a running experiment. For example, let's say you
start a test on a remote machine by `ssh`'ing into it and pressing go, whatever that means.
Typically, there isn't a standard way to get a notification if the experiment fails after 10 minutes
when you expected it to run for two hours. When you're pushing to GitLab or GitHub, you can easily
set up notifications with e.g. Slack or Discord. See [Integrations | GitLab][gli].

It's easier to get notifications for local scripts with a tool like [`notify-send`][ns] or
[`zenity`][zn], but these still need to be set up for every script rather than needing to be
configured only once per project.

Another alternative is to use system mail (on Unix) and connect your user account on the machine to
your email. This requires setting up e.g. `postfix` and must be done per-machine, like installing
`gitlab-runner`. This setup is often required to get email notifications for RAID array events,
failed login attempts, and other critical errors that would otherwise only go to the system logs. In
theory, you could use a separate mailbox if you don't want these to clutter (or be cluttered by)
your primary email messages.

Another advantage of pushing for feedback (essentially, installing gitlab-runner) is that you can
check for reproducibility on a schedule; see [](./regularly-stress-test.md). You could do this with
cron jobs as well, but cron jobs are limited to a single machine.

### Faster human feedback

Pushing for feedback keeps a developer closer to publishing in general, since you can share your
results from e.g. GitLab with others without rerunning it on GitLab.

### Organized record of successes and failures

Pushing for feedback necessarily implies committing for feedback, though the latter doesn't strictly
imply the former. It can be nice to be "forced" to push all your "silly" mistakes; this helps you
keep track of where time is really going. If you don't commit for feedback, it can be easy to forget
that you've already tried something and couldn't get it to work.

Even if you don't share your results, it can be incredibly helpful to have organized logs from the
past few days for your own sake as well. What happened the last time that this worked? Still, it may
be better to save `container.log` files automatically with every experiment, even if the experiment
is kicked off manually. In GitLab logs get cut off after some time, a limitation you don't run into
when you save logs yourself.

### Insufficient local resources

If a developer ever needs to run more than one test in parallel that requires most of an individiual
machine's resources, this approach makes it easy to start the second job. That is, this is a
strategy to work around insufficient local resources.

Write code remotely that requires an expensive GPU to run, or that relies on data that is only
available inside a company network (and is too slow to fetch over a VPN). Said another way, make
your remote machine a more thin client. Relying on a remote developer's machine is in general
unreliable if a test consumes most of the machine's resources, since Firefox can take 10 GB of RAM
in itself and prevent the job from completing.

### Centralized source code

For an individual, there's little advantage to decentralized source code management. Editing source
code on your local machine is faster than editing it over ssh (which always has some delay). It's
when you're editing source code that you most want to avoid the interruptions and annoyances of a
slow network connection.

Editing source code on a remote machine is also inherently risky. If the machine goes down for some
reason, you may lose your recent writing on a subject. At the least, you will pay in terms of
needing to bring the code back to your local machine at some point.

## Cost

### Fundamental overhead

Pushing code and pulling it down on a static or shared CI/CD runner almost always adds a few seconds
of overhead. It rarely makes sense to push for feedback on tests that only run for a few seconds,
such as linters or a REPL that doesn't need anything loaded in memory. The benefits become clearer
for "long" experiments where this overhead is insignificant, perhaps more than 3-4 minutes.

Even if a change has no issues, it takes time to form a commit message, push it, find the output you
should be watching, clear out Slack notification messages, and pull the merged change down.

### Remote artifacts

It can take significant time to setup a system where pushing for feedback works. For example, let's
say you need to manually commit `.dvc` files generated from some process as part of your regular
workflow. You can automate this in CI/CD, but because it can't make a decision about whether an
artifact is worth saving you need to save everything. This requires more disk space, and a system to
regularly clean old `dvc` artifacts (e.g. older than 2 weeks). When artifacts are large (e.g. large
datasets) this is more of a problem.

Developers should understand that all committed `.dvc` artifacts are prone to deletion with time. If
a developer wants to keep a particular commit of a `.dvc` file made in CI/CD, they can merge it into
a branch that they submit for merging into master.

If you allow for some non-reproducible actions that e.g. generate `.dvc` files, you also need to
come up with a system for running only those tests. One option is simply edit the code that calls
Bazel to specify target patterns, but then these changes need to be removed if you decide to merge
the `.dvc` changes. An option that doesn't involve permanent code changes is `git` push options; see
[Push Options | GitLab](https://docs.gitlab.com/ee/user/project/push_options.html).

Pushing for feedback is slower because you need to push any artifacts you've generated locally to
the cloud. You may say they should already be in the cloud, but if you have more than one machine in
the cloud there's no guarantee that the object is already on the node you get. You need faster
feedback to learn fast (not just from theory), and this is going to slow you down.

Pushing with the `git pms` alias assumes you don't want to merge in any tag commits generated by
CI/CD on the commit you are pushing. In practice sometimes you know that a .dvc artifact can always
be merged when it's generated, and other times you need to do some manual inspection. By default you
should be using `git pms` rarely in an environment where .dvc tag commits may or may not be
generated; it's inconsistent with using tags for these .dvc commits rather than simply putting
another commit on the branch before merging.

### Requires accessible computing resources

It's critical (for fast feedback) to use local (controlled) resources to run tests. That is, try to
to set up the machine you would otherwise `ssh` into as a static runner with GitLab, or do the
GitHub equivalent. See [GitLab Runner | GitLab](https://docs.gitlab.com/runner/).

Tools like `bazel`, `dvc`, and `docker` rely on large caches for efficiency. No matter how powerful
the cloud resources e.g. your company provides, it's often hard to manage these caches in the cloud.
For example, pulling the docker image you use to run your experiments can add an unavoidable several
seconds per experiment. Bazel is much faster when it already has all its caches loaded into volatile
memory.

One limitation of `gitlab-runner` is that artifacts (e.g. stored through dvc) is typically on the
disk with the root filesystem, because gitlab-runner stores repositories in the `gitlab-runner` home
directory. Unless you store the home directory on a different disk, it isn't easy to take advantage
of a large secondary disk or RAID devices.

It's also critical to have ssh access to debug issues faster. That is, it is often necessary to
check the state of a machine when it fails a build. That is, you need be able to collect the
feedback you are not yet pushing back to a shared location with the person writing the code (e.g.
`/etc/log/syslog`).

It's perfectly possible to debug (e.g. start pdb) a docker container started on a remote machine;
this has the additional benefit of recording the debugging session once you connect to it. It's
extremely difficult to debug a halted program without having ssh access to the machine where the
program has stalled.

With ssh access, you'll be able to monitor whatever performance metrics you are interested in with
e.g. tmux (see also [GitLab Runner monitoring |
GitLab](https://docs.gitlab.com/runner/monitoring/index.html)).

The "free" cloud resources you get for open source projects from e.g. GitLab are usually terrible.
At the time of writing these runners have only 2 GB of RAM, 1 CPU, and only 20 GB or so of disk
space. GitLab isn't going to pay for a dedicated machine that stays up all the time for its users.

What continuous deployment means depends on the context. If you're publishing nothing but a static
webpage, continuous deployment might only mean running `nginx` on whatever machine happened to be
assigned a job. If your static content is build with Jupyter, it may be better to run Jupyter Lab on
whatever machine was assigned the job.

It's often easier to let machine learning experiments run without a timeout and kill them manually
(e.g. with docker kill). There's usually (at least a little) value in letting an experiment run
until you need the machine for something else (it has answered all your questions). If you're taking
this approach, then you need to log into the machine anyways to kill it.

### Complicates debugging

Ideally, developers should not be *required* to push for feedback. A CI/CD system provides an
independent verification that code works; if it's the only verification then you've made debugging
more difficult in exchange for other benefits. If you find yourself regularly logging in as the
CI/CD user (e.g. `gitlab-runner`) to inspect state because you can't test as your own user on build
machines, you are paying the regular price of more difficult debugging. Pushing for feedback also
adds the regular cost of committing changes. Often we making local debugging hard because we only
want to maintain one system, and if we must pick one it will be the CI/CD runners.

It's often much easier to perform one-time tasks in a local environment rather than indirectly on a
remote machine. If you previously built an artifact automatically and would like to switch to making
it a static dependency, then if you don't have your local build working you'll be forced to push the
artifact with e.g. dvc to some shared location before pulling it back down again to your local
machine to save as a static dependency.

### Halting problem

[hp]: https://en.wikipedia.org/wiki/Halting_problem
[srs]: https://slack.com/help/articles/208423427-Set-a-reminder

An ironic consequence of no longer needing to spend time polling running experiments is that you may
not notice as quickly if it is no longer making progress (the [Halting problem][hp]). GitLab,
Jenkins, and other tools usually have a way to set a timeout on jobs to avoid wasting computing
resources, but it's arguably more useful to use this setting to fail fast when progress stops. It's
critical to get feedback when progress has stopped or you may find yourself creating commits going
off on a secondary task (or a wrong follow-up task) for hours when your primary path needs fixing;
you need to be pulled back into focused work.

We typically decide that progress has stopped based on whether the program is still producing logs.
In fact, we add progress bars and logging statements in areas of code that typically take a long
time to run. It's unfortunate that GitLab only lets you specify how long you expect the whole
experiment to take, rather than the longest you expect the program to go without producing any
output.

Unless you have hard real-time requirements and are writing in a special programming language, it's
unlikely you know how long execution should take. In many cases, you can set a low project-level
timeout that holds for 90% of your experiments. You'll get cut off once in a while when you forget
to increase the timeout for a longer experiment, but this is a price worth paying for staying
focused. Consider it a punishment for both forgetting to increase the timeout and only being to
think of an experiment that takes much longer than normal (slow feedback for you, and spending more
computing resources). You were willing to wait a long time for the experiment, so it's likely the
timeout's overhead is small relative to the length of the experiment.

Another non-killing option is to set a reminder to check on the experiment about when you expect it
to complete. See [Set a reminder - Slack][srs]. The major disadvantage to this approach is that it
will ping you even if the experiment fails early for some other reason (not being aware of what
experiment it is connected to). Still, this tool is useful if you have an experiment you expect to
take 20 minutes total you want to check in on after 5 minutes.

This is analogous to asking yourself to assign an estimate to a project but at the most granular
level; it's often hard to know with much certainty how long projects will take. Still, it's hard to
deny the value of a project estimate. In Scrum you re-evaluate at sprint boundaries and decide
whether to continue (this is like the halting problem for humans). Ideally, GitLab could also add an
option to get notified when an experiment has run for longer than an expected amount without also
killing the experiment.

### Notification settings

The Slack and Discord integrations for GitLab have a variety of checkboxes you can configure. My
preference is to leave everything on their defaults, which is a "no news is good news" configuration
where the user is not notified of passing pipelines. That is, if you get a notification you know you
need to do something.

### Machine specification

It's awkward to try to specify which machine you want to run an experiment on with GitLab. As a
workaround, you often need to disable machines in your CI/CD settings.

### Inflated history

One disadvantage to pushing for feedback is that your git history can expand unnecessarily. We often
don't really want to save the history of tuning a batch size to a new machine, for example. One
disadvantage of excessive commits is it takes much longer to cherry-pick them to a public branch.
Reviewing changes (even your own) takes longer because you have to look at unnecessary back and
forth (lessons you've already learned).

It's not as easy to get a machine incrementally ready to run a new experiment. Let's say you wanted
to pull a 5G dataset to a machine (e.g. with dvc) in order to run an experiment that you don't quite
have ready yet. If you were only pushing for feedback, you'd be forced to push a commit that pulled
that 5G dataset onto the machine early rather than simply going to the machine and pulling it
without a new commit. Or, you'd have to tell GitLab to run a pipeline on a specific commit; this
works but requires you to go a web user interface for something that could have been done on the
command line.
