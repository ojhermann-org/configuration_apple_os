#!/usr/bin/env zsh
# shellcheck shell=bash

APP="zellij"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v zellij &>/dev/null; then
	brew install zellij
	if [[ ! -d ~/.config/zellij/layouts ]]; then
		mkdir -p ~/.config/zellij/layouts
	fi
	ln -sf ~/Documents/configuration_apple_os/apps/zellij/config.kdl ~/.config/zellij/config.kdl
	ln -sf ~/Documents/configuration_apple_os/apps/zellij/layouts ~/.config/zellij/layouts
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"

# todo make sure config overwrites the default and does not get overwritten
