---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.1
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Rclone

+++

## Mount

+++

Per [Rclone poll-interval mount support](https://forum.rclone.org/t/rclone-poll-interval-mount-support/39858), `rclone mount` with SFTP does not support `--poll-interval`. Instead, you may need to set `--dir-cache-time` based on how quickly you need to be able to see remote build results. This is currently configured to `30s` because a Jupyter Book build takes about `1m` and so this overhead likely won't be noticeable.
