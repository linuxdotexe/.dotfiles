# dotfiles
my dotfiles are here just in case i mess up my arch install.
### Install Starship Prompt
```
curl -fsSL https://starship.rs/install.sh | bash
```
### Install apps
``` 
sudo pacman -S acpi alacritty amfora awesome bat discord exa fd flameshot linux-headers lxappearance mesa mtpfs nano networkmanager npm p7zip pamixer pavucontrol pcmanfm-gtk3 playerctl powerline-fonts ranger rofi subversion telegram-desktop thunderbird ttf-roboto vlc xdotool xfce4-power-manager zathura zathura-pdf-poppler zsh
```
### Install yay
```
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
```
### Apps to be installed through yay
```
yay -S android-sdk-platform-tools brave-bin cli-visualizer gotop gruvbox-dark-icons-gtk gruvbox-material-gtk-theme-git i3lock-color librewolf-bin moc-pulse neovim-nightly-bin pfetch timeshift-bin tty-clock vimix-cursors
```

### Enable tap to click
edit or create file ```/etc/X11/xorg.conf.d/30-touchpad.conf``` and paste this there
```
Section "InputClass" 

        Identifier "touchpad" 

        Driver "libinput" 

        MatchIsTouchpad "on" 

        Option "Tapping" "on" 

        Option "TappingButtonMap" "lmr" 

EndSection
```
