__wcs_clear_prompt() {
	local new_lines
	local i
	new_lines=""
	for i in {1..$((LINES/5))}; do new_lines="${new_lines}\n\n\n\n\n\n\n"; done
	echo ${new_lines}
	zle redisplay
	#zle reset-prompt
}

zle -N __wcs_clear_prompt

