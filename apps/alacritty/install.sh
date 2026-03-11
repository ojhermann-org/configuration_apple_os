#!/usr/bin/env zsh

APP="alacritty"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v alacritty &>/dev/null; then
	brew install --cask alacritty
fi

if [ ! -e ~/.config/alacritty/alacritty.toml ]; then
	if [ ! -d ~/.config/alacritty ]; then
		mkdir ~/.config/alacritty
	fi
	ln -sf ~/Documents/configuration_apple_os/apps/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
fi

print -P "%F{green}%B$APPy%b: $APP has been installed%f"
