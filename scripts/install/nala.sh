#!/bin/bash

source ../isInstalled.sh

if ! isInstalled nala; then
	apt install nala -y
else
	echo "nala already installed! skipping..."
fi
