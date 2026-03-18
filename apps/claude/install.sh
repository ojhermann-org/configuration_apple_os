#!/usr/bin/env zsh
# shellcheck shell=bash

APP="claude"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v claude &>/dev/null; then
	brew install --cask claude-code
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
