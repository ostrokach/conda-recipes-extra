#!/bin/bash

ln -s $PREFIX/lib $PREFIX/lib64

set -e
#export XORG_PREFIX="/usr"
#export PKG_CONFIG_PATH="$PREFIX/share/pkgconfig:$PREFIX/lib/pkgconfig:/usr/share/pkgconfig:/usr/lib/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig"
#export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal -I/usr/share/aclocal"
export PKG_CONFIG_PATH="$PREFIX/share/pkgconfig:$PREFIX/lib/pkgconfig"

#export CFLAGS="-I$PREFIX/include -I$PREFIX/include/glib-2.0 -I$PREFIX/include/glib-2.0/gobject -I$PREFIX/include/glib-2.0/glib -I$PREFIX/include/glib-2.0/gio -I$PREFIX/include/gobject-introspection-1.0 -I$PREFIX/lib/libffi-3.2.1/include -I$PREFIX/lib/glib-2.0/include -I$PREFIX/include/pycairo -I/usr/include -I/usr/include/X11 -I/usr/include/X11/extensions"
#export LDFLAGS="-L$PREFIX/lib64 -L$PREFIX/lib -L/usr/lib -L/usr/local/lib"
export CFLAGS="-I$PREFIX/include -I$PREFIX/include/glib-2.0 -I$PREFIX/include/glib-2.0/gobject -I$PREFIX/include/glib-2.0/glib -I$PREFIX/include/glib-2.0/gio -I$PREFIX/include/gobject-introspection-1.0 -I$PREFIX/lib/libffi-3.2.1/include -I$PREFIX/lib/glib-2.0/include -I$PREFIX/include/pycairo"
export LDFLAGS="-L$PREFIX/lib64 -L$PREFIX/lib"

#export PYCAIRO_CFLAGS="-I$PREFIX/include -I$PREFIX/include/glib-2.0 -I$PREFIX/include/glib-2.0/gobject -I$PREFIX/include/glib-2.0/glib -I$PREFIX/include/glib-2.0/gio -I$PREFIX/include/gobject-introspection-1.0 -I$PREFIX/lib/libffi-3.2.1/include -I$PREFIX/lib/glib-2.0/include $PREFIX/include/pycairo -I/usr/include -I/usr/include/X11 -I/usr/include/X11/extensions"
#export PYCAIRO_LIBS="-L$PREFIX/lib64 -L$PREFIX/lib -L/usr/lib -L/usr/local/lib"
export PYCAIRO_CFLAGS="-I$PREFIX/include -I$PREFIX/include/glib-2.0 -I$PREFIX/include/glib-2.0/gobject -I$PREFIX/include/glib-2.0/glib -I$PREFIX/include/glib-2.0/gio -I$PREFIX/include/gobject-introspection-1.0 -I$PREFIX/lib/libffi-3.2.1/include -I$PREFIX/lib/glib-2.0/include $PREFIX/include/pycairo"
export PYCAIRO_LIBS="-L$PREFIX/lib64 -L$PREFIX/lib"

# export FFI_CFLAGS="-I$PREFIX/include" FFI_LIBS="-L$PREFIX/lib -lffi"
export FFI_CFLAGS="-I$PREFIX/include"
export FFI_LIBS="-L$PREFIX/lib"

./configure --prefix=$PREFIX || { cat config.log ; exit 1 ; }
make -j$(nproc --ignore=4)
make install

cd $PREFIX
rm -rf share/gtk-doc

unlink $PREFIX/lib64


