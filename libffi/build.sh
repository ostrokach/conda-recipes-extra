#!/bin/bash

ln -s $PREFIX/lib $PREFIX/lib64

export XORG_PREFIX='/usr'
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"

export CFLAGS="-I$PREFIX/include -L$PREFIX/lib" 
export CPPFLAGS="$CFLAGS"
export LDFLAGS="-L$PREFIX/lib"

./configure  --prefix=$PREFIX 
make
make install

unlink $PREFIX/lib64

