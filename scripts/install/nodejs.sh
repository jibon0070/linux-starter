#!/bin/bash

if ! isInstalled npm; then
	nala install npm -y --simple
else
	echo "npm is already installed! skipping install."
fi

if ! isInstalled n; then
	npm i -g n
else
	echo "n is already installed! skipping install."
fi

n lts

exit 0
