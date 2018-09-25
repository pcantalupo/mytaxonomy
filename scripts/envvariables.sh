#!/bin/bash

mypwd=$(pwd -P)

echo "To allow Annotater access to this taxonomy installation, add these lines to your .bash_profile"
echo "NGT="$mypwd/gi_taxid_nucl.bin
echo "PGT="$mypwd/gi_taxid_prot.bin
echo "NAMESDMP="$mypwd/names.dmp
echo "NODESDMP="$mypwd/nodes.dmp

echo


