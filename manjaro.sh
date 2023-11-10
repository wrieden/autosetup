sudo pacman -Syu
sudo pacman -S --noconfirm yay

touch $HOME/.zshrc
yay -S --noconfirm zsh 
sudo chsh -s $(which zsh) $USER

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

yay -S --noconfirm ttf-meslo-nerd-font-powerlevel10k

yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> $USER/.zshrc
