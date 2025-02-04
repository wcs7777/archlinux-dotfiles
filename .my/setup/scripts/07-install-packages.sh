#!/bin/bash

packages=(
	"archey3"
	"asdf-vm"
	"base-devel"
	"bat"
	"curl"
	"docker"
	"docker-buildx"
	"docker-compose"
	"exa"
	"fd"
	"fzf"
	"git"
	"git-lfs"
	"jdk17-openjdk"
	"lftp"
	"libxml2"
	"libxslt"
	"libyaml"
	"man-db"
	"neovim"
	"openssh"
	"pacman-contrib"
	"reflector"
	"ripgrep"
	"screenfetch"
	"sudo"
	"tmux"
	"trash-cli"
	"tree"
	"unixodbc"
	"unzip"
	"vi"
	"vim"
	"wget"
	"which"
	"wl-clipboard"
	"xorg-xeyes"
	"zip"
	"zsh"
)
yay -S --needed --noconfirm "${packages[@]}"
