#!/bin/bash

ln -s $PREFIX/lib $PREFIX/lib64

export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PREFIX/share/pkgconfig"
export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"

#export CFLAGS="-I$PREFIX/include -I$PREFIX/include/glib-2.0 -I$PREFIX/include/glib-2.0/gobject -I$PREFIX/include/glib-2.0/glib -I$PREFIX/include/glib-2.0/gio -I$PREFIX/include/gobject-introspection-1.0 -I$PREFIX/lib/glib-2.0/include -I$PREFIX/lib/libffi-3.2/include"
#export CXXFLAGS="$CFLAGS"
#export LDFLAGS="-L$PREFIX/lib64 -L$PREFIX/lib"

#export LIBFFI_CFLAGS="-I$PREFIX/include -L$PREFIX/lib"
#export LIBFFI_LIBS="-L$PREFIX/lib"

./configure  --prefix=$PREFIX --enable-introspection=yes 
make
make install

unlink $PREFIX/lib64

