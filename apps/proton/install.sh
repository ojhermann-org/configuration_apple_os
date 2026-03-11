#!/usr/bin/env zsh

APP="proton"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if [[ ! -d "/Applications/Proton Pass.app"]]; then
	brew install --cask proton-pass
fi

if [[ ! -d "/Applications/ProtonVPN.app"]]; then
	brew install --cask protonvpn
fi

if [[ ! -d "/Applications/Proton Mail Uninstaller.app"]]; then
	brew install --cask proton-mail
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
