#!/bin/bash

. /opt/asdf-vm/asdf.sh
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf list all nodejs
asdf install nodejs 18.16.1
asdf global nodejs 18.16.1
