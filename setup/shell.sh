#!/usr/bin/env bash

# install ZSH
echo "- zsh"
sudo apt-get -qq install zsh &>/dev/null
sudo chsh -s $(which zsh) "$USER" >/dev/null

echo "- oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended &>/dev/null

echo "- zsh-asdf"
git clone -q https://github.com/asdf-vm/asdf.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/asdf &>/dev/null

echo "- zsh-autosuggestions"
git clone -q https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &>/dev/null

echo "- zsh-syntax-highlighting"
git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &>/dev/null

echo "- p10k"
git clone -q --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k &>/dev/null

echo "- firacode nerd font"
font_path=$HOME/.local/share/fonts
mkdir -p "$font_path"

curl -sSOL 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip'
mkdir FiraCode
unzip -qq FiraCode.zip -d FiraCode
rm FiraCode.zip
cp FiraCode/Fira\ Code\ *\ Nerd\ Font\ Complete\ Mono.ttf "$font_path"
rm -rf FiraCode

# reload font cache
sudo apt install fontconfig
fc-cache -f
