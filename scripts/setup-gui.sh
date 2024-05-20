#!/bin/bash

if ! isinstalled lightdm; then
	nala install lightdm
fi

systemctl enable lightdm
systemctl set-default graphical.target

exit 0
