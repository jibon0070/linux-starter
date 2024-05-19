#!/bin/bash

if [ -d $builddir/nvim ]; then
	rm $builddir/nvim -rf
fi
git clone https://github.com/jibon0070/nvim-kick-starter.git $builddir/nvim
cd $builddir/nvim
./setup.sh
cd $builddir
rm $builddir/nvim/ -rf

exit 0
