#!/usr/bin/env zsh
# shellcheck shell=bash

APP="git config"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if [[ ! -d ~/.config ]]; then
	mkdir ~/.config
fi

if [[ ! -d ~/.config/git ]]; then
	mkdir ~/.config/git
fi

if [ ! -f ~/.config/git/config ]; then
	ln -sf ~/Documents/configuration_apple_os/apps/git/config ~/.config/git/config
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
