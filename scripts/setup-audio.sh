#!/bin/bash

if ! isInstalled wireplumber; then
	nala install wireplumber -y --simple
fi

sudo -u $username systemctl --user enable wireplumber.service

echo "audio has been enabled"

exit 0
