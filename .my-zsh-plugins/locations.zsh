__wcs_indexed_locations() {
	local locations=""
	local i
	for ((i = 1; i <= "$#__wcs_locations_array"; i++)) {
		locations+="${i} ${__wcs_locations_array[$i]}\n"
	}
	echo "$locations"
}

__wcs_print_locations() {
	zle .kill-buffer
	echo
	__wcs_indexed_locations
	echo
	zle .accept-line
}

__wcs_location() {
	zle .kill-buffer
	cd "$1"
	zle .accept-line
}

__wcs_location_by_index() {
	__wcs_location "${__wcs_locations_array[$1]}"
}

__wcs_location_h() { __wcs_location "$HOME"    }
__wcs_location_1() { __wcs_location_by_index 1 }
__wcs_location_2() { __wcs_location_by_index 2 }
__wcs_location_3() { __wcs_location_by_index 3 }
__wcs_location_4() { __wcs_location_by_index 4 }

__wcs_flocations() {
	zle .kill-buffer
	flocations
	zle .accept-line
}

flocations() {
	local locations=$(__wcs_indexed_locations)
	local chosen="$(__wcs_fzfy_select "$locations")"
	if [[ -n "$chosen" ]]; then
		local i=$(echo "$chosen" | awk '{ print $1 }')
		cd "${__wcs_locations_array[$i]}"
	fi
}

zle -N __wcs_location_h
zle -N __wcs_print_locations
zle -N __wcs_location_1
zle -N __wcs_location_2
zle -N __wcs_location_3
zle -N __wcs_location_4
zle -N __wcs_flocations
