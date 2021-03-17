#!/bin/bash
MYBROWSER="brave"
declare -a options=(
"archwiki - https://wiki.archlinux.org/index.php?search="
"duckduckgo - https://duckduckgo.com/?q="
"reddit - https://www.reddit.com/search/?q="
"youtube - https://www.youtube.com/results?search_query="
"quit"
)
while [ -z "$engine" ]; do
enginelist=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 20 -p 'choose engine:') || exit
engineurl=$(echo "$enginelist" | awk '{print $NF}')
engine=$(echo "$enginelist" | awk '{print $1}')
done
while [ -z "$query" ]; do
    if [[ "$engine" == "quit" ]]; then
        echo "terminated" && exit 0
    else
        query=$(echo "$engine" | rofi -dmenu -p 'search:') || exit
    fi
done
$MYBROWSER "$engineurl""$query"
