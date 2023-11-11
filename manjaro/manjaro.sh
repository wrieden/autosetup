sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm yay

# anchor pkg, marks install date
yay -S --noconfirm --needed paclog

# git
yay -S --noconfirm --needed git
git config --global user.name wrieden
git config --global user.email 6313163+wrieden@users.noreply.github.com

# zsh + goodies
yay -S --noconfirm --needed zsh ttf-meslo-nerd-font-powerlevel10k
sudo chsh -s $(which zsh) $USER

rm -rf ~/.oh-my-zsh
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
curl -fsSL https://raw.githubusercontent.com/wrieden/autosetup/main/manjaro/.zshrc > ~/.zshrc
curl -fsSL https://raw.githubusercontent.com/wrieden/autosetup/main/manjaro/.p10k.zsh > ~/.p10k.zsh

# packages
yay -S --noconfirm --needed $(curl -fsSL https://raw.githubusercontent.com/wrieden/autosetup/main/manjaro/packages.txt)

# python
yay -S --noconfirm --needed python python-pip
rm -rf ~/.python-venv
python -m venv ~/.python-venv
source ~/.python-venv/bin/activate
pip install $(curl -fsSL https://raw.githubusercontent.com/wrieden/autosetup/main/manjaro/pip-packages.txt)
