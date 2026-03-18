#!/usr/bin/env zsh
# shellcheck shell=bash

APP="tree"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v tree &>/dev/null; then
	brew install tree
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
