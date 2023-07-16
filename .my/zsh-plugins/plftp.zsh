#!/bin/zsh

plftp() {
	local password
	if [ $# -ge 2 ]; then
		read -s "password?Password: "
		lftp --user "$2" --password "$password" -p 22 "$1"
	fi
}
