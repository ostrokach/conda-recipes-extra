#!/bin/bash

export XORG_PREFIX="/usr"
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"

export CFLAGS="-I$PREFIX/include -I$PREFIX/include/glib-2.0 -I$PREFIX/include/glib-2.0/gobject -I$PREFIX/include/glib-2.0/glib -I$PREFIX/include/glib-2.0/gio -I$PREFIX/include/gobject-introspection-1.0 -L$PREFIX/lib -L$PREFIX/lib64 -I$PREFIX/lib/glib-2.0/include -I$PREFIX/include/X11 -I$PREFIX/include/X11/extensions -I$PREFIX/lib/libffi-3.2/include"
export CPPFLAGS="$CFLAGS"

export LDFLAGS="-L$PREFIX/lib64 -L$PREFIX/lib"

export LIBFFI_CFLAGS="-I$PREFIX/lib/libffi-3.2.1/include"
export LIBFFI_LIBS="-L$PREFIX/lib64 -lffi"

./configure \
    --prefix=$PREFIX \
    --disable-static \
    --enable-warnings \
    --enable-ft \
    --enable-ps \
    --enable-pdf \
    --enable-svg \
    --enable-gobject=yes \
    --enable-introspection=yes \
    --disable-gtk-doc

# # WARNING: unrecognized options: --enable-warnings, --enable-ft, --enable-ps, --enable-pdf, --enable-svg, --enable-gobject, --enable-introspection
make
make install

