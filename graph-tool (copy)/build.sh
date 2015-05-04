#!/bin/bash

# Need this line because gcc libraries are in $PREFIX/lib instead of $PREFIX/lib64
ln -s $PREFIX/lib $PREFIX/lib64

#export XORG_PREFIX="$PREFIX"
export PKG_CONFIG_PATH="$PREFIX/share/pkgconfig:$PREFIX/lib/pkgconfig"
#export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"
export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
./configure --enable-openmp --prefix=$PREFIX --with-boost=$PREFIX --with-boost-libdir="$PREFIX/lib" LDFLAGS="-L$PREFIX/lib" CPPFLAGS="-I$PREFIX/include -I$PREFIX/include/cairo -I$PREFIX/include/cairomm-1.0 -I$PREFIX/include/pycairo -I$PREFIX/include/sigc++-2.0 -I$PREFIX/include/freetype2 -I$PREFIX/lib/cairomm-1.0/include -I$PREFIX/lib/sigc++-2.0/include "
make
make install
