#!/bin/bash

# Download 32- and 64-bit versions of MySQL ODBC connector
wget http://mirror.csclub.uwaterloo.ca/mysql/Downloads/Connector-ODBC/5.3/mysql-connector-odbc-5.3.4-linux-glibc2.5-x86-32bit.tar.gz
wget http://mirror.csclub.uwaterloo.ca/mysql/Downloads/Connector-ODBC/5.3/mysql-connector-odbc-5.3.4-linux-glibc2.5-x86-64bit.tar.gz


# Untar files and copy dynamic libraries to their appropriate locations
tar xzvf mysql-connector-odbc-5.3.4-linux-glibc2.5-x86-32bit.tar.gz
tar xzvf mysql-connector-odbc-5.3.4-linux-glibc2.5-x86-64bit.tar.gz

cp -f  ./mysql-connector-odbc-5.3.4-linux-glibc2.5-x86-32bit/lib/*  $REMOTE_HOME/anaconda/lib/
cp -f  ./mysql-connector-odbc-5.3.4-linux-glibc2.5-x86-64bit/lib/*  $REMOTE_HOME/anaconda/lib64/


### !!! IMPORTANT !!!
# Add the following line to your ~/.bashrc (or ~/.bashrc_remote) file
export ODBCSYSINI=$REMOTE_HOME/anaconda/etc


# Save file with installation instructions
echo '# Driver from the mysql-connector-odbc package
# Setup from the unixODBC package
[MySQL]
Description     = ODBC for MySQL
Driver          = /home/kimlab1/strokach/anaconda/lib/libmyodbc5a.so
Setup           = /home/kimlab1/strokach/anaconda/lib/libmyodbc5w.so
Driver64        = /home/kimlab1/strokach/anaconda/lib64/libmyodbc5a.so
Setup64         = /home/kimlab1/strokach/anaconda/lib64/libmyodbc5w.so
' > template_file


# Install the driver
odbcinst -i -d -f template_file

