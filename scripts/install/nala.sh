#!/bin/bash

if ! isInstalled nala; then
	apt install nala -y --simple
else
	echo "nala already installed! skipping..."
fi
