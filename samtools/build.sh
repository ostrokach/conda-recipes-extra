#!/bin/bash

make \
    INCLUDES="-I$PREFIX/include -I$PREFIX/include/ncurses -I. -I\$(HTSDIR)" \
    LIBCURSES='-lncurses'
make prefix="$PREFIX" install
