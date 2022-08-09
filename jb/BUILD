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

# Construct a layer with the jupyter book md, yml, etc. sources
container_layer(
    name="source_layer",
    directory = "/home/jovyan/work",
    tars = ["//jb/tar:jb_tar"],
)

# Construct an image with the jupyter cache and jupyter book sources, with user jovyan
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
container_image(
    name = "datascience_with_source",
    base = "@install_rethinking//image",
    layers = [":cache_layer", ":source_layer"],
)

load("@io_bazel_rules_docker//docker/util:run.bzl", "container_run_and_extract")
container_run_and_extract(
    name = "extract_build_book",
    commands = ["./work/jb-build"],
    extract_file = "/tmp/_build",
    image = ":datascience_with_source.tar",
)
