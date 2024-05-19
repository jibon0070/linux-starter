#!/bin/bash

if ! isInstalled npm; then
	nala install npm
else
	if [ $(npm -v | grep -E "^[0-9]+\.[0-9]+\.[0-9]+$" | wc -l) -eq 0 ]; then
		nala install npm
	else
		echo "npm is already installed! skipping install."
	fi
fi

if ! isInstalled n "\sn@" 1 "npm list -g --depth=0"; then
	if npm i -g n; then
		echo "reboot"
		exit 1
	fi
else
	echo "n is already installed! skipping install."
fi

if n lts; then
	echo "reboot"
	exit 1
fi

exit 0
