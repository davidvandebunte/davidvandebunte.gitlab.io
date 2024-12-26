FROM quay.io/jupyter/datascience-notebook@sha256:00d82dbe3440004756616ef9b49984a3053687fa0b9ddf5542273a36741b1bb3
# TODO-mpd: Move pip and conda dependencies to notebooks
RUN conda install pint uncertainties r-ragg && \
    pip install jupyter-book jupytext tables dvc
USER root
RUN apt-get install curl
RUN curl https://rclone.org/install.sh | sudo bash
RUN rclone config create aws s3 provider=AWS env_auth=true
ADD packaging/tmp/rethinking_tar.tar /rethinking
RUN chmod 775 /rethinking/install/with-system-packages && /rethinking/install/with-system-packages
RUN apt-get update && apt-get install --yes jq && apt-get clean
USER jovyan
