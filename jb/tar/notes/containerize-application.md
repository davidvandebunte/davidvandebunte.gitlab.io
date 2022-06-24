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

# Containerize application

## Test

Either containerize an application you only have uncontainerized (e.g. on your local machine) or
split an existing container into two. You don't have to see these as different if you see your host
machine as one large container (environment).

## Value

Do you think about containerization too much? For your specific action, estimate the value in time
savings using the general guidelines below (specialize your action to your situation).

### Stability

[irc]: ./investigate-root-cause.md
[mfmt]: https://martinfowler.com/articles/microservice-trade-offs.html

What does it mean for an environment to be unstable? You know it when you see it:
- If conda can't solve an upgrade.
- If conda solves your dependencies slowly.
- It takes forever to build.
- As your dependencies get older.
- In general, code "breaking" (failing tests) in production or in development.

We use docker to reduce the non-hardware differences between machines, making debugging much easier
(rule out a whole class of problems). Production must use it for stability, but reducing differences
between developer machines is also critical. When a build breaks on your machine, you must
[investigate the root cause][irc]. A dockerized build environment eliminates one of the most common
root causes, differences in build environment.

Every package you install is like an action/step that moves the system closer to a unique state no
one in or outside your company has ever tested before. You're moving farther from common and
therefore stable configurations. That is, you're moving farther from widely tested configurations.

Notice how time interacts with stability; if you upgrade too soon or too late you're going to be in
an unstable environment. This implies you should upgrade all dependencies at once, when you're in
focused work on how you build and dependency systems work anyways.

The more docker images you have, the more independently you can develop the components of a
pipeline. If you are communicating via files anyways, there should only be advantages to adding more
docker images. If you're in the same language, though, you should more often stay in memory.
Separate docker images lets us move to the theoretically better option of microservices more easily,
as well. See [Microservice Trade-Offs][mfmt].

Perhaps stable simply means predictable; not liable to change or alteration. The weather is often
unstable; computers usually are not. If you dependencies are a time-variant function then they are
less stable; perhaps stability is a measure of how time-invariant a function is. If you don't what a
word means, ask how you would measure it (see `!w stability`).

Common system-level dependencies:
- What happens when you need to update NVIDIA drivers and CUDA? It’s not easy.
- Updating to Ubuntu 20.04 (the next LTS release) will be trivial (in a year).

#### Complexity

[ddda]: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#decouple-applications
[hpak]: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/

Increased complexity (in a single image) also leads to instability. For example, an uber image with
everything you could ever want installed. Do you need an "everything" environment, or can you live
with a smaller environment for some stage of the pipeline? The advantage is you can change languages
and manage dependencies separately. See [Docker docs - Decouple applications][ddda].

When you decouple you can upgrade dependencies separately. The most terrible thing about
"everything" docker images is that it is impossible to upgrade anything. To do so, you would have
had to perform the upgrade everywhere, for all features, and sometimes across multiple repositories
that rely on the same base docker image.

You could leave one function on an older version of Python (e.g. 3.6) while you upgrade another to
3.7. In fact, you can completely change languages, the operating system, and manage all dependencies
totally separately. It becomes much easier to reuse images when every image has only one concern.
How often do you see an image on DockerHub with a unique composition of installed libraries?

You can scale horizontally more easily. Horizontal here means more hosts/pods, while vertical means
larger/smaller hosts. See [Horizontal Pod Autoscaling | Kubernetes][hpak]. Sometimes you need
expensive GPU instances in only one docker image (when there is otherwise no need).

Why are docker containers supposed to do just one thing? Because functions should generally do one
thing. Sort out your dependencies so docker images can be as orthogonal as possible. It makes it
simpler to understand what every docker image does.

The more you put into a single docker image, the more often you’re going to break the docker cache
when you want to rebuild it with a new package.

When a docker image gets too large, it’s fragile. You don’t understand how all the installed
packages work together, so it easily breaks. You also often lose sight of why you need every
package, and git history is long enough you don’t want to look.

Are there separate docker images because of separate teams or technical reasons?

#### Focused work

Stability issues (what docker fixes) are especially important because they reduce predictability,
and they take us out of focused work.

When a build system many developers rely on is broken, the task of fixing it is critical. You
suddently have a horde of developers waiting for the build to work so they can continue to develop,
or you have a production job that can't run until the build system is fixed (outside teams
affected), or a delayed production job or delayed experiment ultimately delays how fast we can do
validated learning and deliver to customers.

#### Attract Developers

% See also [Transform Docker Image](./transform-docker-image.md)

A stable environment is also quick to set up. Docker builds automate manual setup documented in
notes and wiki pages. That is, it moves these notes to code to make them more maintainable and
faster. Running code is much faster than following a wiki page. You save time from faster setup
whenever you or existing developers set up on new machines.

Feel free to wipe your operating system when it gets too unstable (which will also take longer with
dockerized apps). With dockerized builds, you can sometimes work completely from AWS. Faster setup
lets you try a second experimental environment. New developers saving time as well.

Following manual processes to set up new environments is error-prone, as well. The document can
easily get out of date because it cannot be tested automatically.

