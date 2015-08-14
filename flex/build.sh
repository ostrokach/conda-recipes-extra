#!/bin/bash

export CC=gcc
export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"

./configure --prefix=$PREFIX 
make
make install

