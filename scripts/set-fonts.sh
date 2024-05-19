#!/bin/bash

source isInstalled.sh

if ! isInstalled fonts-terminus; then
	nala install fonts-terminus -y --simple
else
	echo "Terminus fonts already installed! skipping..."
fi

# Set the font to Terminus Fonts
setfont /usr/share/consolefonts/Uni3-TerminusBold28x14.psf.gz

exit 0
