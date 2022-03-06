# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/biggus/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# starfish prompt setup
eval "$(starship init zsh)"
# EO starfish prompt setup

# print some movie quotes
~/.local/bin/psmq/psmq
# EO psmq

# aliases - start
alias fc='sudo pacman -Rsn $(pacman -Qdtq)'
alias f='clear && psmq'
alias q='exit'
alias py='python3'
alias cl='tty-clock -c -t -C4 -D'
alias i='sudo pacman -S'
alias iy='yay -S'
alias ry='yay -R'
alias r='sudo pacman -R'
alias se='pacman -Ss'
alias sy='yay -Ss'
alias vim='nvim'
alias ls='exa -l -h'
alias ll='exa -la -h'
alias gc='git commit'
alias gs='git status'
alias ga='git add'
alias gp='git push origin'
alias fd='sudo fd -H -I -u'
alias a='startx'
alias upgrade='sudo pacman -Syu'
alias vimrc='cd ~/.config/nvim/'
alias wmrc='nvim ~/.config/qtile/config.py'
alias shellrc='nvim ~/.zshrc'
alias die='shutdown now'
alias teldie='killall telegram-desktop && exit'
alias netres='sudo systemctl restart NetworkManager.service'
# EO aliases

# exports
export EDITOR=nvim
export MYVIMRC='$HOME/.config/nvim/init.vim'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export TERM=xterm
export TERMINAL=alacritty
export BAT_THEME="Dracula"
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
export PATH=/home/biggus/.local/bin:$PATH
# EO add pip to PATH

# add psmq to PATH
export PATH=/home/biggus/.local/bin/psmq:$PATH

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
