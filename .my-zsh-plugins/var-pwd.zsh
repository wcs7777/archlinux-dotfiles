#!/bin/zsh

varpass() {
	var_pass=''
	read -s "var_pass?Password: "
}

clearvarpass() {
	var_pass=''
}
