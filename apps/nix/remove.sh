#!/usr/bin/env zsh
# shellcheck shell=bash

home-manager uninstall
rm -rf ~/.config/home-manager
nix-collect-garbage -d

/nix/nix-installer uninstall --no-confirm
