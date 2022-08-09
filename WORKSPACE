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

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_archive")
git_archive(
    name = "io_bazel_rules_docker",
    remote = "https://github.com/davidvandebunte/rules_docker",
    commit = "ed321b33ca008819e4f83aaa64dc3466bff5ae21",
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
