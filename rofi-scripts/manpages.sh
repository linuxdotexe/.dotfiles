#!/bin/bash
DMTERM="alacritty -e"
declare -a options=(
    "search"
    "random"
    "quit"
)
choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p 'man:')
case "$choice" in
	'search')
        man -k . | awk '{$3="-"; print $0}' | \
        rofi -dmenu -i -l 20 -p 'Search for:' | \
        awk '{print $2, $1}' | tr -d '()' | xargs $DMTERM man
	;;
	'random')
        man -k . | awk '{print $1}' | shuf -n 1 | \
        rofi -dmenu -i -l 20 -p 'Random manpage:' | xargs $DMTERM man
	;;
	'quit')
		echo "Program terminated." && exit 0
	;;
	*)
		exit 0
	;;
esac
