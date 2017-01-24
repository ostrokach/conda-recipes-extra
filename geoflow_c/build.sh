#!/bin/bash

git clone https://github.com/Electrostatics/geoflow_c.git 
cd geoflow_c
git checkout e8ce510a670e0b7f3501e72be6141fc20328f947 

mkdir build && cd build
cmake \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DBUILD_SHARED_LIBS=ON \
    ..
make

mkdir -p "$PREFIX/bin" "$PREFIX/lib" "$PREFIX/include"
cp -r ./bin/* $PREFIX/bin/
cp -r ./lib/* $PREFIX/lib/
cp -r ../src/*.h $PREFIX/include/

