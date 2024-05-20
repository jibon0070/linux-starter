#!/bin/bash

function isInstalled {
	if [ $(command -v $1 | wc -l) -eq 1 ]; then
		return 1
	fi
	return 0
}
export -f isInstalled
