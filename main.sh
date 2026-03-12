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

function setup-scripts {
	for file in ~/Documents/configuration_apple_os/scripts/*sh; do
		if [[ -f "$file" ]]; then
			BF="$(basename "$file")"
			F=${BF%.sh}
			P="/usr/bin/$F"
			if [[ ! -e "$P" ]]; then
				sudo ln -s "$file" "/usr/local/bin/$F"
				chmod +x "/usr/local/bin/$F"
			fi
		fi
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

	PROMPT="%F{yellow}%n@%m in %~ > %f"
	COMMAND="export PROMPT='$PROMPT'"
	if ! grep -Fxq "$COMMAND" ~/.zshrc; then
		echo $COMMAND >>~/.zshrc
	fi

	COMMAND="precmd() { RPROMPT=\$(my-rprompt) }"
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
