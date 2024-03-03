FROM quay.io/jupyter/datascience-notebook@sha256:74ac2eba08657329acb78556ea4875bafad8bd891e2331561009fb676770e2d4
# TODO-mpd: Move pip and conda dependencies to notebooks
RUN conda install jira pint uncertainties cmdstan r-ragg && \
    pip install jupyter-book jupytext tables
USER root
COPY . /rethinking
RUN chmod 775 /rethinking/install/with-system-packages && /rethinking/install/with-system-packages
USER jovyan
