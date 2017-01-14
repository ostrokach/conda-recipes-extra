#!/bin/bash

set -e

mkdir -p $PREFIX/bin $PREFIX/include $PREFIX/lib $PREFIX/share

mv ./bin/* $PREFIX/bin/
mv ./include/* $PREFIX/include/
mv ./lib/* $PREFIX/lib/
mv ./share/* $PREFIX/share/

# Don't think this is needed, and it takes up lots of space
rm $PREFIX/bin/mysqld-debug
rm $PREFIX/bin/*_embedded
rm $PREFIX/lib/libmysqld*

# Need 'libodbc.so.1' for the CONNECT engine to work...
(cd $PREFIX/lib && ln -s libodbc.so libodbc.so.1)

