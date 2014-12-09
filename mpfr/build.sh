#!/bin/bash

cp /home/kimlab1/strokach/programs/archives/mpfr-3.1.2.tar.bz2 .
tar xjvf mpfr*
cd mpfr*
./configure --prefix=$PREFIX LDFLAGS="-L$PREFIX/lib" CPPFLAGS="-I$PREFIX/include"
make
make install
