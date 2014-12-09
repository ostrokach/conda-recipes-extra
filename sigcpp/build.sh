#!/bin/bash

wget http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.4/libsigc++-2.4.0.tar.xz
tar xJvf libsigc*
cd libsigc*
export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"
./configure --prefix=$PREFIX LDFLAGS="-L$PREFIX/lib" CPPFLAGS="-I$PREFIX/include"
make
make check
make install
unset ACLOCAL_FLAGS
