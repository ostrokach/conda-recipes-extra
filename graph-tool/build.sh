#!/bin/bash

# Need this line because gcc libraries are in $PREFIX/lib instead of $PREFIX/lib64
ln -s $PREFIX/lib $PREFIX/lib64

#export XORG_PREFIX="$PREFIX"
export PKG_CONFIG_PATH="$PREFIX/share/pkgconfig:$PREFIX/lib/pkgconfig:/usr/share/pkgconfig:/usr/lib/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig"
# export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PREFIX/share/pkgconfig"
export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"
export CFLAGS="-I/usr/lib/gcc/x86_64-linux-gnu/5.3.0/include -I$PREFIX/include"
export CXXFLAGS="-I/usr/lib/gcc/x86_64-linux-gnu/5.3.0/include -I$PREFIX/include"
export CPPFLAGS="-I/usr/lib/gcc/x86_64-linux-gnu/5.3.0/include -I$PREFIX/include"
export LDFLAGS="-L/usr/lib/gcc/x86_64-linux-gnu/5.3.0 -L$PREFIX/lib"  # -L$STDLIB_DIR"

export PKG_INSTALLDIR="$PREFIX"
export CC="gcc-5"
export CXX="g++-5"
./autogen.sh
./configure --enable-openmp --enable-static --prefix="$PREFIX" --with-boost="$PREFIX" --with-boost-libdir="$PREFIX/lib" || { cat config.log ; exit 1 ; }  #-I$PREFIX/include/cairo -I$PREFIX/include/cairomm-1.0 -I$PREFIX/include/pycairo -I$PREFIX/include/sigc++-2.0 -I$PREFIX/include/freetype2 -I$PREFIX/lib/cairomm-1.0/include -I$PREFIX/lib/sigc++-2.0/include -I/usr/include -I/usr/include/X11 -I/usr/include/X11/extensions"   
make -j8
make check
make install

unlink $PREFIX/lib64

