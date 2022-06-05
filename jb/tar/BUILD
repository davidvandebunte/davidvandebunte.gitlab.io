# Construct a tar with the jupyter book md, yml, etc. sources
load("@rules_pkg//:mappings.bzl", "pkg_files")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
pkg_files(
    name = "raw_notes",
    srcs = glob(["notes/**"]),
    strip_prefix = "notes",
)
pkg_tar(
    name = "notes_tar",
    srcs = [":raw_notes"],
    package_dir = "notes",
    owner = "1000.100",
)
pkg_tar(
    name = "jb_tar",
    srcs = [
        "_config.yml",
        "_toc.yml",
        "executable-notes.svg",
        "executable-notes-mini.svg",
        "jb-build",
    ],
    deps = [":notes_tar"],
    owner = "1000.100",
    visibility = ["//jb:__pkg__"],
)
