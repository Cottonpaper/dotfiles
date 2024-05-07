#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -la --group-directories-first --color=auto'
alias cl='clear'
alias shutd='sudo shutdown now'
alias grep='grep --color=auto'
alias vim='nvim'
alias update='sudo pacman -Syu'
alias inpac='sudo pacman -S'
alias tree='tree -laC --gitignore -I .git'
alias findfont='fc-list : family style | sort | grep -i '
alias listfonts='fc-list : family style | sort '

# ANSI color escape codes
BLACK='\e[30m'
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
MAGENTA='\e[35m'
CYAN='\e[36m'
WHITE='\e[97m'

BOLD='\e[1m'
RESET='\e[0m'

greenprompt="${BOLD}${GREEN}\u${RESET}[\W] ${BOLD}${GREEN}\$${RESET} "
redprompt="${BOLD}${RED}\u${RESET}[\W] ${BOLD}${RED}\$${RESET} "
blueprompt="${BOLD}${BLUE}\u${RESET}[\W] ${BOLD}${BLUE}\$${RESET} "
yellowprompt="${BOLD}${YELLOW}\u${RESET}[\W] ${BOLD}${YELLOW}\$${RESET} "
magentaprompt="${BOLD}${MAGENTA}\u${RESET}[\W] ${BOLD}${MAGENTA}\$${RESET} "

PS1=$blueprompt

# https://www.youtube.com/watch?v=e4ujS1er1r0
