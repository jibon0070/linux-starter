#!/bin/bash

if [[ ! -d /home/$username/.config ]]; then
	mkdir -p /home/$username/.config
	chown $username:$username /home/$username/.config
fi
if [[ -d $builddir/dotconfig ]]; then
	cp $builddir/dotconfig/* /home/$username/.config/ -R
	chown $username:$username /home/$username/.config -R
fi

exit 0
