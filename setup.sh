#!/usr/bin/env bash

# reject sudo mode
if [[ $(id -u) == 0 ]] && [[ "$SUDO_COMMAND" ]]; then
	# thanks alex
	echo "sudo detected, aborting"
	echo "Running the script as sudo changes the \$HOME variable, which causes the script to install tools to incorrect paths"
	echo "Instead, run $0 directly. The script will request you password for privileged commands as needed"
	exit 1
fi

# Linux machines only
script_os=Linux
script_pm=apt

echo "Running installation on $script_os. Your password may be needed for privileged commands."
echo "- package manager: $script_pm"

printf "\nEnsuring root access...\n"

sudo -v

# keep-alive: update existing sudo time stamp if set, otherwise do nothing
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

# cd into source directory
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
cd "$dir"

# (TODO)
. setup/shell.sh
#. setup/symlinks.sh
#. setup/tools.sh
#. setup/languages.sh
#. setup/cleanup.sh

printf "\nDone! To finish installation:\n"
# echo "- configure your terminal and IDEs to use Fira Code Nerd Font Mono (already set up in wezterm)"
# https://github.com/tonsky/FiraCode/wiki#enabling-ligatures"
echo "- Run \`zsh\`"
echo "- Configure git to use name, email, gpg key"
printf ":)\n"
