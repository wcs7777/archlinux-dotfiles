#!/bin/bash

. /opt/asdf-vm/asdf.sh

readonly version="20.11.0"

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf list all nodejs
asdf install nodejs $version
asdf global nodejs $version
