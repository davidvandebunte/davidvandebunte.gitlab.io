# Add user to hugo image
load("@io_bazel_rules_docker//docker/util:run.bzl", "container_run_and_commit")
container_run_and_commit(
  name = "user_hugo",
  commands = [
      "apk add git",
      "adduser -HD -u 998 -s /bin/sh gitlab-runner",
      "adduser -HD -u 1000 -s /bin/sh standard-runner",
  ],
  image = "@base_hugo//image",
)

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
container_image(
    name = "user_hugo_img",
    base = ":user_hugo_commit.tar",
)

# You can change the `registry` and `repository` arguments to arbitrary strings (without removing
# them) and this build will still work; this target only builds a script.
load("@io_bazel_rules_docker//container:container.bzl", "container_push")
container_push(
   name = "push_hugo_img",
   image = "user_hugo_img",
   format = "Docker",
   registry = "registry.gitlab.com",
   repository = "davidvandebunte/$(project)",
   tag = "user_hugo",
)
