#!/bin/bash

export ACLOCAL_FLAGS="-I$PREFIX/share/aclocal"
./configure --prefix=$PREFIX LDFLAGS="-L$PREFIX/lib" CPPFLAGS="-I$PREFIX/include"
make
make check
make install
unset ACLOCAL_FLAGS
