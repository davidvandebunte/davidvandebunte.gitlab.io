load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_pkg",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.5.1/rules_pkg-0.5.1.tar.gz",
        "https://github.com/bazelbuild/rules_pkg/releases/download/0.5.1/rules_pkg-0.5.1.tar.gz",
    ],
    sha256 = "a89e203d3cf264e564fcb96b6e06dd70bc0557356eb48400ce4b5d97c2c3720d",
)
load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")
rules_pkg_dependencies()

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "59536e6ae64359b716ba9c46c39183403b01eabfbd57578e84398b4829ca499a",
    strip_prefix = "rules_docker-0.22.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.22.0/rules_docker-v0.22.0.tar.gz"],
)

load(
    "@io_bazel_rules_docker//toolchains/docker:toolchain.bzl",
    docker_toolchain_configure="toolchain_configure",
)
docker_toolchain_configure(
  name = "docker_config",
  docker_flags = [
    "--log-level=info",
  ],
  client_config="/tmp/.ci_docker",
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)
container_repositories()

load(
    "@io_bazel_rules_docker//repositories:deps.bzl",
    container_deps = "deps",
)
container_deps()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

# https://hub.docker.com/layers/datascience-notebook/jupyter/datascience-notebook/latest/images/sha256-d0fc04d56f2baf930395cf8fa48a3fcf64022924decf049dac847d392e0b2591?context=explore
container_pull(
  name = "datascience_notebook",
  registry = "index.docker.io",
  repository = "jupyter/datascience-notebook",
  digest = "sha256:d0fc04d56f2baf930395cf8fa48a3fcf64022924decf049dac847d392e0b2591",
)

container_pull(
  name = "base_hugo",
  registry = "registry.gitlab.com",
  repository = "pages/hugo:latest",
  digest = "sha256:f05b69fb734ee9bca2e29d48493a38dc4eb84f2bb8b8a94be5ae09d5fe213e7f",
)
