#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
PS1="\[\033[34;1m\][\W]\[\033[m\]\$ "

# Bash Insulter

if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi

cd ~/
alias f='clear'
alias neofetch='neofetch --source ~/.ascu.txt'
alias q='exit'
alias py='python3'
alias maxbr='xrandr --output eDP-1 --brightness 2'
alias nicebr='xrandr --output eDP-1 --brightness 1.25'
alias minbr='xrandr --output eDP-1 --brightness 1'
alias min='xdotool search Terminal windowminimize'
alias minf='xdotool search Terminal windowminimize && f'
alias i='sudo pacman -S'
alias r='sudo pacman -R'
alias iy='yay -S'
alias ry='yay -R'
alias search='sudo pacman -Ss'
alias lock='minf && i3lock -i ~/Downloads/lockwalp.png -u'
alias vim='nvim'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/retr0/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/retr0/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/retr0/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/retr0/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
