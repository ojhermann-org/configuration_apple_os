#!/usr/bin/env zsh
# shellcheck shell=bash

APP="alacritty"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v alacritty &>/dev/null; then
	brew install --cask alacritty
fi

if [[ ! -d ~/.config ]]; then
	mkdir ~/.config
fi

if [[ ! -d ~/.config/alacritty ]]; then
	mkdir ~/.config/alacritty
fi

if [ ! -f ~/.config/alacritty/alacritty.toml ]; then
	ln -sf ~/Documents/configuration_apple_os/apps/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
