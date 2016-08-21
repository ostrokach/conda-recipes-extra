#!/bin/bash

set -e

ln -s $PREFIX/lib $PREFIX/lib64

export PKG_CONFIG_PATH="$PREFIX/share/pkgconfig:$PREFIX/lib/pkgconfig"

export CFLAGS="-I$PREFIX/include -I$PREFIX/include/glib-2.0 -I$PREFIX/include/glib-2.0/gobject -I$PREFIX/include/glib-2.0/glib -I$PREFIX/include/glib-2.0/gio -I$PREFIX/include/gobject-introspection-1.0 -I$PREFIX/lib/libffi-3.2.1/include -I$PREFIX/lib/glib-2.0/include -I$PREFIX/include/pycairo"
export LDFLAGS="-L$PREFIX/lib64 -L$PREFIX/lib"

export PYCAIRO_CFLAGS="-I$PREFIX/include -I$PREFIX/include/glib-2.0 -I$PREFIX/include/glib-2.0/gobject -I$PREFIX/include/glib-2.0/glib -I$PREFIX/include/glib-2.0/gio -I$PREFIX/include/gobject-introspection-1.0 -I$PREFIX/lib/libffi-3.2.1/include -I$PREFIX/lib/glib-2.0/include $PREFIX/include/pycairo"
export PYCAIRO_LIBS="-L$PREFIX/lib64 -L$PREFIX/lib"

export FFI_CFLAGS="-I$PREFIX/include"
export FFI_LIBS="-L$PREFIX/lib"

./configure --prefix=$PREFIX || { cat config.log ; exit 1 ; }
make -j$(nproc --ignore=4)
make install

cd $PREFIX
rm -rf share/gtk-doc

unlink $PREFIX/lib64

