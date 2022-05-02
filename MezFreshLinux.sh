#!/bin/bash

#//gitpod.io/#httpmyGITURL

#SUDO Version

#paste|| sudo apt install curl -yy; bash -c "$(curl -H 'Cache-Control: no-cache' -fsSL https://raw.githubusercontent.com/PaulMez/mezfigs/master/MezFreshLinux.sh)"

#perfect prompt
#https://raw.githubusercontent.com/b4b4r07/screenshots/master/zplug/demo.gif

# TO DO
#Add promp to install configs/alias only?
# If one fails, pause/continue?

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

#update first
MezPrint "Updating apt"
sudo apt-get update

# Dependencies & Common Apps
declare -a Reqs=("wget" "zsh" "curl" "git" "unzip" "fontconfig" "screenfetch" "cmatrix" "tmux" "gawk" "htop")
arraylength=${#Reqs[@]}

for (( i=0; i<${arraylength}; i++ ));
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
#Copy alias from alias config file hosted on same repo

# Tmux configs/ shortcuts
#Copy tmux configs from file hosted on same repo
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source-file ~/.tmux.conf 
prefix + I - - insatall tpm themes


# # zplug - A next-generation plugin manager for zsh   or maybe use ZINIT?
# MezPrint "Installing Zplug & adding plugins"
# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh #maybe dont initiate zsh yet?


# # zsh-completions - Additional completion definitions for Zsh.
# # zsh-you-should-use - ZSH plugin that reminds you to use existing aliases for commands you just typed.
# # zsh-history-substring-search - ZSH port of Fish history search (up arrow)
# # zsh-completions - Additional completion definitions for Zsh.
# # zsh-autosuggestions - Fish-like autosuggestions for Zsh. marlonrichert/zsh-autocomplete

#Install ZINIT
MezPrint "Installing ZINIT & adding plugins"
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)" -y

#add following to .zshrc
nano .zshrc
#zinit load marlonrichert/zsh-autocomplete
#zstyle ':autocomplete:*' min-input 1
zinit load MichaelAquilina/zsh-you-should-use
zinit load zsh-users/zsh-autosuggestions
zinit load b4b4r07/enhancd
zinit load zsh-users/zsh-syntax-highlighting #Must be last
# #Config P10k
# #zsh
# #p10k configure | n | Y | Y | 3 | 1 | 3 | 1 | 1 | 1 | 1 | 3 | 1 | Y | 1 | Y

# #Make zsh default
# chsh -s /usr/bin/zsh

#Powerlevel10k
MezPrint "Installing Powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# #Katoolin (optional)
# sudo su
# git clone https://github.com/LionSec/katoolin.git && cp katoolin/katoolin.py /usr/bin/katoolin
# chmod +x /usr/bin/katoolin
# sudo katoolin