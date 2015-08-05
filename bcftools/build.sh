#!/bin/bash

make \
    INCLUDES="-I$PREFIX/include -I. -I\$(HTSDIR)" \
    LIBCURSES='-lncurses'
make prefix="$PREFIX" install
