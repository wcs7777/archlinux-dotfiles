#!/bin/bash

sudo pacman -S --needed --noconfirm git base-devel && \
git clone --depth=1 https://aur.archlinux.org/yay.git/ /tmp/yay && \
(cd /tmp/yay && makepkg -si --noconfirm)
yay -Y --gendb --noconfirm
yay -Syu --devel --noconfirm
yay -Y --devel --save --noconfirm
yay -Yc
