#!/bin/zsh

__wcs_remove_duplicates_history() {
	local histfile="$HISTFILE"
	local histsize="$HISTSIZE"
	local savehist="$SAVEHIST"
	fc -ln -1 0 | nl | sort -k 2 | uniq -f 1 | sort -n | cut -f 2 | tac  > "$HISTFILE"
	fc -p
	HISTFILE="$histfile"
	HISTSIZE="$histsize"
	SAVEHIST="$savehist"
	fc -R
}

__wcs_remove_duplicates_history
unset -f __wcs_remove_duplicates_history
