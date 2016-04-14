#!/bin/sh

# https://mariadb.com/kb/en/mariadb/generic-build-instructions/
# https://dev.mysql.com/doc/refman/5.6/en/source-configuration-options.html

CFLAGS="-I$PREFIX/include -I$PREFIX/include/ncurses" \
CPPFLAGS="-I$PREFIX/include -I$PREFIX/include/ncurses" \
CXXFLAGS="-I$PREFIX/include -I$PREFIX/include/ncurses" \
LDFLAGS="-L$PREFIX/lib" \
cmake . \
    -DBUILD_CONFIG=mysql_release \
    -DCMAKE_PREFIX_PATH:PATH="$PREFIX" \
    -DCMAKE_INSTALL_PREFIX:PATH="$PREFIX" \
    -DMYSQL_DATADIR:PATH="$PREFIX/data"
make
make install

