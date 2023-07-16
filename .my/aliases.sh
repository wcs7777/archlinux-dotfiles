alias cdmfe="cd /mnt/wsl/shared/my-firefox-extensions"
alias cdproj="cd /mnt/wsl/shared/projects"
alias cppwd="pwd | clipcopy"
alias del="trash-put"
alias grep='grep --color=auto'
alias h1='history 1'
alias hs='history 1 | rg'
alias hsi='history 1 | rg -i'
alias jsplayground="touch /tmp/tmp-playground.js && code /tmp/tmp-playground.js && node --watch /tmp/tmp-playground.js"
alias list-pipenv='for venv in ~/.local/share/virtualenvs/* ; do basename $venv; cat $venv/.project | sed "s/\(.*\)/\t\1\n/" ; done'
alias lsall='ls -la --color=auto'
alias mssql="sudo systemctl reset-failed && sudo systemctl start docker && docker container start mssql"
alias mssqlstop="docker container stop mssql"
alias myconf="/usr/bin/git --git-dir=$HOME/.dotfilesgit --work-tree=$HOME"
alias nvchad="NVIM_APPNAME=snvim/nvchad nvim"
alias nvim-lspless="NVIM_APPNAME=snvim/lspless nvim"
alias permissions="stat -c '%a %U:%G %n'"
alias py="pipenv run python"
alias xopen="xdg-open"

clipcopy () {
	cat "${1:-/dev/stdin}" | clip.exe
}

curldelete() {
	curljson DELETE "$1" "$2"
}

curljson() {
	curl -d "$3" -H 'Content-Type: application/json' -X "$1" "$2"
}

curlpost() {
	curljson POST "$1" "$2"
}

curlput() {
	curljson PUT "$1" "$2"
}

exala() {
	(LS_COLORS='' exa -la --icons "${1:-.}")
}

mkcd() {
	mkdir -p -- "$1" && cd -P -- "$1"
}

mkfile() {
	mkdir -p -- $(dirname "$1") && touch -- "$1"
}

ohmydown() {
	wget "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/$1/$1.plugin.zsh" -O ~/.my-zsh-plugins/$1.zsh
}

pathfolders() {
	echo "${PATH//:/$'\n'}"
}

swapfiles() {
	local tmp="$(mktemp)"
	mv "$1" "$tmp"
	mv "$2" "$1"
	mv "$tmp" "$2"
}

tcode() {
	mkfile "$1" && code -- "$1"
}

vimless() {
	local vimrc="~/.vimrc.less"
	if [ -z "$1" ]; then
		vim -u "$vimrc" -
	else
		vim -u "$vimrc" "$1"
	fi
}

wincd() {
	(cd "$(readlink -f ${1:-.})" && explorer.exe .)
}
