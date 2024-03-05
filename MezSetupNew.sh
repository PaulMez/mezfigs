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
MezPrintCen "[Installing Mez Configs (Linux Env Only!)]"
MezPrintCen "[--------------------------------------------]"
MezPrint "Installing Individual Requirements" 

#update first
MezPrint "Updating apt"
#sudo apt-get update

# Dependencies & Common Apps
declare -a Reqs=("wget" "zsh" "curl" "git" "unzip" "fontconfig" "screenfetch" "cmatrix" "tmux" "gawk" "htop" "rmlint" "ncdu" "gdu" "btop" "bat" "ranger" "fzf")
arraylength=${#Reqs[@]}

for (( i=0; i<${arraylength}; i++ ));
do
  echo -e "${MezBack}$i. ${Reqs[$i]}${reset}"
  eval "sudo apt install ${Reqs[$i]} -yy"
done


#back up zshrc
cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)

#Setup zsh


zshrc="$HOME/.zshrc"


#zsh plugins
# Define the list of desired plugins
desired_plugins=("aws" "git" "docker" "zsh-you-should-use" "zsh-autosuggestions" "zsh-syntax-highlighting")
# The path to the .zshrc file

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
# alias ll='ls -lahG'
# alias tt="cd ~/aws/tinytales/"
# alias ttf="cd ~/aws/tinytales/tinytales_frontend/"
# alias ttb="cd ~/aws/tinytales/tinytales_backend"
# alias MezTu_ssh="ssh meztu@192.168.1.41"
# alias MezTop_ssh="ssh meza@192.168.1.2"
# alias p3=python3
# alias cat="catbat"
# alias cat_orig="cat"
  

#alias to swap out cat for bat, etc and suggest

#zsh functions


# Function to be added
gitcap_function="function gitcap() {
  git add . && git commit -m \"\$1\" && git push
}"


# Check if the function gitcap() already exists
if grep -q "function gitcap()" "$zshrc"; then
    echo "The gitcap() function already exists in .zshrc."
else
    # If the function does not exist, add it to .zshrc
    echo "$gitcap_function" >> "$zshrc"
    echo "The gitcap() function has been added to .zshrc."
fi


top_function="top() {
    read -p "Would you like to use btop instead? (Y/n): " answer
    answer=${answer:-Y} # Default to Y if no input is given
    
    case $answer in
        [Nn]* ) command top;;
        * ) command btop;;
    esac
}
"

if grep -q "function top()" "$zshrc"; then
    echo "The top() function already exists in .zshrc."
else
    # If the function does not exist, add it to .zshrc
    echo "$top_function" >> "$zshrc"
    echo "The top() function has been added to .zshrc."
fi

#zellij
# homebrew 
# brew install zellij
# dust