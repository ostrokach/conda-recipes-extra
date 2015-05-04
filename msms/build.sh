#!/bin/bash

# Change `nawk` to `gawk`, since `nawk` is not installed on some platforms
sed -i 's|nawk|gawk|g' pdb_to_xyzrn

# Patch pdb_to_xyzrn so that includes the chain
sed -i 's|resnum=substr($0,23,4);|resnum=substr($0,23,4);\n\tchain=substr($0,21,2);|' pdb_to_xyzrn
sed -i 's|gsub(" ", "", aname);|gsub(" ", "", aname);\n\tgsub(" ", "", resnum);\n\tgsub(" ", "", chain);|' pdb_to_xyzrn
sed -i 's|"%f %f %f %f %d %s_%s_%d\\n", x, y, z, |"%f %f %f %f %d %s_%s_%d_%s\\n", x, y, z, |g' pdb_to_xyzrn
sed -i 's|1, aname, resname, resnum);|1, aname, resname, resnum, chain);|g' pdb_to_xyzrn

# Export files to ``elaspic/bin``
cp ./pdb_to_xyzr $PREFIX/bin
cp ./pdb_to_xyzrn $PREFIX/bin
cp ./atmtypenumbers $PREFIX/bin
cp ./msms.x86_64Linux2.2.6.1 $PREFIX/bin/msms

chmod +x $PREFIX/bin/pdb_to_xyzr
chmod +x $PREFIX/bin/pdb_to_xyzrn
