#!/bin/bash

mv /mnt/wsl/shared/arch/setup/02-reinstall-packages.sh /mnt/wsl/shared/arch/setup/03-reinstall-packages.sh
mv /mnt/wsl/shared/arch/setup/03-root-passwd.sh        /mnt/wsl/shared/arch/setup/04-root-passwd.sh
mv /mnt/wsl/shared/arch/setup/04-create-user.sh        /mnt/wsl/shared/arch/setup/05-create-user.sh
mv /mnt/wsl/shared/arch/setup/05-install-yay.sh        /mnt/wsl/shared/arch/setup/06-install-yay.sh
mv /mnt/wsl/shared/arch/setup/06-install-packages.sh   /mnt/wsl/shared/arch/setup/07-install-packages.sh
mv /mnt/wsl/shared/arch/setup/07-install-zsh.sh        /mnt/wsl/shared/arch/setup/08-install-zsh.sh
mv /mnt/wsl/shared/arch/setup/08-home-files.sh         /mnt/wsl/shared/arch/setup/09-home-files.sh
mv /mnt/wsl/shared/arch/setup/09-win32yankinstall.sh   /mnt/wsl/shared/arch/setup/10-win32yankinstall.sh
mv /mnt/wsl/shared/arch/setup/10-config-docker.sh      /mnt/wsl/shared/arch/setup/11-config-docker.sh
mv /mnt/wsl/shared/arch/setup/11-install-node.sh       /mnt/wsl/shared/arch/setup/12-install-node.sh
mv /mnt/wsl/shared/arch/setup/12-vscode-extensions.sh  /mnt/wsl/shared/arch/setup/13-vscode-extensions.sh

