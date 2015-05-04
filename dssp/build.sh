#!/bin/bash

export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"

export BOOST_LIB_SUFFIX="-gcc48-mt-1_58"
export BOOST_INC_DIR="$PREFIX/include"
export BOOST_LIB_DIR="$PREFIX/lib"

# Add the realtime library to the list of required libraries
sed -i \
's/'\
'= $(BOOST_LIBS:%=boost_%$(BOOST_LIB_SUFFIX)) z bz2/'\
'= $(BOOST_LIBS:%=boost_%$(BOOST_LIB_SUFFIX)) z bz2 rt/'\
'g' makefile

make 
cp ./mkdssp $PREFIX/bin/dssp
