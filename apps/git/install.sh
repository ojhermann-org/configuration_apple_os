#!/usr/bin/env zsh

APP="git config"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if [ ! -f ~/.config/git/config ]; then
	ln -sf ~/Documents/configuration_apple_os/apps/git/config ~/.config/git/config
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
