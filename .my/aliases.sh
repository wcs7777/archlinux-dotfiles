# alias lazyvim="NVIM_APPNAME=snvim/lazyvim nvim"
alias cpwd="pwd | clipcopy"
alias del="trash-put"
alias docker-rmi-dangling="docker image rm \`docker images -qa -f 'dangling=true'\`"
alias grep='grep --color=auto'
alias h1='history 1'
alias hs='history 1 | rg'
alias hsi='history 1 | rg -i'
alias list-git-ignores-files="git check-ignore -v -- *"
alias lsall='ls -la --color=auto'
alias permissions="stat -c '%a %U:%G %n'"
alias xopen="xdg-open"

clipcopy () {
	cat "${1:-/dev/stdin}" | clip.exe
}

countdown() {
    start="$(( $(date '+%s') + $1))"
    while [ $start -ge $(date +%s) ]; do
        time="$(( $start - $(date +%s) ))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
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

stopwatch() {
    start=$(date +%s)
    while true; do
        time="$(( $(date +%s) - $start))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}

swapfiles() {
	local tmp="$(mktemp)"
	mv "$1" "$tmp"
	mv "$2" "$1"
	mv "$tmp" "$2"
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
