#!/usr/bin/env zsh
# shellcheck shell=bash

APP="hx"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v "$APP" &>/dev/null; then
	brew install "$APP"
fi

# bash
if ! command -v bash-language-server &>/dev/null; then
	brew install bash-language-server
fi
if ! command -v shfmt &>/dev/null; then
	brew install shfmt
fi

# kdl
if ! command -v kdlfmt &>/dev/null; then
	brew install hougesen/tap/kdlfmt
fi

# markdown
if ! command -v markdown-oxide &>/dev/null; then
	brew install markdown-oxide
fi
if ! command -v marksman &>/dev/null; then
	brew install marksman
fi
if ! command -v prettier &>/dev/null; then
	brew install prettier
fi

# toml
if ! command -v taplo &>/dev/null; then
	brew install taplo
fi
if ! command -v tombi &>/dev/null; then
	brew install tombi
fi

if [ ! -e ~/.config/helix/config.toml ]; then
	ln -s ~/Documents/configuration_apple_os/apps/hx/config.toml ~/.config/helix/config.toml
fi

if [ ! -e ~/.config/helix/languages.toml ]; then
	ln -s ~/Documents/configuration_apple_os/apps/hx/languages.toml ~/.config/helix/languages.toml
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
