#!/bin/bash

export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export CC=gcc

make
cp topol $PREFIX/bin/knot
