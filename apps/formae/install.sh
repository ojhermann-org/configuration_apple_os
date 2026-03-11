#!/usr/bin/env zsh

APP="formae"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v formae &>/dev/null; then
	# https://docs.formae.io/en/latest/operations/install-local/
	/bin/bash -c "$(curl -fsSL https://hub.platform.engineering/setup/formae.sh)"
	echo 'export PATH=/opt/pel/formae/bin:$PATH' >>~/.zshrc
	source ~/.zshrc
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
