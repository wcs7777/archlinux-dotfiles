#!/bin/bash

root_setup="$(dirname -- "$(realpath -- "$0")")"
root_setup="$(dirname -- "$(realpath -- "$root_setup")")"
scripts_setup="$root_setup/scripts"
nvim_scripts_setup="$root_setup/nvim-scripts"
files_setup="$root_setup/files"
export root_setup
export scripts_setup
export files_setup
export nvim_scripts_setup
