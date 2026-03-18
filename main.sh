#!/usr/bin/env zsh
# shellcheck shell=bash

function install-apps {
	source ~/Documents/configuration_apple_os/apps/git/install.sh

	only_need_curl=("brew" "formae" "mise")
	for dir in $only_need_curl; do
		source ~/Documents/configuration_apple_os/apps/"$dir"/install.sh
	done

	for dir in ~/Documents/configuration_apple_os/apps/*; do
		dir_name=$(basename "$dir")
		if [[ "$dir_name" != "git" ]] && [[ ! " ${only_need_curl[@]} " =~ " $dir_name " ]]; then
			for file in "$dir"/install.sh; do
				source "$file"
			done
		fi
	done
}

function setup-scripts {
	for file in ~/Documents/configuration_apple_os/scripts/*sh; do
		BF="$(basename "$file")"
		F=${BF%.sh}
		P="/usr/bin/$F"
		sudo ln -sf "$file" "/usr/local/bin/$F"
		chmod +x "/usr/local/bin/$F"
	done
}

function setup-zsh {
	if [[ ! -f "~/.zshrc" ]]; then
		touch ~/.zshrc
	fi

	AUTOCOMPLETE="autoload -Uz compinit
	compinit"
	COMMAND="$AUTOCOMPLETE"
	if ! grep -qFz "$COMMAND" ~/.zshrc; then
		echo $COMMAND >>~/.zshrc
	fi

	COMMAND="source ~/Documents/configuration_apple_os/aliases.sh"
	if ! grep -Fxq "$COMMAND" ~/.zshrc; then
		echo $COMMAND >>~/.zshrc
	fi

	COMMAND="precmd() { PROMPT=\$(prompt) }"
	if ! grep -Fxq "$COMMAND" ~/.zshrc; then
		echo $COMMAND >>~/.zshrc
	fi

	source ~/Documents/configuration_apple_os/scripts/sudo-by-touch.sh
}

sudo scutil --set ComputerName "local-machine"
sudo scutil --set LocalHostName "local-machine"
sudo scutil --set HostName "local-machine"

install-apps
setup-scripts
setup-zsh
