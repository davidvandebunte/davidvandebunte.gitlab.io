load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

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
    "--tls",
    "--log-level=info",
    "-H=tcp://docker:2376",
    "--tlscacert=/certs/client/ca.pem",
    "--tlscert=/certs/client/cert.pem",
    "--tlskey=/certs/client/key.pem",
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

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

container_pull(
  name = "scipy_notebook",
  registry = "index.docker.io",
  repository = "jupyter/scipy-notebook",
  digest = "sha256:7513d8ece39dea46fe9e5f371dc6f664b0eae9b5e100ba47a7cf0c544109d323",
)

container_pull(
  name = "base_hugo",
  registry = "registry.gitlab.com",
  repository = "pages/hugo:latest",
  digest = "sha256:f05b69fb734ee9bca2e29d48493a38dc4eb84f2bb8b8a94be5ae09d5fe213e7f",
)
