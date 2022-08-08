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

# Construct a layer with the jupyter book cache
load("@io_bazel_rules_docker//container:container.bzl", "container_layer")
container_layer(
    name="rethinking_layer",
    directory = "/rethinking",
    tars = [":rethinking_tar"],
)

# Construct an image with the rethinking dependency
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
container_image(
    name = "root_ds_image",
    base = "@install_conda_pip//image",
    user = "root",
    layers = [":rethinking_layer"],
)
load("@io_bazel_rules_docker//docker/util:run.bzl", "container_run_and_commit_layer")
container_run_and_commit_layer(
    name = "install_rethinking",
    commands = [
        "chmod 777 /tmp && apt-get update && apt-get install -y g++ libpng-dev libjpeg-dev libfontconfig1-dev libfreetype6-dev libharfbuzz-dev libfribidi-dev libtiff-dev && apt-get clean",
        "R -f /rethinking/install/rstan.R",
        "R -f /rethinking/install/dependencies.R",
        "R -f /rethinking/install/rethinking.R",
    ],
    image = ":root_ds_image.tar",
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
container_layer(
    name="cache_layer",
    directory = "/tmp/_build/.jupyter_cache",
    tars = [":cache_tar"],
)

# Construct a layer with the jupyter book md, yml, etc. sources
container_layer(
    name="source_layer",
    directory = "/home/jovyan/work",
    tars = ["//jb/tar:jb_tar"],
)

# Construct an image with the jupyter cache and jupyter book sources, with user jovyan
container_image(
    name = "datascience_with_source",
    base = "@install_conda_pip//image",
    layers = [":rethinking_layer", ":install_rethinking", ":cache_layer", ":source_layer"],
)

load("@io_bazel_rules_docker//docker/util:run.bzl", "container_run_and_extract")
container_run_and_extract(
    name = "extract_build_book",
    commands = ["./work/jb-build"],
    extract_file = "/tmp/_build",
    image = ":datascience_with_source.tar",
)
