#!/usr/bin/env zsh

APP="typos"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v typos &>/dev/null; then
	$ brew install typos-cli
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
