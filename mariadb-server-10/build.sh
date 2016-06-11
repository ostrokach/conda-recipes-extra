#!/bin/bash

mkdir -p $PREFIX/bin $PREFIX/include $PREFIX/lib $PREFIX/share

mv ./bin/* $PREFIX/bin/
mv ./scripts/* $PREFIX/bin/
mv ./include/* $PREFIX/include/
mv ./lib/* $PREFIX/lib/
mv ./share/* $PREFIX/share/ 

