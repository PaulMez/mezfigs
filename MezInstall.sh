#!/bin/bash
#bash -c "$(curl -H 'Cache-Control: no-cache' -fsSL https://raw.githubusercontent.com/PaulMez/mezfigs/master/MezInstall.sh)" 

MezBack='\e[46;30m'
reset='\e[0m'


MezPrint () {
echo -e "${MezBack}\n[$1]${reset}\n"
}


MezPrint "Installing Mez Configs"

MezPrint "Installing Individual Requirements"

declare -a Reqs=("wget" "zsh" "git" "unzip" "fontconfig" "screenfetch")
arraylength=${#Reqs[@]}
# Iterate the string array using for loop


for (( i=1; i<${arraylength}; i++ ));
do
  echo -e "${MezBack}$i. ${Reqs[$i]}${reset}"
  eval "sudo apt install ${Reqs[$i]} -yy"
done

MezPrint "Installing Oh My Zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

#Nerd Fonts
MezPrint "Installing Nerd Fonts (FiraCode)"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts
rm FiraCode.zip
fc-cache -fv

#Install general plugins

MezPrint "Installing Plugins for Zsh"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
sed -i 's:plugins=(git):plugins=(git zsh-syntax-highlighting zsh-autosuggestions):g' ~/.zshrc




# Zinit not working as expected, resorted to zsh plugins
# MezPrint "Installing Zinit"
# sh -c "$(curl -fsSL https://git.io/zinit-install)" -yy  # Prompted
# MezPrint "Adding plugins to Zinit"
# echo "zinit light zsh-users/zsh-autosuggestions"
# echo "zinit light zsh-users/zsh-autosuggestions" >> ~/.zshrc
# echo "zinit light zsh-users/zsh-completions"
# echo "zinit light zsh-users/zsh-completions" >> ~/.zshrc
# echo "zinit light zdharma-continuum/fast-syntax-highlighting"
# echo "zinit light zdharma-continuum/fast-syntax-highlighting" >> ~/.zshrc
#MezPrint "Installing MezConfigs for zsh"
#wget https://raw.githubusercontent.com/PaulMez/mezfigs/master/Ubuntu/.zshrc // Only if using my config?!?!?
#may not overwrite?


MezPrint "Installing powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
# echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

#MezPrint "Swapping Oh My Zsh theme to powerlevel10k"

#sed -i 's/ZSH_THEME="gnzh"/ZSH_THEME="powerlevel10k/powerlevel10k"/g' ~/.zshrc
sed -i 's:robbyrussell:powerlevel10k/powerlevel10k:g' ~/.zshrc

MezPrint "---------------Completed---------------"
chsh -s $(which zsh)
zsh
p10k configure


# ???chsh -s $(which zsh)????


# # Reset
# Color_Off='\033[0m'       # Text Reset

# # Regular Colors
# Black='\033[0;30m'        # Black
# Red='\033[0;31m'          # Red
# Green='\033[0;32m'        # Green
# Yellow='\033[0;33m'       # Yellow
# Blue='\033[0;34m'         # Blue
# Purple='\033[0;35m'       # Purple
# Cyan='\033[0;36m'         # Cyan
# White='\033[0;37m'        # White

# # Bold
# BBlack='\033[1;30m'       # Black
# BRed='\033[1;31m'         # Red
# BGreen='\033[1;32m'       # Green
# BYellow='\033[1;33m'      # Yellow
# BBlue='\033[1;34m'        # Blue
# BPurple='\033[1;35m'      # Purple
# BCyan='\033[1;36m'        # Cyan
# BWhite='\033[1;37m'       # White

# # Underline
# UBlack='\033[4;30m'       # Black
# URed='\033[4;31m'         # Red
# UGreen='\033[4;32m'       # Green
# UYellow='\033[4;33m'      # Yellow
# UBlue='\033[4;34m'        # Blue
# UPurple='\033[4;35m'      # Purple
# UCyan='\033[4;36m'        # Cyan
# UWhite='\033[4;37m'       # White

# # Background
# On_Black='\033[40m'       # Black
# On_Red='\033[41m'         # Red
# On_Green='\033[42m'       # Green
# On_Yellow='\033[43m'      # Yellow
# On_Blue='\033[44m'        # Blue
# On_Purple='\033[45m'      # Purple
# On_Cyan='\033[46m'        # Cyan
# On_White='\033[47m'       # White

# # High Intensity
# IBlack='\033[0;90m'       # Black
# IRed='\033[0;91m'         # Red
# IGreen='\033[0;92m'       # Green
# IYellow='\033[0;93m'      # Yellow
# IBlue='\033[0;94m'        # Blue
# IPurple='\033[0;95m'      # Purple
# ICyan='\033[0;96m'        # Cyan
# IWhite='\033[0;97m'       # White

# # Bold High Intensity
# BIBlack='\033[1;90m'      # Black
# BIRed='\033[1;91m'        # Red
# BIGreen='\033[1;92m'      # Green
# BIYellow='\033[1;93m'     # Yellow
# BIBlue='\033[1;94m'       # Blue
# BIPurple='\033[1;95m'     # Purple
# BICyan='\033[1;96m'       # Cyan
# BIWhite='\033[1;97m'      # White

# # High Intensity backgrounds
# On_IBlack='\033[0;100m'   # Black
# On_IRed='\033[0;101m'     # Red
# On_IGreen='\033[0;102m'   # Green
# On_IYellow='\033[0;103m'  # Yellow
# On_IBlue='\033[0;104m'    # Blue
# On_IPurple='\033[0;105m'  # Purple
# On_ICyan='\033[0;106m'    # Cyan
# On_IWhite='\033[0;107m'   # White