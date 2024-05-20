#!/bin/bash

if [ -d $builddir/i3wm ]; then
	rm i3wm -rf
fi

git clone https://github.com/jibon0070/i3wm-starter $builddir/i3wm

cd $builddir/i3wm
./setup.sh
cd $builddir

rm $builddir/i3wm -rf

exit 0
