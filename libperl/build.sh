#!/bin/bash

export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"

perl Build.PL
./Build --include_dir $PREFIX/include
./Build test
./Build install --install_base $PREFIX
