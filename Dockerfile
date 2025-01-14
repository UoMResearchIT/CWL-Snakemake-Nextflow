FROM mambaorg/micromamba
ENV LANG=C.UTF-8
SHELL ["/bin/bash", "-c"] 
USER root 

# Snakemake
RUN apt-get update && \
    apt-get install -y --no-install-recommends bzip2 ca-certificates curl wget gnupg2 squashfs-tools git

RUN micromamba create -q -y -c bioconda -c conda-forge -n snakemake snakemake && \
    eval "$(micromamba shell hook --shell bash)" && \
    micromamba activate /opt/conda/envs/snakemake && \
    micromamba install -c conda-forge conda && \
    micromamba clean --all -y

ENV PATH=/opt/conda/envs/snakemake/bin:${PATH}
RUN snakemake --version

# Nextflow
RUN apt-get install -y openjdk-17-jdk openjdk-17-jre && \
    curl -s https://get.nextflow.io | bash && \
    mv nextflow /usr/local/bin/
RUN nextflow info

# cwltool
RUN conda install -c conda-forge nodejs cwltool
RUN cwltool --version

COPY examples /examples
WORKDIR /examples

CMD ["bash"]