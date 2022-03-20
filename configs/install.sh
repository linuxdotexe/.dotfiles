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

pacman -S acpi alacritty alsa-utils autoconf automake base bat binutils bison cronie dosfstools efibootmgr exa fakeroot fd feh file findutils firefox flameshot flex gawk gcc gedit gettext gimp git grep groff gzip inkscape jack2 libtool lua lxappearance m4 make moc mtools nano neovim net-tools network-manager-applet nodejs noto-fonts-emoji npm nvidia openssh os-prober pamixer patch pcmanfm-gtk3 pipewire pkgconf powerline-fonts pulseaudio pulseaudio-alsa python-dbus-next python-pip python-pycryptodomex python-websockets qbittorrent qtile ripgrep stow sudo telegram-desktop texinfo unzip vlc vocal which xdotool xf86-video-vesa xfce4-power-manager xsel yay-git zsh

# install yay
echo "Installing yay"
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si

# install from yay
yay -S betterlockscreen dracula-gtk-theme google-chrome gotop-bin ly nerd-fonts-ubuntu-mono pfetch-btw playmymusic vimix-cursors visual-studio-code-bin ttf-blex-nerd-font-git

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
