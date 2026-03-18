#!/usr/bin/env zsh
# shellcheck shell=bash

APP="proton"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if [[ ! -e "/Applications/Signal.app" ]]; then
	brew install --cask signal
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
