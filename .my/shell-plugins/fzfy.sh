fcd()    { __wcs_fzfy_folder "$1" "$2" cd        ;}
fls()    { __wcs_fzfy_folder "$1" "$2" ls        ;}
fwincd() { __wcs_fzfy_folder "$1" "$2" wincd     ;}
fcode()  { __wcs_fzfy_all    "$1" "$2" code      ;}
fdcode() { __wcs_fzfy_folder "$1" "$2" code      ;}
ffcode() { __wcs_fzfy_file   "$1" "$2" code      ;}
fcat()   { __wcs_fzfy_file   "$1" "$2" cat       ;}
fbat()   { __wcs_fzfy_file   "$1" "$2" bat       ;}
fexec()  { __wcs_fzfy_file   "$1" "$2" .         ;}
fdel()   { __wcs_fzfy_all    "$1" "$2" trash-put ;}
fecho()  { __wcs_fzfy_all    "$1" "$2" echo      ;}
fdecho() { __wcs_fzfy_folder "$1" "$2" echo      ;}
ffecho() { __wcs_fzfy_file   "$1" "$2" echo      ;}

fpreview() {
	find . -maxdepth 1 -type f | fzf --tac --cycle --preview "bat --style=numbers --color=always --line-range :500 {}"
}

batpreview() {
	local entries
	local findpath
	local findname
	local chosen
	read findpath findname <<< "$(__wcs_fzfy_resolve_variables $1 $2)"
	entries="$(find $findpath -type f -name "*$findname*")"
	if [[ -n $entries ]]; then
		echo "$entries" | fzf --tac --cycle --preview "bat --style=numbers --color=always --line-range :500 {}"
	else
		echo "$findname not found in $findpath"
	fi
}

fh1() {
	local h1=$(history 1)
	local chosen="$(__wcs_fzfy_select "$h1")"
	if [[ -n "$chosen" ]]; then
		local n=$(echo "$chosen" | awk '{ print $1 }')
		fc -s "$n"
	fi
}

fkill() {
	local pid
	if [ "$UID" != "0" ]; then
		pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
	else
		pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
	fi

	if [ "x$pid" != "x" ]; then
		echo $pid | xargs kill -${1:-9}
	fi
}

__wcs_fzfy_folder() { __wcs_fzfy_all "$1" "$2" "$3" -type d ;}
__wcs_fzfy_file()   { __wcs_fzfy_all "$1" "$2" "$3" -type f ;}

__wcs_fzfy_all() {
	local folders
	local findpath
	local findname
	local chosen
	read findpath findname <<< "$(__wcs_fzfy_resolve_variables $1 $2)"
	folders="$(find $findpath $4 $5 -name "$findname")"
	if [[ -n $folders ]]; then
		chosen="$(__wcs_fzfy_select $folders)"
		if [[ -n $chosen ]]; then
			$3 "$chosen"
		fi
	else
		echo "$findname not found in $findpath"
	fi
}

__wcs_fzfy_select() {
	echo $1 | fzf --tac --height=~100% --select-1 --cycle
}

__wcs_fzfy_resolve_variables() {
	local findpath
	local findname
	if ! grep -q '/' <<< "$1"; then
		[[ -n $1 ]] && \
			findname="*$1*" || \
			findname="*"
		findpath="$(readlink -f ${2:-.})"
	else
		findname="*$(basename $1)*"
		findpath="$(readlink -f $(dirname $1))"
	fi
	findname=$(sed -E 's/\*+/*/g' <<< $findname)
	echo "$findpath $findname"
}
