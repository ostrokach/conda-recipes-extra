#!/bin/bash

echo `pwd`
cp /home/kimlab1/strokach/anaconda/conda-recipes-custom/sk1libs-0.9.1/sk1libs-0.9.1.tar.gz ./
tar xzvf sk1libs-0.9.1.tar.gz
cd sk1libs-0.9.1
python setup.py install
