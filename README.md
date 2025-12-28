# My Config Files

## Content

- `Hypr` - Window manager
- `Kitty` - Terminal
- `Mako` - Notification daemon
- `Nvim` - Terminal text editor
- `Ranger` - Terminal file manager
- `rose-pine` - Refind theme
- `Satty`
- `Waybar` - Top bar
- `Wofi` - Program runner

## How to install

```sh
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
cp ~/config/.vimrc ~/
cp ~/config/.zshrc ~/
```

# Optional

```sh
cp -r ~/config/alacritty.toml ~/

```
