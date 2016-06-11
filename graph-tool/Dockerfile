FROM ostrokach/centos6-gcc5:squashed

# Install conda
RUN mkdir -p /tmp/conda-build && \
    cd /tmp/conda-build && \
    wget --no-verbose https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /anaconda && \
    rm -r /tmp/*
ENV PATH=/anaconda/bin:$PATH
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN mkdir -p /anaconda/conda-bld/linux-64 /anaconda/conda-bld/osx-64  # workaround for bug in current conda (conda issue #466)

# Setup conda
RUN conda config --set always_yes yes --set changeps1 no
RUN conda update -q conda 
RUN conda install -q _license conda-build
RUN conda index /anaconda/conda-bld/linux-64 /anaconda/conda-bld/osx-64

# Add relevant channels and install packages
RUN conda config \
    --add channels ostrokach \ 
    --add channels defaults \
    --add channels conda-forge \
    --add channels omnia \
    --add channels bioconda
RUN cat ~/.condarc && conda info -a

# Default command
CMD ["/bin/bash"]

