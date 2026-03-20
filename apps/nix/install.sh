#!/usr/bin/env zsh
# shellcheck shell=bash

APP="nix"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v nix &>/dev/null; then
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
