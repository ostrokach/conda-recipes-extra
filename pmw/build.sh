#!/bin/bash

VER=$PKG_VERSION

curl "http://iweb.dl.sourceforge.net/project/pmw/Pmw-${VER}.tar.gz" > Pmw-${VER}.tar.gz
tar xzf Pmw-${VER}.tar.gz
cd $SRC_DIR/Pmw-${VER}

$PYTHON setup.py build install
