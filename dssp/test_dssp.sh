#!/bin/bash

wget http://www.rcsb.org/pdb/files/4DKL.pdb
mkdssp -i 4DKL.pdb -o 4DKL.dssp
