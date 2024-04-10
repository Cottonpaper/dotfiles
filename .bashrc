#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -la --color=auto'
alias cl='clear'
alias shutd='sudo shutdown now'
alias grep='grep --color=auto'
alias vim='nvim'
PS1='\e[1;36m\u\e[m[\W] \e[1;36m\$\e[m '
