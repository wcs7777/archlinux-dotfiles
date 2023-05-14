#!/bin/bash

__wcs_mount_archfiles() {
	local distro_name
	local mount_path
	distro_name="Shared"
	mount_path="/mnt/wsl/shared/"
	if [[ ! -d "$mount_path" ]]; then
		mkdir -v "$mount_path"
	fi
	if ! mountpoint -q -- "$mount_path"; then
		wsl.exe -d "$distro_name" -u root mount -v --bind ~/shared "$mount_path"
	fi
}

__wcs_mount_archfiles
unset -f __wcs_mount_archfiles
