#!/bin/bash

mkdir -p $PREFIX/bin/
mkdir -p $PREFIX/lib/foldx

cp $RECIPE_DIR/foldx $PREFIX/bin/
cp $RECIPE_DIR/rotabase.txt $PREFIX/lib/foldx/
