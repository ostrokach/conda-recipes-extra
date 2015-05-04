#!/bin/bash

PWD=`pwd`
MODELLER_FOLDER_NAME="${PKG_NAME}-${PKG_VERSION}"
MODELLER_INSTALL_PATH="$PREFIX/lib/$MODELLER_FOLDER_NAME"

mkdir -p "$MODELLER_INSTALL_PATH"
cp -rf "$PWD"/* "$MODELLER_INSTALL_PATH"


# Copy the "_modeller.so" library
if [[ "$PY_VER" == '2.6' || "$PY_VER" == '2.7' ]] ; then
    echo "Using Python 2x..."
    ln -s "$MODELLER_INSTALL_PATH/modlib/modeller" "$SP_DIR/modeller"
    ln -s "$MODELLER_INSTALL_PATH/lib/x86_64-intel8/python2.5/_modeller.so" "$SP_DIR/_modeller.so"
elif [[ "$PY_VER" == '3.3' || "$PY_VER" == '3.4' ]] ; then
    echo "Using Python 3x..."
    ln -s "$MODELLER_INSTALL_PATH/modlib/modeller" "$SP_DIR/modeller"
    ln -s "$MODELLER_INSTALL_PATH/lib/x86_64-intel8/python3.3/_modeller.so" "$SP_DIR/_modeller.so"
else
    echo "Could not detect python version!"
    exit 1
fi


# Simlink modeller libraries so that don't have to alter $LD_LIBRARY_PATH 
# (there might be a better way to this that I don't know... 
for i in "$MODELLER_INSTALL_PATH/lib/x86_64-intel8"/*so* ; do 
    ln -s "$i" "$LIBRARY_PATH"
done


# Set up modeller license
config_file="$MODELLER_INSTALL_PATH/modlib/modeller/config.py"
cat <<EOF >> $config_file
import os
import os.path as op

install_dir = op.normpath(op.join(op.dirname(op.abspath(__file__)), '../../../$MODELLER_FOLDER_NAME'))
license = ''
if not license:
    license = os.environ.get('MODELLER_LICENSE', '')

EOF
