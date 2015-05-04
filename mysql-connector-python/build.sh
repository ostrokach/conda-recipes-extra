#!/bin/bash

# Download MySQL python connector
echo http://dev.mysql.com/get/Downloads/Connector-Python/mysql-connector-python-${PKG_VERSION}.tar.gz
wget http://dev.mysql.com/get/Downloads/Connector-Python/mysql-connector-python-${PKG_VERSION}.tar.gz

# Untar files and copy dynamic libraries to their appropriate locations
tar xzvf mysql-connector-python-${PKG_VERSION}.tar.gz
cd mysql-connector-python-${PKG_VERSION}

$PYTHON setup.py build install
