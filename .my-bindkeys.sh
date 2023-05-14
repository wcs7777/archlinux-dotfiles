if [ -n "$ZSH_NAME" ]; then
	# bindkey "^L"      __wcs_clear_prompt
	bindkey "^H"      backward-kill-word
	bindkey "^[[3;5~" kill-word
	bindkey "^[[H"    beginning-of-line
	bindkey "^[[F"    end-of-line
	bindkey "^[[3~"   delete-char
	bindkey "^[[1;5C" forward-word
	bindkey "^[[1;5D" backward-word
	bindkey "^ "      autosuggest-accept
	bindkey "^[h"     __wcs_location_h
	bindkey "^[0"     __wcs_flocations
	bindkey "^[1"     __wcs_location_1
	bindkey "^[2"     __wcs_location_2
	bindkey "^[3"     __wcs_location_3
	bindkey "^[4"     __wcs_location_4
	bindkey "^Y"      __wcs_fhistory_edit
elif [ -n "$BASH" ]; then
	bind "\C-H":shell-backward-kill-word
	bind "^[[3;5~":shell-kill-word
fi
