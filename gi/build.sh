#!/bin/bash

export XORG_PREFIX="$PREFIX"
export PKG_CONFIG_PATH="$PREFIX/share/pkgconfig:$PREFIX/lib/pkgconfig"
export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"

export CFLAGS="-I$PREFIX/include -I$PREFIX/include/cairo -I$PREFIX/include/sigc++-2.0 -I$PREFIX/lib/sigc++-2.0/include -I$PREFIX/include/freetype2 -I$PREFIX/include/X11 -I$PREFIX/include/X11/Xtrans -I$PREFIX/include/X11/extensions"
export CPPFLAGS="-I$PREFIX/include -I$PREFIX/include/cairo -I$PREFIX/include/sigc++-2.0 -I$PREFIX/lib/sigc++-2.0/include -I$PREFIX/include/freetype2 -I$PREFIX/include/X11 -I$PREFIX/include/X11/Xtrans -I$PREFIX/include/X11/extensions"
export CAIRO_CFLAGS="-I$PREFIX/include -I$PREFIX/include/cairo -I$PREFIX/include/sigc++-2.0 -I$PREFIX/lib/sigc++-2.0/include -I$PREFIX/include/freetype2 -I$PREFIX/include/X11 -I$PREFIX/include/X11/Xtrans -I$PREFIX/include/X11/extensions"

export LDFLAGS="-L$PREFIX/lib"
export CAIRO_LIBS="-L$PREFIX/lib"

export GLIB_CFLAGS="-I$PREFIX/include -I$PREFIX/include/cairo -I$PREFIX/include/sigc++-2.0 -I$PREFIX/lib/sigc++-2.0/include -I$PREFIX/include/freetype2 -I$PREFIX/include/X11 -I$PREFIX/include/X11/Xtrans -I$PREFIX/include/X11/extensions"
export GLIB_LIBS="-L$PREFIX/lib"

export GOBJECT_CFLAGS="-I$PREFIX/include -I$PREFIX/include/cairo -I$PREFIX/include/sigc++-2.0 -I$PREFIX/lib/sigc++-2.0/include -I$PREFIX/include/freetype2 -I$PREFIX/include/X11 -I$PREFIX/include/X11/Xtrans -I$PREFIX/include/X11/extensions"
export GOBJECT_LIBS="-L$PREFIX/lib"

export GIO_CFLAGS="-I$PREFIX/include -I$PREFIX/include/cairo -I$PREFIX/include/sigc++-2.0 -I$PREFIX/lib/sigc++-2.0/include -I$PREFIX/include/freetype2 -I$PREFIX/include/X11 -I$PREFIX/include/X11/Xtrans -I$PREFIX/include/X11/extensions"
export GIO_LIBS="-L$PREFIX/lib"

./configure --prefix=$PREFIX 
make
make install

