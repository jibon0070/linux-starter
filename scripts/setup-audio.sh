#!/bin/bash

if ! isInstalled wireplumber; then
	nala install wireplumber
fi

sudo -u $username systemctl --user enable wireplumber.service

exit 0
