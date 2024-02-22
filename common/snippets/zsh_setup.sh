#!/bin/sh
echo "Setting up zsh"
yay -S --noconfirm --needed zsh ttf-meslo-nerd-font-powerlevel10k
sudo chsh -s $(which zsh) $USER
rm -rf ~/.oh-my-zsh
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ln -sf $configs/.p10k.zsh ~/.p10k.zsh
ln -sf $configs/.zshrc ~/.zshrc
