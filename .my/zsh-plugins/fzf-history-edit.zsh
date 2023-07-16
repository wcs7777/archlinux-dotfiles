__wcs_fhistory_edit() {
	local h1=$(history 1)
	local chosen="$(__wcs_fzfy_select "$h1")"
	if [[ -n "$chosen" ]]; then
		zle .kill-buffer
		local cmd=$(echo "$chosen" | sed 's/^\s*[0-9]\+\s\+//' | sed 's/\s*$//')
		BUFFER="$cmd"
		zle .end-of-line
		zle .redisplay
	fi
}

zle -N __wcs_fhistory_edit

