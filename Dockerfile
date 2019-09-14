FROM continuumio/miniconda3:4.7.10
ARG DOCKER_TAG
RUN conda install -c conda-forge git-annex \
    && sync && conda clean --all && sync
RUN pip install "datalad${DOCKER_TAG+==$DOCKER_TAG}" \
    && rm -rf ~/.cache/pip/* && sync
