#!/bin/bash

# wget http://downloads.skewed.de/graph-tool/graph-tool-2.2.35.tar.bz2
cp /home/kimlab1/strokach/programs/archives/graph-tool-2.2.35.tar.bz2 .
tar xjvf graph-tool*
cd graph-tool*
export ACLOCAL_FLAGS="-I $PREFIX/share/aclocal"
export CAIROMM_LIBS="$PREFIX/lib"
export CAIROMM_CFLAGS="$PREFIX/include"
export PKG_CONFIG_PATH="$PREFIX/include"
./configure  --enable-openmp --prefix=$PREFIX --with-boost=$PREFIX LDFLAGS="-L$PREFIX/lib" CPPFLAGS="-I$PREFIX/include -I$PREFIX/include/cairo -I$PREFIX/include/cairomm-1.0 -I$PREFIX/include/pycairo -I$PREFIX/include/sigc++-2.0 -I$PREFIX/include/freetype2 -I$PREFIX/lib/cairomm-1.0/include -I$PREFIX/lib/sigc++-2.0/include -I/usr/include -I/usr/include/X11 -I/usr/include/X11/extensions"
make
make install
unset ACLOCAL_FLAGS CAIROMM_LIBS CAIROMM_CFLAGS PKG_CONFIG_PATH
