#!/bin/bash

style=Modern

pkill waybar

waybar -c ~/.config/waybar/primary.jsonc -s ~/.config/waybar/styles/$style.css &
waybar -c ~/.config/waybar/secondary.jsonc -s ~/.config/waybar/styles/$style.css &

disown
