sudo pacman -Syu
sudo pacman -S --noconfirm yay

# git
yay -S --noconfirm git
git config --global user.name wrieden
git config --global user.email 6313163+wrieden@users.noreply.github.com

# zsh + goodies
yay -S --noconfirm zsh ttf-meslo-nerd-font-powerlevel10k
sudo chsh -s $(which zsh) $USER
rm -rf ~/.oh-my-zsh

git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
curl -fsSL https://raw.githubusercontent.com/wrieden/autosetup/main/manjaro/.zshrc > ~/.zshrc
curl -fsSL https://raw.githubusercontent.com/wrieden/autosetup/main/manjaro/.p10k.zsh > ~/.p10k.zsh

# essentials terminal
yay -S --noconfirm nano htop screen 

# essentials gui
yay -S --noconfirm gedit gparted


# python
yay -S --noconfirm python python-pip
python -m venv ~/.python-venv
source ~/.python-venv/bin/activate
pip install -r $(curl -fsSL https://raw.githubusercontent.com/wrieden/autosetup/main/manjaro/pip-packages.txt)


yay -S --noconfirm code code-marketplace
