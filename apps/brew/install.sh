#!/usr/bin/env zsh
# shellcheck shell=bash

APP="brew"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v brew &>/dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew update && brew upgrade

print -P "%F{green}%B$APP%b: $APP has been installed%f"
