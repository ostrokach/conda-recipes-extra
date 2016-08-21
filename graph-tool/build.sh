#!/bin/bash

set -e

# Need this line because gcc libraries are in $PREFIX/lib instead of $PREFIX/lib64
ln -s $PREFIX/lib $PREFIX/lib64

# For some reason, downloading graph-tool from meta.yml gives a checksum error...? 
MD5SUM="9bec4f9659c8169298831a9acce2742e  graph-tool-2.18.tar.bz2"
wget https://downloads.skewed.de/graph-tool/graph-tool-2.18.tar.bz2
echo "$MD5SUM" | md5sum -c -
tar xf graph-tool-2.18.tar.bz2
cd graph-tool-2.18

export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PREFIX/share/pkgconfig"

export CFLAGS="-I$PREFIX/include"
export CXXFLAGS="$CFLAGS"
export CPPFLAGS="$CFLAGS"

export LDFLAGS="-L$PREFIX/lib"

export CC="/usr/bin/gcc"  # gcc 5 inside Docker
export CXX="/usr/bin/g++"  # g++ 5 inside Docker

export PKG_INSTALLDIR="$PREFIX"
./autogen.sh
./configure --enable-openmp --enable-static --prefix="$PREFIX" --with-boost="$PREFIX" --with-boost-libdir="$PREFIX/lib" 
# || { cat config.log ; exit 1 ; }  #-I$PREFIX/include/cairo -I$PREFIX/include/cairomm-1.0 -I$PREFIX/include/pycairo -I$PREFIX/include/sigc++-2.0 -I$PREFIX/include/freetype2 -I$PREFIX/lib/cairomm-1.0/include -I$PREFIX/lib/sigc++-2.0/include -I/usr/include -I/usr/include/X11 -I/usr/include/X11/extensions"   
make -j$(nproc)
make check
make install

unlink $PREFIX/lib64

