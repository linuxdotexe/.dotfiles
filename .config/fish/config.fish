set fish greeting

# Prompt at ~/.config/fish/functions/fish_prompt.fish

# Key bindings settings

function fish_user_key_bindings
  fish_vi_key_bindings insert
end

# End of key bindings settings

# Define default directory to start in

cd ~/

# End of default directory thing
# Set Fish Theme

theme_gruvbox dark medium

# End theme setting
# Aliases - Start

alias fc='sudo pacman -Rsn (pacman -Qdtq)'
alias f='clear'
alias q='exit'
alias py='python3'
alias maxbr='xrandr --output eDP-1 --brightness 2'
alias nicebr='xrandr --output eDP-1 --brightness 1.25'
alias minbr='xrandr --output eDP-1 --brightness 1'
alias cl='tty-clock -c -t -C4 -D'
alias min='xdotool search Terminal windowminimize'
alias minf='xdotool search Terminal windowminimize && f'
alias i='sudo pacman -S'
alias iy='yay -S'
alias ry='yay -R'
alias r='sudo pacman -R'
alias s='pacman -Ss'
alias sy='yay -Ss'
alias lock='minf && i3lock -i ~/Downloads/lockwalp.png -O 0 -R 1500'
alias vim='nvim'
alias ls='exa -l -h'
alias lst='exa -T'
alias la='exa -la'
alias ..='cd ..'
alias .='cd ~'
alias gc='git commit'
alias gs='git status'
alias ga='git add'
alias gp='git push origin master'
alias ytd='youtube-dl'
alias yp='youtube-dl --extract-audio --audio-format mp3'
set enn (xinput | grep Synaptics | grep -oP "id=\K..")
alias curd='xinput disable $enn'
alias cure='xinput enable $enn'
alias pomo='python3 ~/HDD/programs/pomo/pomo.py'
alias fd='fd -I'
# Aliases - End

# Define Spicetify path

export SPICETIFY_INSTALL="/home/retr0/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

# End of spicetify path defining thing

# Bang-Bang

function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end
bind ! __history_previous_command
# End of Bang-Bang

### Functions taken from razzius/fish-functions ###

# Function - backup.fish

function backup --argument filename
  cp $filename $filename.bak
end

# End backup.fish

# Function - restore.fish

function restore --argument file
  mv $file (echo $file | sed s/.bak//)
end

# End restore.fish

# Function - mkdir-cd.fish

function mkdir-cd
  mkdir $argv && cd $argv
end

# End mkdir-cd.fish

# Function clean-unzip.fish

function clean-unzip --argument zipfile
    if not test (echo $zipfile | string sub --start=-4) = .zip
        echo (status function): argument must be a zipfile
        return 1
    end

    if is-clean-zip $zipfile
        unzip $zipfile
    else
        set zipname (echo $zipfile | trim-right '.zip')
        mkdir $zipname || return 1
        unzip $zipfile -d $zipname
    end
end

# End clean-unzip.fish

# Function - take.fish

function take --argument number
  head -$number
end

# End take.fish

### End of razzius/fish-functions ###

# Exports

export EDITOR=nvim
export MYVIMRC='$HOME/.config/nvim/init.vim'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export TERM=xterm
# End exports

# Set Starfish Prompt

starship init fish | source
