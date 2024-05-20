#!/bin/bash

cd $builddir/scripts/install/chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome.deb
dpkg -i chrome.deb
rm chrome.deb
cd $builddir

exit 0
