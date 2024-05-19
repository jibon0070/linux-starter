#!/bin/bash

if ! isInstalled build-essential; then
	nala install build-essential -y
else
	echo "build-essential already installed"
fi
