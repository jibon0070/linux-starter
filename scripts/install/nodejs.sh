#!/bin/bash

if ! isInstalled npm; then
	nala install npm
else
	if [ $(npm -v | grep -E "^[0-9]+\.[0-9]+\.[0-9]+$" | wc -l) -eq 0 ]; then
		nala install npm -y --simple
	else
		echo "npm is already installed! skipping install."
	fi
fi

if ! isInstalled n "\sn@" 1 "npm list -g --depth=0"; then
	npm i -g n
else
	echo "n is already installed! skipping install."
fi

n lts

exit 0
