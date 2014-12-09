#!/bin/bash

cp /home/kimlab1/strokach/programs/archives/sparsehash-2.0.2.tar.gz .
tar xzvf sparsehash*
cd sparsehash*
./configure --prefix=$PREFIX
make
make install
