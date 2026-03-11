#!/usr/bin/env zsh

APP="pre-commit"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v pre-commit &>/dev/null; then
	brew install pre-commit
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
