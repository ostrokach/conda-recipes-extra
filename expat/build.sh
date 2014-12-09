#!/bin/bash

cp /home/kimlab1/strokach/programs/archives/expat-2.1.0.tar.gz .
tar xzvf expat*
cd expat*
./configure --prefix=$PREFIX
make
make install
