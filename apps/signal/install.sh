#!/usr/bin/env zsh

APP="proton"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if [[ ! -d "/Applications/Signal.app"]]; then
	brew install --cask signal
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
