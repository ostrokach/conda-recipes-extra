#!/bin/bash

export XORG_PREFIX="$PREFIX"
export PKG_CONFIG_PATH="$PREFIX/share/pkgconfig:$PREFIX/lib/pkgconfig"
export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-lxcb -L$PREFIX/lib"

$PYTHON setup.py install

cp $PREFIX/include/pycairo/py3cairo.h $PREFIX/include/pycairo/pycairo.h
