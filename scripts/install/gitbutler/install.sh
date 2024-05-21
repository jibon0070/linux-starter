#!/bin/bash

nala install libwebkit2gtk-4.0-37

cd $builddir/scripts/install/gitbutler

wget -O gitbutler.deb https://app.gitbutler.com/downloads/release/linux/x86_64/deb
dpkg -i gitbutler.deb
rm gitbutler.deb

cd $builddir
