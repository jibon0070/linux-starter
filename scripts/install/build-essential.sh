#!/bin/bash

if ! isInstalled build-essential; then
	nala install build-essential nautilus gnome-disk-utility -y --simple
else
	echo "build-essential already installed"
fi
