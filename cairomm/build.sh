#!/bin/bash

export PKG_CONFIG_PATH="$PREFIX/share/pkgconfig:$PREFIX/lib/pkgconfig"
export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"

export CFLAGS="-I$PREFIX/include -I$PREFIX/include/cairo -I$PREFIX/include/sigc++-2.0 -I$PREFIX/include/sigc++-2.0/sigc++ -I$PREFIX/lib/sigc++-2.0/include -I$PREFIX/include/freetype2 -I$PREFIX/include/glib-2.0 -I$PREFIX/include/glib-2.0/gobject -I$PREFIX/include/glib-2.0/glib -I$PREFIX/include/glib-2.0/gio -I$PREFIX/include/gobject-introspection-1.0 -I$PREFIX/lib/glib-2.0/include -I/usr/include -I/usr/include -I/usr/include/X11 -I/usr/include/X11/extensions"
export CXXFLAGS="$CFLAGS -std=c++0x"
export LDFLAGS="-L$PREFIX/lib64 -L$PREFIX/lib -L/usr/local/lib -L/usr/lib"

export CAIROMM_CFLAGS="-I$PREFIX/include"
export CAIROMM_LIBS="-L$PREFIX/lib"

aclocal
./autogen.sh 
./configure \
    --prefix=$PREFIX  \
    --disable-documentation \
    --enable-introspection=yes
make
make install

