#!/bin/bash

export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"

cd source
chmod +x runConfigureICU configure install-sh
./runConfigureICU Linux --prefix="$PREFIX"
make
make install