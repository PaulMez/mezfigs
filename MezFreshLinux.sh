#!/bin/bash

#//gitpod.io/#httpmyGITURL

#SUDO Version

#sudo apt-get install curl -yy; bash -c "$(curl -H 'Cache-Control: no-cache' -fsSL https://raw.githubusercontent.com/PaulMez/mezfigs/master/MezFreshLinux.sh)"


# Dependencies
# Common Apps + tmux + screenfetch
# Aliases
# Tmux configs/ shortcuts
# Starship - Cross-Shell Prompt
# zplug - A next-generation plugin manager for zsh
# zsh-completions - Additional completion definitions for Zsh.
# zsh-you-should-use - ZSH plugin that reminds you to use existing aliases for commands you just typed.
# zsh-history-substring-search - ZSH port of Fish history search (up arrow)
# zsh-completions - Additional completion definitions for Zsh.
# zsh-autosuggestions - Fish-like autosuggestions for Zsh.



MezBack='\e[46;30m'
reset='\e[0m'

MezPrint () {
echo -e "${MezBack}\n[$1]${reset}\n"
}

MezPrintCen () {
echo -e "${MezBack}\n[$1]${reset}\n" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
}

clear
MezPrint "-----------------[Installing Mez Configs]-----------------"

MezPrintCen "Installing Individual Requirements" 
#echo "Some Other Text" | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
