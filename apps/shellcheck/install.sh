#!/usr/bin/env zsh
# shellcheck shell=bash

APP="shellcheck"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v shellcheck &>/dev/null; then
	brew install shellcheck
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
