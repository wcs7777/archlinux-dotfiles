#!/bin/bash

__wcs_unmount_archfiles() {
	local distro_name
	local mount_path
	distro_name="Shared"
	mount_path="/mnt/wsl/shared/"
	if mountpoint -q -- "$mount_path"; then
		echo "unmouting $mount_path"
		wsl.exe -d "$distro_name" -u root umount -v "$mount_path"
	fi
	if ! mountpoint -q -- "$mount_path" && [[ -d "$mount_path" ]]; then
		rm -rfv "$mount_path"
	fi
}

__wcs_unmount_archfiles
unset -f __wcs_unmount_archfiles
