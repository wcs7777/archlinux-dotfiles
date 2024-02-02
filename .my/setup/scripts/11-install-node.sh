#!/bin/bash

. /opt/asdf-vm/asdf.sh
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf list all nodejs
asdf install nodejs 20.11.0
asdf global nodejs 20.11.0
