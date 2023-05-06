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
alias fc='sudo apt autoremove'
alias f='clear'
alias q='exit'
alias py='python3'
alias i='sudo apt install'
alias r='sudo apt remove'
alias s='apt search'
alias vim='lvim'
alias ls='exa -l -h'
alias ll='exa -la -h'
alias gc='git commit'
alias gs='git status'
alias ga='git add'
alias gp='git push origin'
alias upd='sudo apt update && sudo apt upgrade'
alias wmrc='lvim ~/.config/qtile/config.py'
alias shellrc='lvim ~/.zshrc'
alias die='sudo shutdown now'
alias teldie='killall telegram-desktop && exit'
alias netres='sudo systemctl restart NetworkManager.service'
alias ntp='sudo timedatectl set-ntp true'
alias oc='code .;exit'
alias bs='acpi -i'
# EO aliases

# exports
export EDITOR=nvim
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export TERM=xterm
export TERMINAL=kitty
export BAT_THEME="Sublime Snazzy"
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
# export PATH=/home/user/.local/bin/psmq:$PATH

# add blocks to PATH
# export PATH=/home/user/.local/bin/blocks:$PATH
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

# export PATH=$PATH:$HOME/.local/bin/todowalp
#
# starfish prompt setup
eval "$(starship init zsh)"
# EO starfish prompt setup
