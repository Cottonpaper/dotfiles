#!/bin/bash

pkill waybar

waybar -c ~/.config/waybar/primary.jsonc &
waybar -c ~/.config/waybar/secondary.jsonc &

disown
