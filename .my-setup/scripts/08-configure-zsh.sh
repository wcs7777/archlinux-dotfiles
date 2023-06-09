#!/bin/bash

chsh -s /usr/bin/zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git             ~/.zsh/powerlevel10k
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions         ~/.zsh/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone --depth=1 https://github.com/jeffreytse/zsh-vi-mode.git            ~/.zsh/zsh-vi-mode
git clone --depth=1 https://github.com/tmux-plugins/tpm                      ~/.tmux/plugins/tpm
