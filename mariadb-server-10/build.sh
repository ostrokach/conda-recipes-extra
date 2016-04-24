#!/bin/sh

# https://mariadb.com/kb/en/mariadb/generic-build-instructions/
# https://dev.mysql.com/doc/refman/5.6/en/source-configuration-options.html

#export CFLAGS="-I$PREFIX/include -I/usr/include"
#export CPPFLAGS="-I$PREFIX/include -I/usr/include"
#export CXXFLAGS="-I$PREFIX/include -I/usr/include"
#export LDFLAGS="-L$PREFIX/lib -L/usr/lib/x86_64-linux-gnu"
#export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PREFIX/share/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig"

export CFLAGS="-I$PREFIX/include -I$PREFIX/include/ncurses"
export CPPFLAGS="-I$PREFIX/include -I$PREFIX/include/ncurses"
export CXXFLAGS="-I$PREFIX/include -I$PREFIX/include/ncurses"
export LDFLAGS="-L$PREFIX/lib"
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PREFIX/share/pkgconfig" 

cmake . \
    -DBUILD_CONFIG=mysql_release \
    -DCMAKE_PREFIX_PATH:PATH="$PREFIX" \
    -DCMAKE_INSTALL_PREFIX:PATH="$PREFIX" \
    -DMYSQL_DATADIR:PATH="$PREFIX/share/mysql_data" 
make -j4
make install

# Remove unneccessary files
rm -r "$PREFIX/support-files"
rm -r "$PREFIX/sql-bench"
rm -r "$PREFIX/mysql-test"
rm -r "$PREFIX/man"
rm -r "$PREFIX/docs"
rm "$PREFIX/README-wsrep" \
   "$PREFIX/README" \
   "$PREFIX/INSTALL-BINARY" \
   "$PREFIX/EXCEPTIONS-CLIENT" \
   "$PREFIX/CREDITS" \
   "$PREFIX/COPYING.thirdparty" \
   "$PREFIX/COPYING.LESSER" \
   "$PREFIX/COPYING"

