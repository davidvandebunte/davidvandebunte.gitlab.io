# Construct an image with basic conda and pip dependencies
load("@io_bazel_rules_docker//docker/util:run.bzl", "container_run_and_commit")
container_run_and_commit(
  name = "install_conda_pip",
  commands = [
      "conda install jira pint uncertainties",
      "pip install jupyter-book xlsx2csv==0.7.7 tables",
  ],
  image = "@datascience_notebook//image",
)

# Construct a tar with the rethinking package
load("@rules_pkg//:mappings.bzl", "pkg_files")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
pkg_files(
    name = "raw_rethinking",
    srcs = glob([
        "rethinking/R/**",
        "rethinking/data/**",
        "rethinking/install/**",
        "rethinking/man/**",
        "rethinking/tests/**",
        ]) + ["rethinking/DESCRIPTION", "rethinking/NAMESPACE"],
    strip_prefix = "rethinking",
)
pkg_tar(
    name = "rethinking_tar",
    srcs = [":raw_rethinking"],
    owner = "1000.100",
)

# Construct an image with the rethinking dependency
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
container_image(
    name = "root_ds_image",
    base = ":install_conda_pip_commit.tar",
    user = "root",
    directory = "/rethinking",
    tars = [":rethinking_tar"],
)
container_run_and_commit(
    name = "install_rstan",
    commands = [
        "R -f /rethinking/install/rstan.R",
    ],
    image = ":root_ds_image.tar",
)
container_run_and_commit(
    name = "install_R_dependencies",
    commands = [
        "R -f /rethinking/install/dependencies.R",
    ],
    image = ":install_rstan_commit.tar",
)
container_run_and_commit(
    name = "install_rethinking",
    commands = [
        "R -f /rethinking/install/rethinking.R",
    ],
    image = ":install_R_dependencies_commit.tar",
)

# Construct a tar with the jupyter book cache
pkg_files(
    name = "raw_cache",
    srcs = glob(["jupyter_cache/**"]),
    strip_prefix = "jupyter_cache",
)
pkg_tar(
    name = "cache_tar",
    srcs = [":raw_cache"],
    owner = "1000.100",
)

# Construct a layer with the jupyter book cache
load("@io_bazel_rules_docker//container:container.bzl", "container_layer")
container_layer(
    name="cache_layer",
    directory = "/tmp/_build/.jupyter_cache",
    tars = [":cache_tar"],
)

# Construct a tar with the jupyter book md, yml, etc. sources
pkg_tar(
    name = "notes_tar",
    srcs = glob(["notes/*"]),
    package_dir = "notes",
    owner = "1000.100",
)
pkg_tar(
    name = "jupyter_book_tar",
    srcs = [
        "_config.yml",
        "_toc.yml",
        "executable-notes.svg",
        "executable-notes-mini.svg",
    ],
    deps = [":notes_tar"],
    owner = "1000.100",
)

# Construct a layer with the jupyter book md, yml, etc. sources
container_layer(
    name="source_layer",
    directory = "/home/jovyan/work",
    tars = [":jupyter_book_tar"],
)

# Construct an image with the jupyter cache and jupyter book sources
container_image(
    name = "datascience_with_source",
    base = ":install_rethinking_commit.tar",
    layers = [":cache_layer", ":source_layer"],
    user = "jovyan",
)

load("@io_bazel_rules_docker//docker/util:run.bzl", "container_run_and_extract")
container_run_and_extract(
    name = "extract_build_book",
    commands = ["mkdir -p /tmp/_build",
                "jupyter-book build --warningiserror work --path-output /tmp"],
    extract_file = "/tmp/_build",
    image = ":datascience_with_source.tar",
)

load("@io_bazel_rules_docker//container:container.bzl", "container_push")
container_push(
   name = "push_jln",
   image = "datascience_with_source",
   format = "Docker",
   registry = "registry.gitlab.com",
   repository = "davidvandebunte/$(project)",
   skip_unchanged_digest = True,
   tag = "jln",
)
