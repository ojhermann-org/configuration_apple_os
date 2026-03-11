#!/usr/bin/env zsh

APP="zellij"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v zellij &>/dev/null; then
	brew install zellij
	ln -sf ~/Documents/configuration_apple_os/apps/zellij/config.kdl ~/.config/zellij/config.kdl
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
