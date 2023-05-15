#!/bin/bash

packages=(
	"archey3"
	"asdf-vm"
	"base-devel"
	"bat"
	"chatblade"
	"curl"
	"docker"
	"docker-compose"
	"exa"
	"fd"
	"fzf"
	"git"
	"git-lfs"
	"jdk-openjdk"
	"lftp"
	"libxslt"
	"libyaml"
	"man-db"
	"mssql-tools"
	"neovim"
	"openssh"
	"pacman-contrib"
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
	"zip"
	"zsh"
)
yay -S --needed --noconfirm "${packages[@]}"
