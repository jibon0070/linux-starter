#!/bin/bash

if ! isInstalled lightdm; then
	nala install lightdm
fi

systemctl enable lightdm
systemctl set-default graphical.target

exit 0
