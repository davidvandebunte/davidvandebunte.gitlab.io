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

# Memoize Docker image

Specializes [](./memoize-artifact.md).

## Value

A docker build can take minutes or even tens of minutes. If developers need to wait for this build
on every push to CI/CD, they won't use CI/CD for regular feedback. See the "Value" section in
[](./push-for-feedback.md).

Let's say it takes ten minutes to build a particular docker image, and developers need to push their
changes for feedback three times a day because the resources they need to test are only available in
CI/CD rather than locally. Over the course of a month, this would mean every developer would have to
find something else to do while waiting for feedback for:

```{code-cell}
import pint
ureg = pint.UnitRegistry()

# All of these are estimates, despite the lack of uncertainties
study_period = 1 * ureg.month
push_freq = 3 / ureg.day
build_time = 10 * ureg.minute

total_cost = build_time * (study_period * push_freq).to_reduced_units()
print(total_cost.to(ureg.hours))
```

## Cost

In order of correctness:

### Sorta Correct: Registry cache

It's extremely easy to create a separate project for a docker image in GitLab, build your image
there, then push the image to a container repository you can reach from another project. If you're
having trouble getting to docker caching to work (e.g. trying to use `dive`) then this may be a
faster solution, at the cost of making working on the Dockerfile slower and needing to pull a
separate repository to update the image. You may also have to manually update a tag in the pulling
repository, and switch between the repositories while trying to get a new build to work.

For developers who aren't working on the docker image, this can save them a few seconds per build
waiting for the docker caching system to confirm nothing has changed. Still, this is only a second
or maybe two; most of the time docker is taking is for pulling the image which they'll need to do
anyways.

### Almost Correct: Docker cache

[uddi]: https://docs.gitlab.com/ee/ci/docker/using_docker_build.html#docker-caching-example

Docker-based caching lets you cache any stage in the image, not just the whole image. This makes
working on the Dockerfile fast, as well as regular work. For an example of how to do this, see [Use
Docker to build Docker images | GitLab][uddi].

If you want to move images across machines, however, you may need to use `--cache-from` (which is
more complicated).

### Correct: `rules_docker`

[bdr]: https://github.com/bazelbuild/rules_docker

See [bazelbuild/rules_docker: Rules for building and handling Docker images with Bazel][bdr].

How often do you revisit your assumptions? For docker or container images, this is analogous to how
often you need to go back and install or change the libraries in your docker image. You should be
doing it often, if you have good habits regarding upgrades and solving problems with other's tools
rather than writing your own.

If it takes a long time, then you won't do it. Although `rules_docker` works, it can be incredibly
slow for docker images because of its commitment to the [Open Container Initiative
(OCI)](https://opencontainers.org/) format. You'll see [image-spec/serialization.md at v0.2.0 ·
opencontainers/image-spec](https://github.com/opencontainers/image-spec/blob/v0.2.0/serialization.md)
referenced in the `rules_docker` documentation.

Every time that you need to do the equivalent of RUN in a Dockerfile you have to do this conversion
back and forth; and as long as you have several intermediate stages between RUN you'll be fighting
this problem. In `rules_docker` the equivalent to RUN is `container_run_and_commit` or
`container_run_and_commit_layer` (see [rules_docker/README.md · bazelbuild/rules_docker](
https://github.com/bazelbuild/rules_docker/blob/master/docker/util/README.md)).

A Dockerfile is a list of commands. If any earlier command needs to be rerun, then you have to rerun
the rest of the Dockerfile. If you had a tree of dependencies (rather than a linear chain), then
you'd be able to avoid rerunning many of the commands that were actually independent of the earlier
command that was changed. Said another way, bazel leaves *potential* to actually be faster than
docker, but this depends on you never needing to `RUN` anything (if you're using `rules_docker`).

A downside to OCI-formatted tarfiles is that it's not easy to get a shell in them to debug them,
like you can "docker run" an image to try to determine what the next install step should be. If you
have podman installed (which works with the OCI format) though, this problem goes away. See [Podman
Installation](https://podman.io/getting-started/installation) and [podman-load — Podman
documentation](https://docs.podman.io/en/latest/markdown/podman-load.1.html).

You should likely avoid `rules_docker` until you've reached the point of not needing `RUN`
incrementally. Use `docker save` to load an image into the OCI format that was built with all the
non-hermetic RUN commands that are part of your build, then take only deterministic actions within
the `rules_docker` framework. See e.g. `install_pkgs` in
[rules_docker/docker/package_managers/README.md](
https://github.com/bazelbuild/rules_docker/blob/master/docker/package_managers/README.md) to install
apt packages you downloaded before the build with a `download_pkgs` script.
