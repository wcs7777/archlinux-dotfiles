#!/bin/bash

packages=(
	"base-devel"
	"curl"
	"fd"
	"fzf"
	"git"
	"git-lfs"
	"man-db"
	"neovim"
	"pacman-contrib"
	"ripgrep"
	"sudo"
	"trash-cli"
	"tree"
	"unzip"
	"vi"
	"vim"
	"wget"
	"which"
	"zip"
)
sudo pacman -S --needed --noconfirm "${packages[@]}"

