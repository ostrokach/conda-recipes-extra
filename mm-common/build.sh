#!/bin/bash

export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"
./autogen.sh LDFLAGS="-L$PREFIX/lib" CPPFLAGS="-I$PREFIX/include"
./configure --prefix=$PREFIX --enable-network
make
make install
unset ACLOCAL_FLAGS
