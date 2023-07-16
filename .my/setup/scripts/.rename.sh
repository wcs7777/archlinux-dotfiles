#!/bin/bash

mv "$scripts_setup/02-configure-pacman.sh"   "$scripts_setup/01-configure-pacman.sh"
mv "$scripts_setup/03-configure-locales.sh"  "$scripts_setup/02-configure-locales.sh"
mv "$scripts_setup/04-reinstall-packages.sh" "$scripts_setup/03-reinstall-packages.sh"
mv "$scripts_setup/05-root-passwd.sh"        "$scripts_setup/04-root-passwd.sh"
mv "$scripts_setup/06-create-user.sh"        "$scripts_setup/05-create-user.sh"
mv "$scripts_setup/07-install-yay.sh"        "$scripts_setup/06-install-yay.sh"
mv "$scripts_setup/08-install-packages.sh"   "$scripts_setup/07-install-packages.sh"
mv "$scripts_setup/09-configure-zsh.sh"      "$scripts_setup/08-configure-zsh.sh"
mv "$scripts_setup/10-win32yankinstall.sh"   "$scripts_setup/09-win32yankinstall.sh"
mv "$scripts_setup/11-config-docker.sh"      "$scripts_setup/10-config-docker.sh"
mv "$scripts_setup/12-install-node.sh"       "$scripts_setup/11-install-node.sh"
mv "$scripts_setup/13-vscode-extensions.sh"  "$scripts_setup/12-vscode-extensions.sh"
