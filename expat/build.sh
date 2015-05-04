#!/bin/bash

export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"

alias CC=gcc
./configure --prefix=$PREFIX
make
make install
