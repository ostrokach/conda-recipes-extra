#!/bin/bash

mkdir -p "$PREFIX/bin"
cp "$RECIPE_DIR/_foldx" "$PREFIX/bin/_foldx"
cp -r "$RECIPE_DIR/foldx" "$SP_DIR"
