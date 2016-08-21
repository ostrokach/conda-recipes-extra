#!/bin/bash

sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
make -f Makefile-libbz2_so
make clean
make
make PREFIX=$PREFIX install

cp -v bzip2-shared $PREFIX/bin/bzip2
cp -av libbz2.so* $PREFIX/lib/
ln -sv $PREFIX/lib/libbz2.so.1.0 $PREFIX/lib/libbz2.so

