#!/bin/bash

if ! isInstalled build-essential; then
	nala install build-essential -y --simple
else
	echo "build-essential already installed"
fi
