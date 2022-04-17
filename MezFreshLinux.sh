#!/bin/bash

#//gitpod.io/#httpmyGITURL

#SUDO Version

#paste|| sudo apt-get install curl -yy; bash -c "$(curl -H 'Cache-Control: no-cache' -fsSL https://raw.githubusercontent.com/PaulMez/mezfigs/master/MezFreshLinux.sh)"






#functions
MezBack='\e[46;30m'
MezBackW='\e[37;30m'
MezBackCy='\e[36;40m'
reset='\e[0m'

MezPrint () {
echo -e "${MezBackCy}\n$1${reset}\n"
}

MezPrintCen () {
echo -e "${MezBackCy}"
echo $1 | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols)
echo -e "${reset}\n"
}



#intro
clear
MezPrintCen "[----------------------]"
MezPrintCen "[Installing Mez Configs]"
MezPrintCen "[----------------------]"
MezPrintCen "Installing Individual Requirements" 


# Dependencies & Common Apps
declare -a Reqs=("wget" "zsh" "git" "unzip" "fontconfig" "screenfetch" "cmatrix" "tmux")
arraylength=${#Reqs[@]}



# Aliases
# Tmux configs/ shortcuts
# Starship - Cross-Shell Prompt
# zplug - A next-generation plugin manager for zsh
# zsh-completions - Additional completion definitions for Zsh.
# zsh-you-should-use - ZSH plugin that reminds you to use existing aliases for commands you just typed.
# zsh-history-substring-search - ZSH port of Fish history search (up arrow)
# zsh-completions - Additional completion definitions for Zsh.
# zsh-autosuggestions - Fish-like autosuggestions for Zsh.