#!/bin/bash

export XORG_PREFIX="$PREFIX"
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PREFIX/share/pkgconfig"
export ACLOCAL="aclocal -I $PREFIX/share/aclocal"

export CFLAGS="-I$PREFIX/include"
export X11_CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export X11_LIBS="-L$PREFIX/lib"

export C=gcc
export CC=gcc

# Instructions: https://www.x.org/wiki/Building_the_X_Window_System/
mkdir src build
cd src
git clone git://anongit.freedesktop.org/git/xorg/util/modular util/modular
./util/modular/build.sh --clone $PREFIX

# mkdir "$PREFIX/bin" "$PREFIX/include" "$PREFIX/lib" "$PREFIX/share"
# cp -r ../build/bin/* "$PREFIX/bin/"
# cp -r ../build/include/* "$PREFIX/include/"
# cp -r ../build/lib/* "$PREFIX/lib/"
# cp -r ../build/share/* "$PREFIX/share/"

