#!/usr/bin/env zsh
# shellcheck shell=bash

APP="proton"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if [[ ! -e "/Applications/Proton Pass.app" ]]; then
	brew install --cask proton-pass
fi

if [[ ! -e "/Applications/ProtonVPN.app" ]]; then
	brew install --cask protonvpn
fi

if [[ ! -e "/Applications/Proton Mail Uninstaller.app" ]]; then
	brew install --cask proton-mail
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
