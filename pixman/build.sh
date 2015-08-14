#!/bin/bash

export XORG_PREFIX="/usr"
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"

export CFLAGS="-I$PREFIX/include -I$PREFIX/include/glib-2.0 -I$PREFIX/include/glib-2.0/gobject -I$PREFIX/include/glib-2.0/glib -I$PREFIX/include/glib-2.0/gio -I$PREFIX/include/gobject-introspection-1.0 -I$PREFIX/lib/glib-2.0/include -I/usr/include -I/usr/include/X11 -I/usr/include/X11/extensions"
export CPPFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS -std=c++0x"

export LDFLAGS="-L$PREFIX/lib64 -L$PREFIX/lib -L/usr/local/lib -L/usr/lib "

./configure --prefix=$PREFIX
make
make install

