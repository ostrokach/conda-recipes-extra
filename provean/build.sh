#!/bin/bash

./configure
make
cp -f ./src/provean $PREFIX/bin
