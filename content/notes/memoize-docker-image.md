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

Specializes:
- [](./memoize-artifact.md)

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
working on the Dockerfile fast, as well as regular work.

For an example of how to do this, see [Use Docker to build Docker images | GitLab][uddi].

### Correct: `rules_docker`

[bdr]: https://github.com/bazelbuild/rules_docker

See:
- [bazelbuild/rules_docker: Rules for building and handling Docker images with Bazel][bdr]
