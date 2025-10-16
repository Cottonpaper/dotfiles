#!/bin/bash

kittythemes="$HOME/.config/kitty/themes"
kittyconf="$HOME/.config/kitty/kitty.conf"

nvimcolors="$HOME/.config/nvim/lua/plugins/colorschemes.lua"
nvimconf="$HOME/.config/nvim/init.lua"

waybarthemes="$HOME/.config/waybar/themes"
waybarfullscreen="$HOME/.config/waybar/styles/Fullscreen.css"
waybarmodern="$HOME/.config/waybar/styles/Modern.css"
waybarrestart="$HOME/.config/waybar/scripts/restart.sh"

kittychoice=$(ls $kittythemes | fzf --layout reverse --border --prompt="Choose Kitty theme > ")
sed -i "s#themes/[^ ]*#themes/$kittychoice#g" "$kittyconf"

waybarchoice=$(ls $waybarthemes | sed 's/\.css$//' | fzf --layout reverse --border --prompt="Choose a Waybar colorscheme > ")
sed -i "s#url(\"../themes/[^ ]*\.css\");#url(\"../themes/$waybarchoice\.css\");#g" "$waybarfullscreen"
sed -i "s#url(\"../themes/[^ ]*\.css\");#url(\"../themes/$waybarchoice\.css\");#g" "$waybarmodern"
source $waybarrestart
