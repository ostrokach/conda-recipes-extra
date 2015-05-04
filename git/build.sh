#!/bin/bash

export NO_GETTEXT="TRUE"
export NO_R_TO_GCC_LINKER="TRUE"
export CURLDIR="$PREFIX"
export PERL_PATH="$PREFIX/bin/perl"
export PYTHON_PATH="$PREFIX/bin/python"
export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"

sed -i 's/CC = cc/CC = gcc/g' Makefile
chmod +x generate-cmdlist.sh
chmod +x check_bindir
make prefix=$PREFIX all
make prefix=$PREFIX install
