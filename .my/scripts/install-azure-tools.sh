#!/bin/bash

. /opt/asdf-vm/asdf.sh

readonly azure_cli_version="2.60.0"
readonly azure_func_version="4.0.5455"

asdf plugin add azure-cli https://github.com/EcoMind/asdf-azure-cli
asdf list all azure-cli
asdf install azure-cli $azure_cli_version
asdf global azure-cli $azure_cli_version

asdf plugin add azure-functions-core-tools https://github.com/daveneeley/asdf-azure-functions-core-tools.git
asdf list all azure-functions-core-tools
asdf install azure-functions-core-tools $azure_func_version
asdf global azure-functions-core-tools $azure_func_version
