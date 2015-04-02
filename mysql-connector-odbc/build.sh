#!/bin/bash

# Download 32- and 64-bit versions of MySQL ODBC connector
wget http://mirror.csclub.uwaterloo.ca/mysql/Downloads/Connector-ODBC/5.3/mysql-connector-odbc-${PKG_VERSION}-linux-glibc2.5-x86-32bit.tar.gz
wget http://mirror.csclub.uwaterloo.ca/mysql/Downloads/Connector-ODBC/5.3/mysql-connector-odbc-${PKG_VERSION}-linux-glibc2.5-x86-64bit.tar.gz


# Untar files and copy dynamic libraries to their appropriate locations
tar xzvf mysql-connector-odbc-${PKG_VERSION}-linux-glibc2.5-x86-32bit.tar.gz
tar xzvf mysql-connector-odbc-${PKG_VERSION}-linux-glibc2.5-x86-64bit.tar.gz

if [ $PY3K == 1 ]; then 
    export ANACONDA_HOME='/home/kimlab1/strokach/anaconda3'
else
    export ANACONDA_HOME='/home/kimlab1/strokach/anaconda'
fi

rsync -av  ./mysql-connector-odbc-5.3.4-linux-glibc2.5-x86-32bit/lib/  $ANACONDA_HOME/lib
rsync -av  ./mysql-connector-odbc-5.3.4-linux-glibc2.5-x86-64bit/lib/  $ANACONDA_HOME/lib64

### !!! IMPORTANT !!!
# Add the following line to your ~/.bashrc (or ~/.bashrc_remote) file
export ODBCSYSINI=/home/kimlab1/strokach/anaconda3/etc

# Save file with installation instructions
echo '# Driver from the mysql-connector-odbc package
# Setup from the unixODBC package
[MySQL]
Description     = ODBC for MySQL
Driver          = $ANACONDA_HOME/lib/libmyodbc5a.so
Setup           = $ANACONDA_HOME/lib/libmyodbc5w.so
Driver64        = $ANACONDA_HOME/lib64/libmyodbc5a.so
Setup64         = $ANACONDA_HOME/lib64/libmyodbc5w.so
' > template_file

# Install the driver
odbcinst -i -d -f template_file

