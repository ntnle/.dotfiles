#!/usr/bin/env bash

printf "\nCleaning up\n"
echo "- remove lines in .zshrc inserted by setup scripts"
sed -i'' -e '/^### End of File ###$/q' .zshrc

echo "- deleting zsh autocomplete history"
rm -f "$HOME/.zcompdump"
