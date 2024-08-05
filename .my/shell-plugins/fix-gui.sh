#!/bin/bash

file_guard='/tmp/gui-fixed'

if ! test -f $file_guard; then
	sudo umount --quiet /tmp/.X11-unix
	sudo rm --recursive --force /tmp/.X11-unix
	sudo ln --symbolic /mnt/wslg/.X11-unix /tmp/.X11-unix
	sudo ln --symbolic --force \
		/mnt/wslg/runtime-dir/wayland-0* \
		/run/user/1000/
	sudo touch $file_guard
fi
