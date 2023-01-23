#!/usr/bin/env bash

printf "\nInstalling programming languages\n"
  . "$HOME/.cargo/env"
echo "- python"
wget -q -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3.sh -b -p "${HOME}/conda" >/dev/null
rm Miniforge3.sh
. "$HOME/conda/etc/profile.d/conda.sh"
conda activate >/dev/null
echo "- node"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git >/dev/null
asdf install nodejs lts &>/dev/null # first installation clones node-build for some reason
asdf install nodejs lts &>/dev/null
asdf global nodejs lts
