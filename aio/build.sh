#!/bin/bash

mkdir -p $PREFIX/bin $PREFIX/lib $PREFIX/include

rpm2cpio libaio-0.3.106-5.src.rpm | cpio -idmv
tar xf libaio-0.3.106.tar.gz
cd libaio-0.3.106
make
make prefix=$PREFIX install

ln -sf $PREFIX/lib/libaio.so.1.0.1 $PREFIX/lib/libaio.so.1

