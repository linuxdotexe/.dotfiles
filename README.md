# dotfiles
my dotfiles are here just in case i mess up my arch install.
### Install Starship Prompt
```
curl -fsSL https://starship.rs/install.sh | bash
```
### Install apps
``` 
sudo pacman -S acpi alacritty amfora android-sdk-platform-tools awesome bat birdtray brave-bin cli-visualizer discord exa fd flameshot gotop gruvbox-dark-icons-gtk gruvbox-material-gtk-theme-git i3lock-color linux-headers lxappearance moc-pulse mtpfs nano neovim-nightly-bin networkmanager-runit npm nvidia p7zip pamixer pavucontrol pcmanfm-gtk3 pfetch playerctl powerline-fonts ranger rofi subversion telegram-desktop thunderbird timeshift-bin tmux ttf-roboto tty-clock vimix-cursors vlc webtorrent-desktop-bin xdotool xfce4-power-manager zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting
```
### Install yay
```
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
```
### Apps to be installed through yay
```
yay -S android-sdk-platform-tools brave-bin cli-visualizer gotop gruvbox-dark-icons-gtk gruvbox-material-gtk-theme-git i3lock-color moc-pulse neovim-nightly-bin pfetch timeshift-bin tty-clock vimix-cursors webtorrent-desktop-bin
```
