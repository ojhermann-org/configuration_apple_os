#!/usr/bin/env zsh
# shellcheck shell=bash

APP="kubectl"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v kubectl &>/dev/null; then
	brew install kubectl
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
