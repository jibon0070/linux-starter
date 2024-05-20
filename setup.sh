#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
	echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
	exit 1
fi

source scripts/variables.sh
source scripts/isInstalled.sh

# update
$builddir/scripts/update.sh

# install nala
$builddir/scripts/install/nala.sh

# set fonts
$builddir/scripts/set-fonts.sh

# handle .config files
$builddir/scripts/handle-config.sh

# Install build-essential
$builddir/scripts/install/build-essential.sh

#install nodejs
$builddir/scripts/install/nodejs.sh

#install neovim
$builddir/scripts/install/nvim/nvim.sh

# install chrome
$builddir/scripts/install/chrome/chrome.sh

# install docker

# install gitbutler

# setup gui
$builddir/scripts/setup-gui.sh

# setup autio
$builddir/scripts/setup-audio.sh

#set up i3wm
$builddir/scripts/setup-i3wm.sh

reboot

exit 0
