#!/bin/bash

echo `pwd`
wget http://sourceforge.net/projects/fastsemsim/files/latest/download?source=files -O fastSemSim.tar.bz2
tar xjvf fastSemSim.tar.bz2
cd fastSemSim*
$PYTHON setup.py install
