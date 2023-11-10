sudo pacman -Syu
sudo pacman -S --noconfirm yay

yay -S --noconfirm zsh ttf-meslo-nerd-font-powerlevel10k
sudo chsh -s $(which zsh) $USER
rm -rf ~/.oh-my-zsh

git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i 's\ZSH_THEME="robbyrussell"\ZSH_THEME="powerlevel10k/powerlevel10k"\g' ~/.zshrc

