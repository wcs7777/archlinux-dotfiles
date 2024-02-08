#!/bin/bash

packages=(
	"archey3"
	"asdf-vm"
	"base-devel"
	"bat"
	"chatblade"
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
	"pyright",
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
	"zip"
	"zsh"
)
yay -S --needed --noconfirm "${packages[@]}"
