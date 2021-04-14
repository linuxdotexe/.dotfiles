#!/bin/sh

echo 'System update'
sudo pacman -Syu
echo 'Part1 - Installing dependencies'
echo 'Installing the starship prompt'
curl -fsSL https://starship.rs/install.sh | bash
echo 'Installing dependencies'
echo '#1 Installing previously used apps'
sudo pacman -S acpi alacritty amfora awesome bat birdtray discord exa fd flameshot linux-headers lxappearance mtpfs nano networkmanager network-manager-applet npm nvidia p7zip pamixer pavucontrol pcmanfm-gtk3 playerctl powerline-fonts ranger rofi subversion telegram-desktop thunderbird tmux ttf-roboto vlc xdotool xfce4-power-manager zathura zathura-pdf-poppler zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting
echo '#2 Installing yay'
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
echo '#3 Installing previously used AUR apps'
yay -S android-sdk-platform-tools brave-bin cli-visualizer gotop gruvbox-dark-icons-gtk gruvbox-material-gtk-theme-git i3lock-color moc-pulse neovim-nightly-bin pfetch timeshift-bin tty-clock vimix-cursors webtorrent-desktop-bin
echo 'Placing .moc folder in home directory'
mv .moc ~/
echo 'Placing .zsh in the home directory'
mv .zsh ~/
echo 'Placing rofi-scripts in the home directory'
mv rofi-scripts ~/
echo 'Replacing .bashrc'
mv .bashrc ~/
echo 'replacing .zshrc'
mv .zshrc ~/
echo 'Finishing'
mv LICENSE ~/
mv README.md ~/
echo 'Finished restoring system part1'
echo 'Part2 - Installing Gruver'
echo 'Changing to appropriate directory'
cd ~/.config/
echo 'Cloning into sainivasmangu/gruver'
git clone https://github.com/sainivasmangu/gruver.git
mv gruver awesome
