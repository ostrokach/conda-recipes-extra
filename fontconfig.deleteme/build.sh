#!/bin/bash

./autogen.sh LDFLAGS="-L$PREFIX/lib" CPPFLAGS="-I$PREFIX/include"
./configure --prefix=$PREFIX LDFLAGS="-L$PREFIX/lib" CPPFLAGS="-I$PREFIX/include"
make
make install
