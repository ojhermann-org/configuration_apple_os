#!/usr/bin/env zsh

function install-apps {
	source ~/Documents/configuration_apple_os/apps/brew/install.sh

	for dir in ~/Documents/configuration_apple_os/apps/*; do
		if [[ -d "$dir" && "$(basename "$dir")" != "brew" ]]; then
			for file in "$dir"/install.sh; do
				source "$file"
			done
		fi
	done
}

function setup-aliases {
	if [[ ! -f "~/.zshrc" ]]; then
		touch ~/.zshrc
	fi

	COMMAND="source ~/Documents/configuration_apple_os/aliases.sh"
	if ! grep -Fxq "$COMMAND" "~/.zshrc"; then
		echo $COMMAND >>"~/.zshrc"
	fi
}

function all_things {
	install-apps
	setup-aliases
}

all_things
