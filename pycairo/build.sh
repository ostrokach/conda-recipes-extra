#!/bin/bash

ln -s $PREFIX/lib $PREFIX/lib64

export XORG_PREFIX="/usr"
export PKG_CONFIG_PATH="$PREFIX/share/pkgconfig:$PREFIX/lib/pkgconfig:/usr/lib/pkgconfig"
export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"

export CFLAGS="-I$PREFIX/include -I$PREFIX/include/glib-2.0 -I$PREFIX/include/glib-2.0/gobject -I$PREFIX/include/glib-2.0/glib -I$PREFIX/include/glib-2.0/gio -I$PREFIX/include/gobject-introspection-1.0 -I$PREFIX/lib/glib-2.0/include -I/usr/include -I/usr/include/X11 -I/usr/include/X11/extensions"
export CPPFLAGS="$CFLAGS"
export LDFLAGS="-L$PREFIX/lib64 -L$PREFIX/lib -L/usr/lib -L/usr/local/lib"

$PYTHON setup.py install
cp $PREFIX/include/pycairo/py3cairo.h $PREFIX/include/pycairo/pycairo.h

unlink $PREFIX/lib64

