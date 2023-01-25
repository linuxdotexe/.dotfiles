#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'

alias q='exit'
alias py='python3'
alias i='sudo apt install'
alias r='sudo apt remove'
alias vim='nvim'
alias ..='cd ..'
alias gc='git commit'
alias gs='git status'
alias ga='git add'
alias gp='git push origin master'
# EO aliases

# Add files to .gitignore with one command
function omit () {
    echo $1 >> .gitignore
}
# EO omit()


eval "$(starship init bash)"
