#!/usr/bin/env zsh
# shellcheck shell=bash

APP="watchexec"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v watchexec &>/dev/null; then
	brew install watchexec
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
