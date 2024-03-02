#!/bin/bash

#   github.com/Cottonpaper
#
#   Install/Clone needed packages and
#   move configs into their appropriate dirs
#
#   Run this script from the dotfiles directory.


BOLD='\e[1m'
RED='\e[91m'
BLUE='\e[34m'
RESET='\e[0m'

echo -e "${BLUE}----------------------------"
echo -e "\nInstalling Packages\n"
echo -e "----------------------------${RESET}"

sudo pacman -S $(< packages.list)
