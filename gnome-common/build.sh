#!/bin/bash
TERM=xterm ./autogen.sh

export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"
export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"

export CFLAGS="-L$PREFIX/lib -I$PREFIX/include"
./configure --prefix=$PREFIX
make
make install

