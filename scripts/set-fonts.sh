#!/bin/bash

if ! isInstalled fonts-terminus; then
	nala install fonts-terminus -y --simple
else
	echo "Terminus fonts already installed! skipping..."
fi

nala install unzip -y --simple

# Set the font to Terminus Fonts
setfont /usr/share/consolefonts/Uni3-TerminusBold28x14.psf.gz

if [ ! -d /home/$username/.fonts ]; then
	mkdir /home/$username/.fonts
fi

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip -O $builddir/font.zip
unzip $builddir/font.zip -d /home/$username/.fonts
chown $username:$username /home/$username/.fonts -R
rm $builddir/font.zip

# Reloading Font
fc-cache -vf

exit 0
