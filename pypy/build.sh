#!/bin/bash

mkdir -p $PREFIX/bin
mkdir -p $PREFIX/lib
mkdir -p $PREFIX/include
mkdir -p $PREFIX/lib_pypy
mkdir -p $PREFIX/lib-python

mv $SRC_DIR/bin/pypy* $PREFIX/bin/
mv $SRC_DIR/bin/libpypy-c.so $PREFIX/lib/
mv $SRC_DIR/include/* $PREFIX/include/
mv $SRC_DIR/lib_pypy/* $PREFIX/lib_pypy/
mv $SRC_DIR/lib-python/* $PREFIX/lib-python/

