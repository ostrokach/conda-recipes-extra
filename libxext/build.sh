#!/bin/bash

export XORG_PREFIX="$PREFIX"
export PKG_CONFIG_PATH="/usr/lib/pkgconfig:$PREFIX/share/pkgconfig:$PREFIX/lib/pkgconfig"
export ACLOCAL_FLAGS="/usr/share/aclocal-I$PREFIX/share/aclocal"

export CFLAGS="-I$PREFIX/include"
export X11_CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib -L$PREFIX/lib64"
export X11_LIBS="-L$PREFIX/lib -L$PREFIX/lib64"
./autogen.sh --prefix=$PREFIX --enable-network
./configure --prefix=$PREFIX --enable-network
make
make install

