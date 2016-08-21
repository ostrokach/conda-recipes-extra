#!/bin/bash

ln -s $PREFIX/lib $PREFIX/lib64

export XORG_PREFIX="/usr"
export PKG_CONFIG_PATH="$PREFIX/share/pkgconfig:$PREFIX/lib/pkgconfig:/usr/lib/pkgconfig"
export ACLOCAL_FLAGS="/usr/share/aclocal-I$PREFIX/share/aclocal"

export CFLAGS="-I$PREFIX/include -I$PREFIX/include/glib-2.0 -I$PREFIX/include/glib-2.0/gobject -I$PREFIX/include/glib-2.0/glib -I$PREFIX/include/glib-2.0/gio -I$PREFIX/include/gobject-introspection-1.0 -I$PREFIX/lib/glib-2.0/include -I/usr/include -I/usr/include/X11 -I/usr/include/X11/extensions"
export LDFLAGS="-L$PREFIX/lib64 -L$PREFIX/lib -L/usr/lib -L/usr/local/lib"

./configure \
    --prefix=$PREFIX \
    --x-libraries=/usr/include/X11 \
    --disable-static \
    --enable-warnings \
    --enable-ft \
    --enable-ps \
    --enable-pdf \
    --enable-svg \
    --enable-gobject=yes \
    --enable-introspection=yes \
    --enable-xlib \
    --enable-xcb \
    --enable-xlib-xcb \
    --disable-xcb-shm \
    --disable-gtk-doc
make
make install

unlink $PREFIX/lib64

