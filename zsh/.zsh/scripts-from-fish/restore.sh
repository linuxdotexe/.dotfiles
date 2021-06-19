#!/bin/zsh

for f in *.bak; do mv "$f" "$(echo "$f" | sed s/.bak//)"; done
