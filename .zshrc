# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sainivas/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# starfish prompt setup
eval "$(starship init zsh)"
# EO starfish prompt setup

# aliases - start
alias fc='sudo pacman -Rsn $(pacman -Qdtq)'
alias f='xdotool key ctrl+l'
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
alias se='pacman -Ss'
alias sy='yay -Ss'
alias lock='minf && i3lock -i ~/Downloads/lockwalp.png -O 0 -R 1500'
alias vim='nvim'
alias ls='exa -l -h'
alias ll='exa -la'
alias ..='cd ..'
alias gc='git commit'
alias gs='git status'
alias ga='git add'
alias gp='git push origin master'
alias ytd='youtube-dl'
alias yp='sudo youtube-dl --extract-audio --audio-format mp3'
ENN="(xinput | grep Synaptics | grep -oP "id=\K..")"
alias curd='xinput disable $ENN'
alias cure='xinput enable $ENN'
alias pomo='python3 ~/HDD/programs/pomo/pomo.py'
alias fd='sudo fd -H -I -u'
alias netc='ping -c 3 linode.com'
alias a='startx'
alias upgrade='sudo pacman -Syu'
alias web='cd ~/hdd/fosse.ml'
alias vimrc='cd ~/.config/nvim/'
alias wmrc='cd ~/.config/awesome/'
alias shellrc='nvim ~/.zshrc'
alias zathura='z'
# EO aliases

# exports
export EDITOR=nvim
export MYVIMRC='$HOME/.config/nvim/init.vim'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export TERM=xterm
export TERMINAL=alacritty
# EO exports

# source /etc/profile for fastboot and adb to work
source /etc/profile
# EO source
# insulter
if [ -f ~/.zsh/zsh-insulter/src/zsh.command-not-found ]; then
    . ~/.zsh/zsh-insulter/src/zsh.command-not-found
fi
# EO insulter

### Functions taken from razzius/fish-functions ###
# Function - backup.sh
alias backup='zsh ~/.zsh/scripts-from-fish/backup.sh'
# End backup.fish

# Function - restore.sh
alias restore='zsh ~/.zsh/scripts-from-fish/restore.sh'
# End restore.fish

# Function - mkdir-cd.fish
mkd(){
    mkdir -p "$@" && cd "$@"
}
# End mkdir-cd.fish
### EO razzius/fish-functions ###

# add pip to PATH
export PATH=/home/sainivas/.local/bin:$PATH
# EO add pip to PATH

# add gem files location to path
export PATH=/home/sainivas/.local/share/gem/ruby/3.0.0/bin:$PATH
# dynamic window titles (help from reddit)
case "$TERM" in
    xterm*|rxvt*)
        function xtitle () {
            builtin print -n -- "\e]0;$@\a"
        }
        ;;
    screen)
        function xtitle () {
            builtin print -n -- "\ek$@\e\\"
        }
        ;;
    *)
        function xtitle () {
        }
esac

function precmd () {
    xtitle "$(print -P $HOST: zsh '(%~)')"
}
 function preexec () {
    xtitle "Running $1"
}
# EO dynamic window titles

# Add files to .gitignore with one command
function omit () {
    echo $1 >> .gitignore
}
# EO omit()
