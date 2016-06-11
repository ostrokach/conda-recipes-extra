#!/bin/bash

export CFLAGS="-I$PREFIX/include"
export CPPFLAGS="-I$PREFIX/include"
export CXXFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export CC=gcc

./configure \
    --prefix=$PREFIX \
    --with-pkg-config="$PREFIX/lib/pkgconfig" \
    --with-pkg-config-libdir="$PREFIX/lib/pkgconfig" \
    --enable-pc-files \
    --enable-widec \
    --with-shared \
    --with-cxx-shared \
    --with-pthread \
    --without-debug \
    --without-manpages \
    --disable-overwrite \
    --disable-lib-suffixes
make
make install

