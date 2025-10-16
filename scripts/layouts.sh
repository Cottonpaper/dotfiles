#!/bin/bash

hyprlayout="$HOME/.config/hypr/hyprland.conf"

waybarrestart="$HOME/.config/waybar/scripts/restart.sh"

modern() {
	sed -i  "s#/configs/[^ ]*.conf#/configs/modern.conf#g" "$hyprlayout"
	sed -i "s#style=[^ ]*#style=Modern#g" "$waybarrestart"
	source $waybarrestart
}

fullscreen() {
	sed -i "s#/configs/[^ ]*.conf#/configs/fullscreen.conf#g" "$hyprlayout"
	sed -i "s#style=[^ ]*#style=Fullscreen#g" "$waybarrestart"
	source $waybarrestart
}

if [ "$#" -eq 0 ]; then
	echo "Enter 1 for modern layout or 2 for fullscreen layout"
	read layout
	if [ $layout = "1" ]; then
		modern
	elif [ $layout = "2" ]; then
		fullscreen
	else
		exit 1
	fi;
elif [ "$1" = "modern" ]; then
	modern
elif [ "$1" = "fullscreen" ]; then
	fullscreen
fi
