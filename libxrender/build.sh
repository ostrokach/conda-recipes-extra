#!/bin/bash

export XORG_PREFIX=$PREFIX
export XORG_CONFIG="--prefix=$PREFIX --disable-static"
export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"
export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
./autogen.sh --prefix=$PREFIX --enable-network
./configure --prefix=$PREFIX --enable-network
make
make install

