FROM quay.io/jupyter/datascience-notebook@sha256:3e71e948d5d299b4ad21dd3780397e441e12f573ce519cfa50832501e0265f93
# TODO-mpd: Move pip and conda dependencies to notebooks
RUN conda install jira pint uncertainties cmdstan r-ragg && \
    pip install jupyter-book jupytext tables dvc
USER root
RUN apt-get install curl
RUN curl https://rclone.org/install.sh | sudo bash
RUN rclone config create aws s3 provider=AWS env_auth=true
ADD packaging/tmp/rethinking_tar.tar /rethinking
RUN chmod 775 /rethinking/install/with-system-packages && /rethinking/install/with-system-packages
RUN apt-get update && apt-get install --yes jq && apt-get clean
USER jovyan
