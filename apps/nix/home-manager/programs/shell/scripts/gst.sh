#!/usr/bin/env zsh
# shellcheck shell=bash

if git rev-parse --git-dir >/dev/null 2>&1; then
	git status -sb && tree -aC -I '.git' --gitignore
else
	tree -aC
fi
