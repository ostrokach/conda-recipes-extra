#!/bin/bash

cp /home/kimlab1/strokach/programs/archives/gmp-6.0.0a.tar.bz2 .
tar xjvf gmp*
cd gmp*
./configure --prefix=$PREFIX
make
make install
