#!/bin/bash

./autogen.sh LDFLAGS="-L$PREFIX/lib" CPPFLAGS="-I$PREFIX/include"
./configure --prefix=$PREFIX --enable-network
make
make install