A dockerized build lets you go far back in the history of a repository because the build environment
is documented with it.

Share tricky developer operating system setups such as:
- Automatically turn on core dumping (all developers should have this turned on).
- Getting gdb to show the standard library source code.
- In effect, share your personal machine setup.

Easily return to code you don’t visit often. If you build a project infrequently it's nice to be
able to restart quickly. As long as someone is maintaining the dependencies while you're gone, it's
likely containerization will help you get started again quickly.

#### Experimentation

A stable environent is easier to change. Dockerfiles let you easily share the process to set up a
machine for an experiment. They make testing that you (or another team member) can remove a
particular library much easier. Anyone should be able to use a new library easily so they don’t
write custom code.

Dockerfiles give you a great way to experiment with new directory structures. It's as simple as
changing a script and not screwing up anything on your machine.

You need to easily run on Amazon Linux (amazonlinux) to test new packages built there (such as for
machine learning).

Have you ever hacked something into working, and forgotten what you did? You can always use the
`history` command to review how you changed machine state to get to the working "island" that you're
on. With docker, the `history` command is naturally limited to the hacks you did to get your
specific problem working (not all commands across the system). These commands are the `actions` you
took to control the state to where you wanted it; now you can cut down on that history just like you
cut down on the actions in a git history (removing back and forth i.e. compressing).

#### Required for CI/CD

Because CI/CD needs a stable environment, it will almost always be using containers.

Time savings from having a consistent dev/test build environment. You can test changes locally
before assuming they work in Jenkins, GitLab, etc. Dockerfiles let you use the same environment for
development and test.

#### Required for production

Because production needs a stable environment, it will almost always be using containers.

Time savings from having a consistent dev/prod build environment. Consistent local and production
environments.

### Host Isolation

Do you even know how to run Jupyter outside a docker image? You wouldn't want to install it outside
perhaps you use it for so many applications; you wouldn't know which version the host should be on.

Eliminate risk associated with experimenting with new tools (e.g. installing clang-6 and your
host machine being unusable for half a day). You need dockerized builds because you often screw up
installs (for example, installation of node.js/npm and python --user).

Running in Dockerfiles allows you to run the bleeding edge versions of many tools; you can install
stuff however you want to install it.

You need dockerized builds because ultimately you need to start from a clean system all the time;
you can’t trust many packages. You once received an involved email "Switching from oracle java to
openjdk" describing how to uninstall the oracle java 8 packages. If you make a build system change,
you are essentially responsible for making sure it builds on a horde of developers machines with a
variety of different packages installed. It's a major pain getting less technical users going again.
End support requests for machine-specific fixes (including your own machine).

If it’s unstable, put it in a box. How good is the installer? If it’s a package you really trust
(and don’t expect other software will depend on and break when you update this package), feel free
to install it globally on your operating system. Do you really need a docker image for git? Perhaps
to keep the dotfiles and the binary in one place?

If you don't need your results to be reproducible, then you don't need to put it in a box. Both
Bazel and docker use process isolation to make results more reproducible, but there's often little
value in reproducibility before code works. You should be able to uninstall and upgrade system
packages, treating the system as mutable, for the sake of quick experimentation. Why? Your system
packages should only used for one-time experiments; if reproducibility was required you would have
used docker.

You avoid clearing your host (starting at zero) because you're afraid you're going to need to spend
a day or two setting up your host to continue to do the work you're already doing; you really don't
care about keeping it up to date to do the kind of work you were doing a year or two ago (e.g. C++).
You'd want to start from a clean state if you started working on an old project, anyways.

Keep your host clean so it can last forever and you feel free to reinstall the operating system or
upgrade hardware. Eliminate the need to reinstall your operating system on a regular basis when it
gets so unstable and you really need an upgrade to do your work. Run your Linux programs on Windows.

#### Limit hardware resources

When you are running inference in a docker container it is trivial to limit the amount of memory the
process had access to. If you didn't, in one case, you were getting an OOM error that kicked you out
of SSH and made it impossible to log back into your machine for 20 or more minutes.

#### Learn fewer dependency isolation tools

Use multiple language versions without having to resort to all the hacks for your language. See:
- https://medium.com/better-programming/why-and-how-to-use-docker-for-development-a156c1de3b24

In particular:

> Can use multiple language versions without having to resort to all the hackarounds for your
> language (python, python, ruby, ruby, java, node). Want to run your Python program in Python 3,
> but only have Python 2 installed? Run it using Python 3 image. Want to compile your Java program
> with Java 1.6 instead of the 1.7 that’s installed on your machine? Compile it in a Java 1.6 Docker
> image.

You need Docker for C++, which doesn’t really have a great system like these other languages.

This does not imply you shouldn't sometimes separate your application's environment from the system
environment even within docker:
- https://hynek.me/articles/virtualenv-lives/

If you continue to use virtualenv you'll also be able to have a development environment inside and
outside of docker that are roughly symmetrical (critical to test for differences). See also:
- https://pythonspeed.com/articles/multi-stage-docker-python/

## Cost

### Isolation

