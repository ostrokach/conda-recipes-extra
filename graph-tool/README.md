# graph-tool conda recipe


## Create Docker container

```
docker build .
```

## Compile graph-tool inside a Docker container

```
# Start and connect to a docker container
$ docker run -it -v `pwd`:/recipe --entrypoint /bin/bash {docker_image_id}

# Compile graph-tool
conda build /recipe

# Upload graph-tool conda package to anaconda.org
anaconda upload /anaconda/conda-bld/linux-64/graph-tool-{{ version }}.tar.bz
```

## Install graph-tool

Add requied channels to your `~/.condarc`:

```
$ conda add channels ostrokach
$ conda add channels {{ your channel }}
$ conda add channels defaults
$ conda add channels conda-forge
```

Install graph-tool:

```
$ conda install graph-tool
```

Test your graph-tool installation:

```
$ python -c "from graph_tool.all import *"
```

## Enable plotting

In order to get graph-tool plotting to work, you also need to install:

```
$ conda install 'pango==1.40.0' librsvg pygobject matplotlib -c ostrokach
```

Note that this will install *a lot* of dependencies, including Glib and Xorg (~ 100 MB).

## Errors

### GLIBCXX_3.4.14 not found

If you get the following error:

```
ImportError: /usr/lib64/libstdc++.so.6: version `GLIBCXX_3.4.14' not found (required by /opt/conda/lib/python3.5/site-packages/graph_tool/libgraph_tool_core.so)
```

it means that the GCC libraries on your system are older than the libraries required to compile graph-tool. Usually, this can be fixed by installing `libgcc` from conda:

```
$ conda install libgcc

Using Anaconda API: https://api.anaconda.org
Fetching package metadata ...........
Solving package specifications: ..........

Package plan for installation in environment /opt/conda:

The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    libgcc-5.2.0               |                0         1.1 MB  defaults

The following NEW packages will be INSTALLED:

    libgcc: 5.2.0-0 defaults
```

