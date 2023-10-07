# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=500000
SAVEHIST=500000

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7A7A7A"
export COLORTERM="truecolor"
export EDITOR="nvim"
# export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
export CHATBLADE_THEME="autumn"

# disable cursor blinking
# echo "\e[2 q"

source /opt/asdf-vm/asdf.sh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

for s in ~/.my/shell-plugins/*.sh; do source "$s"; done && unset s
for s in ~/.my/zsh-plugins/*.zsh;  do source "$s"; done && unset s
source ~/.my/aliases.sh
source ~/.my/bindkeys.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
