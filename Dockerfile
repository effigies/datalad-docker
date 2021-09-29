FROM continuumio/miniconda3:4.10.3
ARG DOCKER_TAG
RUN apt-get update && \
    apt-get install -y --no-install-recommends netbase
RUN conda install -c conda-forge git-annex \
    && sync && conda clean --all && sync
RUN pip install "datalad${DOCKER_TAG+==$DOCKER_TAG}" && \
    pip install datalad-osf && \
    rm -rf ~/.cache/pip/* && sync
