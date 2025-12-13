#!/bin/bash

mkdir ~/.local/bin && cp -r ~/config/scripts/* ~/.local/bin && chmod u+x ~/.local/bin/*

cp -r ~/config/kitty ~/.config/
cp -r ~/config/hypr ~/.config/
cp -r ~/config/mako ~/.config/
cp -r ~/config/nvim ~/.config/
cp -r ~/config/satty ~/.config/
cp -r ~/config/waybar ~/.config/
cp -r ~/config/wofi ~/.config/
cp -r ~/config/ranger ~/.config/
sudo cp -r ~/config/rose-pine /boot/EFI/refind/

cp ~/config/.tmux.conf ~/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp ~/config/.zshrc ~/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
source .zshrc
