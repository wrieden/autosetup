sudo pacman -Syu
sudo pacman -S --noconfirm yay

touch $HOME/.zshrc
yay -S --noconfirm zsh ttf-meslo-nerd-font-powerlevel10k
sudo chsh -s $(which zsh) $USER

git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
