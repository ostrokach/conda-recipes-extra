#!/bin/bash

export CFLAGS="-I$PREFIX/include -I$PREFIX/include/ncurses"
export LDFLAGS="-L$PREFIX/lib"
export CC=gcc

chmod +x configure
./configure --prefix=$PREFIX
make 
make install
