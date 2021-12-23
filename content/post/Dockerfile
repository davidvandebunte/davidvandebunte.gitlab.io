# https://hub.docker.com/r/jupyter/scipy-notebook/tags/
FROM "jupyter/datascience-notebook:fcc6e25e5e4a"

RUN conda install \
  jira \
  pint \
  uncertainties
RUN pip install \
  jupyter-book \
  xlsx2csv==0.7.7 \
  tables
