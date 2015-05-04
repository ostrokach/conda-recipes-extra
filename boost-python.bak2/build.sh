#!/bin/bash

# This is really important. Conda build sets the deployment target to 10.5 and
# this seems to be the main reason why the build environment is different in
# conda compared to compiling on the command line. Linking against libc++ does
# not work for old deployment targets.
export MACOSX_DEPLOYMENT_TARGET="10.8"

export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export PYTHONPATH="$PREFIX/bin/python"
export CPLUS_INCLUDE_PATH="$PREFIX/include/python3.4m"

mkdir -vp ${PREFIX}/lib;

./bootstrap.sh \
    --prefix="${PREFIX}/" \
    --with-python=${PYTHON};

# On Linux we use g++ and its libstdc++. On OS X we use clang (which is the
# default anyway) with its libc++. (On OS X, libstdc++ does not work for C++11,
# because it is too old.)
if [ "$OSX_ARCH" == "" ]; then
    # Linux
    ./b2 \
        --layout=tagged \
        --build-type=complete \
        cxxflags="-std=c++11" \
        link=shared \
        stage;
else
    # OS X
    ./b2 \
        --layout=tagged \
        --build-type=complete \
        toolset=clang \
        cxxflags="-std=c++11 -stdlib=libc++" \
        linkflags="-stdlib=libc++" \
        stage;
fi

cp -a stage/lib "$PREFIX"
cp -R boost "${INCLUDE_PATH}"
