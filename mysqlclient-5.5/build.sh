#!/bin/bash

export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export CC=gcc

cat <<EOF > site.cfg
[options]
embedded = False
threadsafe = True
static = False
EOF

# Changing `site.cfg` to enable static libraries
# produces a mysql client that does not detect correct socket locations, etc.
$PYTHON setup.py install
