#!/bin/bash

# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sterling/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sterling/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sterling/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sterling/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