Separate instances of applications often can't interact with their siblings through global
variables. Will you be able to get to the OS clipboard from within vim? What about shared global vim
history? Some vim history is in shareable configuration files. `vim` is going to interact with
almost everything; what if you need vim to interact with gdb?

Would you ever put tmux in a docker container? Only if you needed a lot of windows to work on a
single application, which would presumably be rare? The tmux configuration is quite unstable, though
(unlike e.g. git's config).

It’s not easy for arbitrary applications to interact with each other except through:
- Files
- IPC
- REST APIs

You’ve put them all in separate boxes (by definition you want one concern per image).

Most desktop machines are useful quite unstable. If you had a docker image with everything in it
(even tmux) you could work from it everywhere; it might be unstable for a docker image but it’s more
stable than your desktop machine, only because you know the instructions you used to build it.
Unfortunately, this would require a lot of dind and manual forwarding of e.g. X resources.

### Fast experimentation

Docker packaging is complex and time consuming:
- [Production-ready Docker packaging for Python developers](https://pythonspeed.com/docker/)

Docker is a special case of dependency pinning, at a deeper level than e.g. many language-specific
tools. It takes time to pin dependencies, even if you know how to do it. If you don't know that you
will do something twice, it's likely not worth writing down how you did it. Your desktop
installations (apt packages, conda packages, etc.) should be quickly resettable to whatever new
configuration you want to play with on a one-time basis (or most likely to be one time). That is, it
should be flexible and effectively have no dependents. Said another way, do you need reusability?

Docker is more than dependency pinning as well, it's also process isolation. You need to forward
e.g. the filesystem, network ports, and X resources properly, all of which you have to figure out on
a case-by-case basis.

### Container orchestration

A single docker image to rule them all is like a monorepo. Practically speaking, it would be nice to
do everything from one docker image without needing to worry about orchestration. For example,
separate container environments require you to do a lot of orchestration work when you could have
kept everything in one image. No need to use anything but language interfaces, no need to mount the
correct paths, no need to pass everything as files or over the network (rather than in memory).

Arguably the hardest about container orchestration is defining stable file system formats. Often
it's helpful to have these formats anyways, though, to e.g. provide checkpoints. Don't invent file
system formats for the sake of isolation, but consider breaking container boundaries at existing
serialization checkpoints.

### Developer image

What if you want to draw a graph of a PyTorch or other model with `graphviz` in an evaluation
container? You'd likely need to install the same version of PyTorch or whatever else in both images.
You'd like to be able to visualize and train at the same time. See an example of this in:
- [Using shared variables (Data container adaptation) — PyMC3 3.11.5 documentation](
https://docs.pymc.io/en/stable/pymc-examples/examples/pymc3_howto/data_container.html)

In your experience developing with PyMC3 you put everything in an "evaluation" image, and it was
quite convenient to work with. The tools you needed for training and evaluation were commonly
installed together elsewhere in the wild, so stable configurations with all the tools you needed
were available.

Why do we put unit tests in a developer docker image, and evaluation outside of it? Or put other
developer testing tools like pylint and yapf inside, but evaluation outside of it? Or compilers?
Evaluation is a special case of testing; it's confirming that we have a good mental model of what a
component is doing so that we can isolate what it provides from other components. Often the "test"
it provides isn't a simple yes/no (e.g. precision and recall) but it's not hard to turn soft metrics
into tests by setting a line (i.e. a KPI). Often this line is current production performance (do
better than what we did before).

You have also worked with Tensorflow frameworks that put evaluation inside the developer image, next
to e.g. the training code. Consider in particular tensorboard; you'd want to use the same version to
pull up evaluations as you used to write evaluations.

### Stability islands

Are you working with an ecosystem of closely related tools, where (despite the absolute number of
packages) they are likely to have been tested together by others? In particular, are you working in
the same language in both docker images? It's more likely different languages will require
conflicting dependencies than a single language.

The Jupyter docker stacks images border on unstable, but are also incredibly useful. These stacks
are not only a good island to work off of, they likely drive what bugs are fixed in the included
packages. Consider some of these even more unstable community stacks:
- [Selecting an Image — Docker Stacks documentation](
https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#community-stacks)
- [🤗 Transformers](https://huggingface.co/docs/transformers/index)
- [iot-salzburg/gpu-jupyter](https://github.com/iot-salzburg/gpu-jupyter/)

From [Stack Overflow Developer Survey 2022](
https://survey.stackoverflow.co/2022/#section-most-loved-dreaded-and-wanted-other-frameworks-and-libraries):

> Hugging Face Transformers surfaces as the most loved library ...

% ## Additional Training Data

% In the process of moving:
% - https://docs.google.com/document/d/1KYjO-U5KfYfm9UBZPr-gGQaR7XFe48yGnaNYTolcR6w/edit#

% See also:
% - https://docs.google.com/document/d/1qzyv1aOJ_whoW0ttKTOOQpH8yF-SyfOCRItI6hXKiFc/edit
% - https://docs.google.com/document/d/16N1KZXDwutqH0jQ0i_s7bBB9ctGp47ZKhQsQBTHklSc/edit
