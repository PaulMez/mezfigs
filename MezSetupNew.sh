#!/bin/bash
#bash -c "$(curl -H 'Cache-Control: no-cache' -fsSL https://raw.githubusercontent.com/PaulMez/mezfigs/master/MezSetupNew.sh)" 
#bash -c "$(curl -H 'Cache-Control: no-cache' -fsSL https://raw.githubusercontent.com/PaulMez/mezfigs/master/MezSetupNew.sh)"

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
#sudo apt-get update

# Dependencies & Common Apps
declare -a Reqs=("wget" "zsh" "curl" "git" "unzip" "fontconfig" "screenfetch" "cmatrix" "tmux" "gawk" "htop" "rmlint" "ncdu" "gdu" "btop" "bat" "ranger" "fzf" "ZELLIJ" "dust")
arraylength=${#Reqs[@]}

for (( i=0; i<${arraylength}; i++ ));
do
  echo -e "${MezBack}$i. ${Reqs[$i]}${reset}"
  eval "sudo apt install ${Reqs[$i]} -yy"
done

#Setup zsh

#zsh plugins
# Define the list of desired plugins
desired_plugins=("aws" "git" "docker" "zsh-you-should-use" "zsh-autosuggestions" "zsh-syntax-highlighting")
# The path to the .zshrc file
zshrc="$HOME/.zshrc"
# Check if .zshrc exists
if [ ! -f "$zshrc" ]; then
    echo ".zshrc file not found!"
    exit 1
fi
# Extract the current plugins from .zshrc
current_plugins=$(grep "^plugins=(" "$zshrc")
if [ -z "$current_plugins" ]; then
    # If plugins line doesn't exist, add it with all desired plugins
    echo "plugins=(${desired_plugins[*]})" >> "$zshrc"
else
    # If the plugins line exists, check each desired plugin
    for plugin in "${desired_plugins[@]}"; do
        if ! grep -q "plugins=(.*\b$plugin\b.*" "$zshrc"; then
            # If the plugin is not found, append it
            sed -i "/^plugins=(/ s/)$/, $plugin)/" "$zshrc"
        fi
    done
fi
echo "Your .zshrc plugins have been updated."

#alias 

#alias to swap out cat for bat, etc and suggest