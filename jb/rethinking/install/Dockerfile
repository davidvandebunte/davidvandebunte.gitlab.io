FROM install_conda_pip
USER root
COPY . /rethinking
RUN chmod 775 /rethinking/install/with-system-packages && /rethinking/install/with-system-packages
USER jovyan
