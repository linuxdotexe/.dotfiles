#!/bin/bash

# clone my .dotfiles repo
echo "cloning linuxdotexe/.dotfiles"
cd ~
git clone git@github.com:linuxdotexe/.dotfiles.git

# configure pacman for downloads
echo "configuring pacman"
cp ~/.dotfiles/configs/pacman.conf /etc/pacman.conf

# install applications
echo "Installing applications from pacman"

pacman -S - < pkglist.txt

# install yay
echo "Installing yay"
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si

# install from yay
yay -S betterlockscreen catppuccin-gtk-theme google-chrome gotop-bin ly pfetch-btw playmymusic vimix-cursors visual-studio-code-bin nerd-fonts-ibm-plex-mono

# enable tap to click
echo "touchpad configuration editing"
cp ~/.dotfiles/configs/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf

# stow the config
cd ~/.dotfiles/
stow -R * --ignore="LICENSE" --ignore="README.md" --ignore="configs"

# install starship
curl -fsSL https://starship.rs/install.sh | bash

# change default shell to zsh
chsh -S /bin/zsh
