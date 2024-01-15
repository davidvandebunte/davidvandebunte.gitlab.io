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
