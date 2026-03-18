#!/usr/bin/env zsh
# shellcheck shell=bash

APP="aws"

print -P "%F{green}%B$APP%b: starting to install $APP%f"

if ! command -v aws &>/dev/null; then
	brew install awscli
fi

print -P "%F{green}%B$APP%b: $APP has been installed%f"
