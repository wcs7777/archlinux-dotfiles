zmodload zsh/terminfo

__wcs_prompt_to_middle() {
	local half
	local half_down
	local half_up
	local new_lines
	local i
	half=$((LINES/2))
	half_down=""
	half_up=""
	new_lines=""
	for i in {1..$((LINES/5))}; do new_lines="${new_lines}\n\n\n\n\n\n\n"; done
	for i in {1..$half}; do half_down="$half_down$terminfo[cud1]"; done
	for i in {1..$half}; do half_up="$half_up$terminfo[cuu1]"; done
	echo ${new_lines}${half_down}${half_up}$terminfo[cuu1]
	zle redisplay
	#zle reset-prompt
}

zle -N __wcs_prompt_to_middle
