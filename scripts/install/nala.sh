#!/bin/bash

if ! isInstalled nala; then
	apt install nala -y
else
	echo "nala already installed! skipping..."
fi
