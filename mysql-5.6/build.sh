#!/bin/sh

mkdir -p $PREFIX/bin
mkdir -p $PREFIX/lib
mkdir -p $PREFIX/include

cp -r ./bin $PREFIX
cp -r ./lib $PREFIX
cp -r ./include $PREFIX
