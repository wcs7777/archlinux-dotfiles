#!/bin/bash


__wcs_backup_home() {
	local folder
	local base_folder
	local arch_home
	local config
	local external
	local temp_home

	local function cleanup() {
		rm -rf "$temp_home"
	}

	trap cleanup EXIT

	arch_home="/mnt/wsl/shared/arch/home"
	external="/mnt/d/wsl/setup/arch/home"
	temp_home=$(mktemp -d)
	config="$temp_home/.config"

	cp -v ~/.bashrc         "$temp_home"
	cp -v ~/.gitconfig      "$temp_home"
	cp -v ~/.my-aliases.sh  "$temp_home"
	cp -v ~/.my-bindkeys.sh "$temp_home"
	cp -v ~/.myclirc        "$temp_home"
	cp -v ~/.p10k.zsh       "$temp_home"
	cp -v ~/.vimrc          "$temp_home"
	cp -v ~/.vimrc.less     "$temp_home"
	cp -v ~/.zprofile       "$temp_home"
	cp -v ~/.zshrc          "$temp_home"

	for folder in ~/.my-*/; do
		base_folder="$(basename $folder)"
		cp -rv "$folder" "$temp_home/$base_folder"
	done

	mkdir -pv "$config"
	cp -rv ~/.config/bat "$config/bat"
	cp -rv ~/.config/nvim "$config/nvim"

	rm -rfv "$arch_home"
	rm -rfv "$external"
	cp -rv "$temp_home" "$arch_home"
	cp -rv "$temp_home" "$external"
}

__wcs_backup_home
unset -f __wcs_backup_home

