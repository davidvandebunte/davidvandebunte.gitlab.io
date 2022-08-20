# https://hub.docker.com/layers/datascience-notebook/jupyter/datascience-notebook/latest/images/sha256-d0fc04d56f2baf930395cf8fa48a3fcf64022924decf049dac847d392e0b2591?context=explore
FROM index.docker.io/jupyter/datascience-notebook@sha256:d0fc04d56f2baf930395cf8fa48a3fcf64022924decf049dac847d392e0b2591
# TODO-mpd: Move pip and conda dependencies to notebooks
RUN conda install jira pint uncertainties cmdstan r-ragg && \
    pip install jupyter-book jupytext xlsx2csv==0.7.7 tables
