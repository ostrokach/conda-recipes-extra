#!/bin/bash

# Libfaketime requies `glibc` version 2.9 or higher 
# and the `perl-Time-HiRes` perl library.

LIBFAKETIME_INSTALL_PATH="$LIBRARY_PATH/faketime"

make
make test

mkdir -p "$PREFIX/bin"
mkdir -p "$LIBFAKETIME_INSTALL_PATH"
mkdir -p "$SP_DIR"

# cp ./src/faketime $PREFIX/bin
cp ./src/libfaketime.so.1 "$LIBFAKETIME_INSTALL_PATH"
cp ./src/libfaketimeMT.so.1 "$LIBFAKETIME_INSTALL_PATH"
cp -r "$RECIPE_DIR/faketime" "$SP_DIR"
