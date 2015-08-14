#!/bin/bash

export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:/usr/lib/pkgconfig"
export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"

# export CFLAGS="-I$PREFIX/include -I$PREFIX/include/freetype2 -I/usr/include"
# export CPPFLAGS="$CFLAGS"
# export CXXFLAGS="$CFLAGS"
# export LDFLAGS="-L$PREFIX/lib64 -L$PREFIX/lib"

aclocal
./configure  --prefix=$PREFIX # LDFLAGS="-L$PREFIX/lib" CPPFLAGS="-I$PREFIX/include"
make
make check
make install

