FROM quay.io/jupyter/datascience-notebook@sha256:24a507a146d0710f624cc7b7000974075943bb40a29a03ffa9581889eccee0c2
# TODO-mpd: Move pip and conda dependencies to notebooks
RUN conda install jira pint uncertainties cmdstan r-ragg && \
    pip install jupyter-book jupytext tables
USER root
COPY . /rethinking
RUN chmod 775 /rethinking/install/with-system-packages && /rethinking/install/with-system-packages
USER jovyan
