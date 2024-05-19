#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
	echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
	exit 1
fi

source scripts/variables.sh
source scripts/isInstalled.sh

# install nala
$builddir/scripts/install/nala.sh

# update
$builddir/scripts/update.sh

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

# install docker
# install chrome
# install gitbutler
