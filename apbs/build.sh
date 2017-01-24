#!/bin/bash

# yum install devtoolset-4-gcc* -y
# export CC=/opt/rh/devtoolset-4/root/usr/bin/gcc
# export CXX=/opt/rh/devtoolset-4/root/usr/bin/g++

# # Source
# git clone --recursive https://github.com/Electrostatics/apbs-pdb2pqr.git apbs-pdb2pqr
# cd apbs-pdb2pqr
# git checkout tags/apbs-1.5

cd apbs

ln -s libtinfo.so $PREFIX/lib/libtermcap.so
ln -s libtinfo.so $PREFIX/lib/libtermcap.so.2
ln -s libtinfo.a $PREFIX/lib/libtermcap.a

cp $RECIPE_DIR/CMakeLists.txt CMakeLists.txt

mkdir build && cd build

cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX \
    -DCMAKE_PREFIX_PATH:PATH="$PREFIX" \
    -DCMAKE_INCLUDE_PATH:PATH="$PREFIX/include" \
    -DCMAKE_LIBRARY_PATH:PATH="$PREFIX/lib" \
    -DENABLE_GEOFLOW=ON \
    -DENABLE_PBAM=OFF \
    -DENABLE_BEM=OFF \
    -DENABLE_FETK=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_PYTHON=ON \
    -DENABLE_OPENMP=ON \
    -DENABLE_MPI=ON \
    -DGET_MSMS=OFF \
    -DGET_NanoShaper=OFF \
    ..

make
make install

# -DPYTHON_EXECUTABLE:FILEPATH="$PYTHON" \
# -DPYTHON_INCLUDE_DIR:PATH="$PREFIX/include/python3.5m" \
# -DPYTHON_LIBRARY:FILEPATH="$PREFIX/lib/libpython3.5m.so" \
