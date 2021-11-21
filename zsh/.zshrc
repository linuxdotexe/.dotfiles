# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sterling/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# aliases - start
alias fc='sudo apt autoremove'
alias f='clear'
alias q='exit'
alias py='python3'
alias i='sudo apt install'
alias r='sudo apt remove'
alias s='apt search'
alias vim='~/hdd/.nvim.appimage'
alias ls='exa -l -h'
alias ll='exa -la'
alias ..='cd ..'
alias gc='git commit'
alias gs='git status'
alias ga='git add'
alias gp='git push origin master'
alias upd='sudo apt update -y && sudo apt upgrade'
alias web='cd ~/hdd/code/projects/website'
alias vimrc='cd ~/.config/nvim/'
alias wmrc='cd ~/.config/awesome/'
alias die='shutdown now'
alias teldie='killall telegram-desktop && exit'
# EO aliases

# exports
export EDITOR=nvim
export MYVIMRC='$HOME/.config/nvim/init.vim'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export TERM=xterm
export BAT_THEME="Nord"
# EO exports

# source /etc/profile for fastboot and adb to work
source /etc/profile
# EO source
# insulter
if [ -f ~/.zsh/zsh-insulter/src/zsh.command-not-found ]; then
    . ~/.zsh/zsh-insulter/src/zsh.command-not-found
fi
# EO insulter

# Function - mkdir-cd.fish
mkd(){
    mkdir -p "$@" && cd "$@"
}
# End mkdir-cd.fish
### EO razzius/fish-functions ###

# add pip to PATH
export PATH=/home/sterling/.local/bin:$PATH
# EO add pip to PATH

# Add files to .gitignore with one command
function omit () {
    echo $1 >> .gitignore
}
# EO omit()

eval "$(starship init zsh)"
