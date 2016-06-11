#!/bin/bash

mkdir -p $PREFIX/bin

cargo build --release
cp target/release/xsv $PREFIX/bin

