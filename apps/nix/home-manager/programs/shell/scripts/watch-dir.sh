#!/usr/bin/env zsh
# shellcheck shell=bash

if git rev-parse --git-dir >/dev/null 2>&1; then
	watchexec -c --watch "." --watch ".git/index" --watch ".git/HEAD" "--no-vcs-ignore" -i ".git/objects/**" -i ".git/logs/**" -- zsh -c gst
else
	watchexec -c --watch "." -- zsh -c gst
fi
