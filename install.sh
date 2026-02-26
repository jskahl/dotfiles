#!/bin/env bash

su

# add packages
pacman -Syu
pacman -S --noconfirm --needed \
    stow \
    fish \
    hyprland \
    base-devel \
    python \
    gcc

# install paru
mkdir -p $HOME/.local/share

git clone https://aur.archlinux.org/paru.git $HOME/.local/share/paru
cd $HOME/.local/share/paru
makepkg -si --noconfirm

# install neovim
git clone https://github.com/neovim/neovim $HOME/.local/share/neovim
cd $HOME/.local/share/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
make install

rm -rf $HOME/.config/nvim
cd $HOME/dotfiles
stow nvim # add nvim config

# install caelestia
paru -S --noconfirm --needed \
    caelestia-shell-git \
    quickshell-git \
    python-materialyourcolor-git

git clone https://github.com/caelestia-dots/caelestia.git ~/.local/share/caelestia
cd $HOME/.local/share/caelestia
chmod +x install.fish
./install.fish
