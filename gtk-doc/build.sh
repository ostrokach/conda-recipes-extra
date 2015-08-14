#!/bin/bash

export XORG_PREFIX="$PREFIX"
export PKG_CONFIG_PATH="$PREFIX/share/pkgconfig:$PREFIX/lib/pkgconfig"
export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"

export CFLAGS="-I$PREFIX/include"
export CPPFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"

./configure --prefix=$PREFIX --disable-gtk-doc
make
make install

