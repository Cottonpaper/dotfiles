#!/bin/bash

#   github.com/Cottonpaper
#
#   Download and install packages
#
#   Run this script from the dotfiles directory.


BOLD='\e[1m'
RED='\e[91m'
BLUE='\e[34m'
RESET='\e[0m'

echo -e "\n${BOLD}${BLUE}-----------------------------"
echo -e "\n     Installing Packages\n"
echo -e "-----------------------------${RESET}\n"

sudo pacman -S $(< packages.list)
