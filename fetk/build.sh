#!/bin/bash

git clone https://github.com/Electrostatics/FETK.git
cd FETK
git checkout 0c6fdeabe8929acea7481cb1480b5706b343b7e0

echo 'y' | ./fetk-build all

mkdir -p "${PREFIX}/bin" "${PREFIX}/lib" "${PREFIX}/include"

cp -r build/*/bin/* "${PREFIX}/bin"
cp -r build/*/lib/* "${PREFIX}/lib"
cp -r build/*/include/* "${PREFIX}/include"

