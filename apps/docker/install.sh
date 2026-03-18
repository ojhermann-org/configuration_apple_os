#!/usr/bin/env zsh
# shellcheck shell=bash

APP="docker"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v docker &>/dev/null; then
	brew install docker
	brew install --cask docker
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
