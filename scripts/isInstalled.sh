#!/bin/bash

isInstalled() {
	if ! [ -v 1 ]; then
		echo "No package name given."
		exit 1
	fi
	if [ -v 2 ]; then
		pattern=$2
	else
		pattern="^$1\s"
	fi
	if [ -v 3 ]; then
		count=$3
	else
		count=1
	fi
	if ! [ $(apt-cache search $1 | grep $pattern | wc -l) -ge $count ]; then
		return 1
	fi
	return 0
}
