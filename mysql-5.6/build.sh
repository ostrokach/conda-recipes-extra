#!/bin/sh

mkdir -p $PREFIX/bin
mkdir -p $LIBRARY_PATH
mkdir -p $INCLUDE_PATH

cp -r ./bin $PREFIX
cp -r ./lib $PREFIX
cp -r ./include $PREFIX
