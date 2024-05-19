#!/bin/bash

if ! isInstalled nodejs; then
	nala install nodejs
else
	echo "nodejs is already installed! skipping install."
fi
if ! isInstalled npm; then
	nala install npm
else
	echo "npm is already installed! skipping install."
fi

if ! isInstalled n "\sn@" 1 "npm list -g --depth=0"; then
	npm i -g n
else
	echo "n is already installed! skipping install."
fi

n lts

exit 0
