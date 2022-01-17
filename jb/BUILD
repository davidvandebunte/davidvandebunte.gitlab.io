load("@io_bazel_rules_docker//docker/util:run.bzl", "container_run_and_commit")
container_run_and_commit(
  name = "install_conda_pip",
  commands = [
      "conda install jira pint uncertainties",
      "pip install jupyter-book xlsx2csv==0.7.7 tables",
  ],
  image = "@scipy_notebook//image",
)

load("@rules_pkg//:mappings.bzl", "pkg_files")
pkg_files(
    name = "raw_cache",
    srcs = glob(["jupyter_cache/**"]),
    strip_prefix = "jupyter_cache",
)

load("@rules_pkg//:pkg.bzl", "pkg_tar")
pkg_tar(
    name = "cache_tar",
    srcs = [":raw_cache"],
    owner = "1000.100",
)

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
container_image(
    name = "scipy_with_cache",
    base = ":install_conda_pip_commit.tar",
    directory = "/tmp/_build/.jupyter_cache",
    tars = [":cache_tar"],
)

pkg_tar(
    name = "notes_tar",
    srcs = glob(["notes/*.md"]),
    package_dir = "notes",
    owner = "1000.100",
)
pkg_tar(
    name = "vgt_tar",
    srcs = glob(["vgt/*.md"]),
    package_dir = "vgt",
    owner = "1000.100",
)
pkg_tar(
    name = "page_tar",
    srcs = glob(["page/*.md"]),
    package_dir = "page",
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
    deps = [":notes_tar", ":vgt_tar", ":page_tar"],
    owner = "1000.100",
)
container_image(
    name = "scipy_with_source",
    base = ":scipy_with_cache.tar",
    directory = "/home/jovyan/work",
    tars = [":jupyter_book_tar"],
)

load("@io_bazel_rules_docker//docker/util:run.bzl", "container_run_and_extract")
container_run_and_extract(
    name = "extract_build_book",
    commands = ["mkdir -p /tmp/_build",
                "jupyter-book build work --path-output /tmp >/tmp/_build/out.txt 2>&1"],
    extract_file = "/tmp/_build",
    image = ":scipy_with_source.tar",
)

load("@io_bazel_rules_docker//container:container.bzl", "container_push")
container_push(
   name = "push_jln",
   image = "scipy_with_source",
   format = "Docker",
   registry = "registry.gitlab.com",
   repository = "davidvandebunte/$(project)",
   skip_unchanged_digest = True,
   tag = "jln",
)
