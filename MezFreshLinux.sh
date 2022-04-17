#!/bin/bash

#//gitpod.io/#httpmyGITURL

#SUDO Version

#paste|| sudo apt-get install curl -yy; bash -c "$(curl -H 'Cache-Control: no-cache' -fsSL https://raw.githubusercontent.com/PaulMez/mezfigs/master/MezFreshLinux.sh)"

#perfect prompt
#https://raw.githubusercontent.com/b4b4r07/screenshots/master/zplug/demo.gif




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
MezPrintCen "[--------------------------------------------]"
MezPrintCen "[Installing Mez Configs]"
MezPrintCen "[--------------------------------------------]"
MezPrint "Installing Individual Requirements" 


# Dependencies & Common Apps
declare -a Reqs=("wget" "zsh" "git" "unzip" "fontconfig" "screenfetch" "cmatrix" "tmux" "awk")
arraylength=${#Reqs[@]}

for (( i=1; i<${arraylength}; i++ ));
do
  echo -e "${MezBack}$i. ${Reqs[$i]}${reset}"
  eval "sudo apt install ${Reqs[$i]} -yy"
done

#Nerd Fonts
MezPrint "Installing Nerd Fonts (FiraCode)"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts
rm FiraCode.zip
fc-cache -fv

# Aliases

# Tmux configs/ shortcuts

#Powerlevel10k (and config if prompted)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc


# zplug - A next-generation plugin manager for zsh
$ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# zsh-completions - Additional completion definitions for Zsh.
# zsh-you-should-use - ZSH plugin that reminds you to use existing aliases for commands you just typed.
# zsh-history-substring-search - ZSH port of Fish history search (up arrow)
# zsh-completions - Additional completion definitions for Zsh.
# zsh-autosuggestions - Fish-like autosuggestions for Zsh.

#Config P10k
p10k configure