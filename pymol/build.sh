#!/bin/bash

svn checkout svn://svn.code.sf.net/p/pymol/code/trunk pymol-code
cd $SRC_DIR/pymol-code/pymol

export CPPFLAGS="-std=c++0x"
export PREFIX_PATH=$PREFIX
$PYTHON setup.py build install
