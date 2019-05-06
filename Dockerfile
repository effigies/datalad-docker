FROM continuumio/miniconda3:4.6.14
RUN conda install -c conda-forge git-annex \
    && sync && conda clean --all && sync
RUN pip install datalad \
    && rm -rf ~/.cache/pip/* && sync
