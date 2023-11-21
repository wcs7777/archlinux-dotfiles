#!/bin/bash

cp /etc/pacman.conf /etc/pacman.conf.old
cp "$files_setup/pacman.conf" /etc/pacman.conf
#killall gpg-agent
#rm -rf /etc/pacman.d/gnupg/
pacman-key --init
pacman-key --populate
pacman -Sy --noconfirm archlinux-keyring
pacman -Su --noconfirm
pacman -Syyuu --noconfirm
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.old
cp "$files_setup/mirrorlist" /etc/pacman.d/mirrorlist
pacman -Syyuu --noconfirm
