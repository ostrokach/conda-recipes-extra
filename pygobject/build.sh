#!/bin/bash

ln -s $PREFIX/lib $PREFIX/lib64

export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PREFIX/share/pkgconfig"
export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"

#export CFLAGS="-I$PREFIX/include -I$PREFIX/include/cairo -I$PREFIX/include/sigc++-2.0 -I$PREFIX/include/sigc++-2.0/sigc++ -I$PREFIX/lib/sigc++-2.0/include -I$PREFIX/include/freetype2 -I$PREFIX/include/glib-2.0 -I$PREFIX/include/glib-2.0/gobject -I$PREFIX/include/glib-2.0/glib -I$PREFIX/include/glib-2.0/gio -I$PREFIX/include/gobject-introspection-1.0 -I$PREFIX/lib/glib-2.0/include -I$PREFIX/lib/libffi-3.2/include -I/usr/include -I/usr/local/include -I/usr/include/X11 -I/usr/include/X11/extensions"
# export CPPFLAGS="$CFLAGS"
# export CXXFLAGS="$CFLAGS -std=c++0x"
#export LDFLAGS="-L$PREFIX/lib64 -L$PREFIX/lib -L$PREFIX/lib/glib-2.0 -L/usr/local/lib -L/usr/lib"

# export CAIROMM_CFLAGS="-I$PREFIX/include"
# export CAIROMM_LIBS="-L$PREFIX/lib"

#export LIBFFI_CFLAGS="-I$PREFIX/lib/libffi-3.2.1/include"
#export LIBFFI_LIBS="-L$PREFIX/lib64 -lffi"

#export GLIB_CFLAGS="-I$PREFIX/include -I$PREFIX/include/glib-2.0 -I$PREFIX/include/glib-2.0/gobject -I$PREFIX/include/glib-2.0/glib -I$PREFIX/include/glib-2.0/gio -I$PREFIX/include/gobject-introspection-1.0 -I$PREFIX/lib/glib-2.0/include"
#export GLIB_LIBS="$LDFLAGS"

# aclocal
# ./autogen.sh --prefix=$PREFIX
./configure --prefix=$PREFIX #LDFLAGS="-L$PREFIX/lib -L$PREFIX/lib64" CPPFLAGS="-I$PREFIX/include -I$PREFIX/include/cairo -I$PREFIX/include/cairomm-1.0 -I$PREFIX/include/pycairo -I$PREFIX/include/sigc++-2.0 -I$PREFIX/include/freetype2 -I$PREFIX/lib/cairomm-1.0/include -I$PREFIX/lib/sigc++-2.0/include -I/usr/include -I/usr/include/X11 -I/usr/include/X11/extensions" 
make
# make check
make install

unlink $PREFIX/lib64

