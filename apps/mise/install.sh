#!/usr/bin/env zsh
# shellcheck shell=bash

APP="mise"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v mise &>/dev/null; then
	curl https://mise.run | sh
	echo "eval \"\$(~/.local/bin/mise activate zsh)\"" >>~/.zshrc
	source ~/.zshrc
	# https://mise.jdx.dev/installing-mise.html#autocompletion
	mise use -g usage
	mkdir -p ~/.zfunc && mise completion zsh >~/.zfunc/_mise
	grep -qxF 'fpath=(~/.zfunc $fpath)' ~/.zshrc || echo 'fpath=(~/.zfunc $fpath)' >>~/.zshrc
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
