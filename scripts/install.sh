#!/usr/bin/env bash
# This script provisions the system.

set -euo pipefail

# Install the bootloader theme
sudo cp -rT ~/.config/dotfiles/rose-pine /boot/EFI/refind/

# My configs and scripts
mkdir -p ~/.local/bin && ln -sfn ~/.config/dotfiles/scripts ~/.local/bin
ln -sfn ~/.config/dotfiles/kitty ~/.config/kitty
ln -sfn ~/.config/dotfiles/hypr ~/.config/hypr
ln -sfn ~/.config/dotfiles/mako ~/.config/mako
ln -sfn ~/.config/dotfiles/nvim ~/.config/nvim
ln -sfn ~/.config/dotfiles/satty ~/.config/satty
ln -sfn ~/.config/dotfiles/waybar ~/.config/waybar
ln -sfn ~/.config/dotfiles/wofi ~/.config/wofi
ln -sfn ~/.config/dotfiles/ranger ~/.config/ranger

# Vim
ln -sfn ~/.config/dotfiles/.vimrc ~/.vimrc

#Tmux
ln -s ~/.config/dotfiles/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Zsh
ln -s ~/.config/dotfiles/.zshrc ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
source ~/.zshrc
