#!/bin/bash

# Credit goes here: https://github.com/menpo/conda-boost

# Because using custom GCC
export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"

# I want to set the Python options myself in the user-config.jam
# If I don't do this then this clashes with my custom
# user-config.jam and boost prefers this over the custom settings.
sed -i.bak 's/using python/#using python/g' bootstrap.sh

# Grab the include dir (borrowed from homebrew boost-python)
export PYTHON_INCLUDE_DIR=`python -c "from __future__ import print_function; import distutils.sysconfig; print(distutils.sysconfig.get_python_inc(True))"`

# Seems that sometimes this is required
chmod -R 777 .*

# Setup the boost building, this is fairly simple.
python_root=`python -c "import sys; print(sys.prefix)"`
# --with-python-root=$python_root
./bootstrap.sh --prefix="${PREFIX}" --libdir="${LIBRARY_PATH}" --without-libraries=python

# We need a host of options to get things to work on OSX
if [ `uname` == Darwin ]; then
  CXXFLAGS="-mmacosx-version-min=${MACOSX_DEPLOYMENT_TARGET}"
  LINKFLAGS="-mmacosx-version-min=${MACOSX_DEPLOYMENT_TARGET}"

  # Need to default to clang over g++ (though in later version g++ is clang)
  B2ARGS="toolset=clang"
  
  # If we want C++11 support, we need to enable these flags
  # AND change the version min >= 10.7
  #CXXFLAGS="${CXXFLAGS} -std=c++11 -stdlib=libc++"
  #LINKFLAGS="${LINKFLAGS} -stdlib=libc++"
  
  CXXFLAGS="cxxflags=${CXXFLAGS}"
  LINKFLAGS="linkflags=${LINKFLAGS}"
else
  CXXFLAGS=""
  LINKFLAGS=""
  B2ARGS="toolset=gcc"
fi

# So, we use a custom user-config.jam which is for setting the conda python options
# We explicitly set to use conda's BZIP2, ZLIB, and ICU
# We make sure that we build the appropriate ARCH and set the CXX flags appropriately
# Use "--layout=versioned --build-type=complete " to build both static and shared libraries

./bjam \
    --debug-configuration --user-config="${RECIPE_DIR}/user-config.jam" \
    -sBZIP2_LIBPATH="${LIBRARY_PATH}" -sBZIP2_INCLUDE="${INCLUDE_PATH}" \
    -sZLIB_LIBPATH="${LIBRARY_PATH}" -sZLIB_INCLUDE="${INCLUDE_PATH}" \
    -sICU_PATH="${LIBRARY_PATH}" -sICU_LINK="${INCLUDE_PATH}" \
    address-model=${ARCH} architecture=x86 ${CXXFLAGS} \
    link=shared ${LINKFLAGS} ${B2ARGS} stage

# Copy the files across
cp -a stage/lib "$PREFIX"
cp -R boost "${INCLUDE_PATH}"
