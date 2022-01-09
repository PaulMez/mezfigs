# sh -c "$(curl -fsSL https://raw.githubusercontent.com/PaulMez/mezfigs/master/MezInstall.sh)" 

sudo apt-get update -yy
sudo apt-get upgrade -yy

sudo apt install wget -yy
sudo apt install zsh -yy
sudo apt install curl -yy
sudo apt install git -yy

sudo apt install unzip -yy
sudo apt install fontconfig -yy

sudo apt install screenfetch -yy

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -yy



sh -c "$(curl -fsSL https://git.io/zinit-install)"

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

