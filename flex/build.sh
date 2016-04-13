#!/bin/bash

export CC=gcc
export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"

export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PREFIX/share/pkgconfig"

./configure --prefix=$PREFIX 
make
make install

