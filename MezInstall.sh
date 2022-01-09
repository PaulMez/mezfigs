# sh -c "$(curl -fsSL https://raw.githubusercontent.com/PaulMez/mezfigs/master/MezInstall.sh)" 
RED='\033[0;31m'
NC='\033[0m' # No Color
printf "Testing ${RED}colour${NC} with printf\n"
echo "Testing ${RED}colour${NC} with echo\n"
echo "Installing Mez Configs.............\n"
echo "Installing Mez Configs.............\n"
echo "Installing Mez Configs.............\n"
echo "Installing Mez Configs.............\n"
echo "Updating and Upgrading.............\n"
sudo apt-get update -yy
sudo apt-get upgrade -yy
echo "Installing requirements.............\n"
echo "1. wget:\n"
sudo apt install wget -yy
echo "2. zsh:\n"
sudo apt install zsh -yy
sudo apt install curl -yy
sudo apt install git -yy
sudo apt install unzip -yy
sudo apt install fontconfig -yy

sudo apt install screenfetch -yy

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -yy



sh -c "$(curl -fsSL https://git.io/zinit-install)" -yy

#add to /.zshrc
echo "zinit light zsh-users/zsh-autosuggestions" >> /.zshrc
echo "zinit light zsh-users/zsh-completions" >> /.zshrc
echo "zinit light zdharma-continuum/fast-syntax-highlighting" >> /.zshrc

#Nerd Fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts
rm FiraCode.zip
fc-cache -fv

#wget https://raw.githubusercontent.com/PaulMez/mezfigs/master/Ubuntu/.zshrc // Only if using my config?!?!?
#may not overwrite?
# ???chsh -s $(which zsh)????

