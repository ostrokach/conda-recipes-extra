#!/bin/bash

export CFLAGS="-I$PREFIX/include -I$PREFIX/include/ncurses"
export LDFLAGS="-L$PREFIX/lib"
export CC=gcc

mkdir -p $PREFIX/lib

sh ./configure --prefix=$PREFIX \
    --without-debug --without-ada --without-manpages \
    --with-shared --disable-overwrite

make -j$(getconf _NPROCESSORS_ONLN)
make install
