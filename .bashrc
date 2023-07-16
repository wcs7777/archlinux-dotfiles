#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export COLORTERM="truecolor"
export EDITOR="nvim"

for s in ~/.my/shell-plugins/*.sh; do source "$s"; done && unset s
source ~/.my/aliases.sh
source ~/.my/bindkeys.sh

echo "$WSL_DISTRO_NAME"
