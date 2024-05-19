#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
	echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
	exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

isInstalled() {
	local output=$(apt-cache search $1 | grep "^$1" | wc -l)
	if [[ $output -gt 0 ]]; then
		return 0
	fi
	return 1
}

# Update packages list and update system
apt update
apt upgrade -y

# Install nala
if ! isInstalled nala; then
	apt install nala -y
fi

# Install Terminus Fonts
if ! isInstalled fonts-terminus; then
	sudo nala install fonts-terminus
fi

# Set the font to Terminus Fonts
setfont /usr/share/consolefonts/Uni3-TerminusBold28x14.psf.gz

# Making .config and Moving config files
cd $builddir

if [[ ! -d /home/$username/.config ]]; then
	mkdir -p /home/$username/.config
	chown $username:$username /home/$username/.config
fi
if [[ -d /home/$username/dotconfig ]]; then
	cp -R dotconfig/* /home/$username/.config/
	chown $username:$username /home/$username/.config -R
fi

# Install build-essential
if !isInstalled build-essential; then
	nala install build-essential -y
fi

#install neovim
if ! isInstalled nvim; then
	if [[ ! -d $builddir/nvim ]]; then
		if [[ $(git clone https://github.com/jibon0070/nvim-kick-starter.git nvim) ]]; then
			echo "Failed to clone nvim"
			exit 1
		fi
	fi
	cd $builddir/nvim
	./setup.sh
	if [[ $? -ne 0 ]]; then
		echo "Failed to install nvim"
		exit 1
	fi
	cd $builddir
	rm -rf nvim
fi

#install nodejs
nala install nodejs npm -y

#update node version
npm i -g n
n lts

# install docker
if ! isInstalled docker; then
	git clone https://github.com/docker/docker-install.git docker
	cd $builddir/docker
	./install.sh
	cd $builddir
	rm docker -rf
else
	echo "Docker is already installed"
fi
