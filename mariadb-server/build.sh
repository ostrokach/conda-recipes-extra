#!/bin/bash

set -e

mkdir -p $PREFIX/bin $PREFIX/include $PREFIX/lib $PREFIX/share

mv ./bin/* $PREFIX/bin/
mv ./scripts/* $PREFIX/bin/
mv ./include/* $PREFIX/include/
mv ./lib/* $PREFIX/lib/
mv ./share/* $PREFIX/share/ 

# Need 'libodbc.so.1' for the CONNECT engine to work...
(cd $PREFIX/lib && ln -s libodbc.so libodbc.so.1)

