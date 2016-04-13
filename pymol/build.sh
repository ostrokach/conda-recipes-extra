#!/bin/bash

export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PREFIX/share/pkgconfig"

export PREFIX_PATH=$PREFIX
$PYTHON setup.py build 
$PYTHON setup.py install
