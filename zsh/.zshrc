# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/user/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# aliases - start

alias f='clear'
alias q='exit'
alias py='python3'
alias i='sudo apt install'
alias r='sudo apt remove'
alias vim='nvim'
alias gc='git commit'
alias gs='git status'
alias ga='git add'
alias gp='git push origin'
alias fd='sudo fd -H -I -u'
alias vimrc='cd ~/.config/nvim/'
alias shellrc='nvim ~/.zshrc'
alias die='shutdown now'
alias teldie='killall telegram-desktop && exit'
alias netres='sudo systemctl restart NetworkManager.service'
alias ntp='sudo timedatectl set-ntp true'
alias oc='code .;exit'
alias bat='batcat'

alias ls='exa -l -h'
alias ll='exa -la -h'
# EO aliases

# exports
export EDITOR=nvim
export MYVIMRC='$HOME/.config/nvim/init.vim'
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
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
export PATH=/home/user/.local/bin:$PATH
# EO add pip to PATH

# Add files to .gitignore with one command
function omit () {
    echo $1 >> .gitignore
}
# EO omit()

eval "$(starship init zsh)"
