#!/bin/bash

export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"
export CAIROMM_LIBS="$PREFIX/lib"
export CAIROMM_CFLAGS="$PREFIX/include"
export PKG_CONFIG_PATH="$PREFIX/include"
./autogen.sh LDFLAGS="-L$PREFIX/lib" CPPFLAGS="-I$PREFIX/include"
./configure --prefix=$PREFIX LDFLAGS="-L$PREFIX/lib" CPPFLAGS="-I$PREFIX/include -I$PREFIX/include/cairo -I$PREFIX/include/sigc++-2.0 -I$PREFIX/lib/sigc++-2.0/include -I$PREFIX/include/freetype2 -I/usr/include -I/usr/include/X11 -I/usr/include/X11/extensions"
make
make install
unset ACLOCAL_FLAGS CAIROMM_LIBS CAIROMM_CFLAGS

