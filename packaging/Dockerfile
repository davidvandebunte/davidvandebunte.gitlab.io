FROM quay.io/jupyter/datascience-notebook
# TODO-mpd: Move pip and conda dependencies to notebooks
# TODO: See "Upgrade to JB2"
RUN conda install pint uncertainties r-ragg && \
    pip install 'jupyter-book<2.0' torch torchvision jupytext tables dvc
USER root
RUN apt-get install curl
RUN curl https://rclone.org/install.sh | sudo bash
RUN rclone config create aws s3 provider=AWS env_auth=true
ADD packaging/tmp/rethinking_tar.tar /rethinking
RUN chmod 775 /rethinking/install/with-system-packages && /rethinking/install/with-system-packages
RUN apt-get update && apt-get install --yes jq && apt-get clean
USER jovyan
