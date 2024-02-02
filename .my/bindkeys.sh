if [ -n "$ZSH_NAME" ]; then
	bindkey "^O"      clear-screen
	bindkey "^[l"     clear-screen
	bindkey "^H"      backward-kill-word
	bindkey "^[[3;5~" kill-word
	bindkey "^[[H"    beginning-of-line
	bindkey "^[[1~"   beginning-of-line
	bindkey "^[[F"    end-of-line
	bindkey "^[[4~"   end-of-line
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
	bindkey "^[5"     __wcs_location_5
	bindkey "^[6"     __wcs_location_6
	bindkey "^[7"     __wcs_location_7
	bindkey "^[8"     __wcs_location_8
	bindkey "^[9"     __wcs_location_9
elif [ -n "$BASH" ]; then
	bind "\C-H":shell-backward-kill-word
	bind "^[[3;5~":shell-kill-word
fi
