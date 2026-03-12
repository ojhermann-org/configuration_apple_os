#!/usr/bin/env zsh

APP="firefox"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v firefox &>/dev/null; then
	brew install --cask firefox
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
