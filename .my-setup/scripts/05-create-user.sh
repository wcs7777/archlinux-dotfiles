#!/bin/bash

pacman -S --needed --noconfirm sudo
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
useradd -m -G wheel -s /bin/bash wcs
passwd wcs
cp "$files_setup/wsl.conf" /etc/
