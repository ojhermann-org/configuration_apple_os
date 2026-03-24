#!/usr/bin/env zsh
# shellcheck shell=bash

brew uninstall --cask proton-mail
rm -rf ~/Library/Application Support/protonmail/

brew uninstall --cask protonvpn

brew install --cask proton-pass
