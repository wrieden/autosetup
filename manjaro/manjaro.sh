repourl=https://raw.githubusercontent.com/wrieden/autosetup/main/manjaro

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm yay

# anchor pkg, marks install date
yay -S --noconfirm --needed paclog

# git
yay -S --noconfirm --needed git
curl -fsSL $repourl/sshconfig > ~/.ssh/config
curl -fsSL $repourl/.gitconfig > ~/.gitconfig
curl -fsSL $repourl/.gitconfig-trinamic > ~/.gitconfig-trinamic

# zsh + goodies
yay -S --noconfirm --needed zsh ttf-meslo-nerd-font-powerlevel10k
sudo chsh -s $(which zsh) $USER

rm -rf ~/.oh-my-zsh
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
curl -fsSL $repourl/.zshrc > ~/.zshrc
curl -fsSL $repourl/.p10k.zsh > ~/.p10k.zsh

# packages
yay -S --noconfirm --needed $(curl -fsSL $repourl/packages.txt)

# python
yay -S --noconfirm --needed python python-pip
rm -rf ~/.python-venv
python -m venv ~/.python-venv
source ~/.python-venv/bin/activate
pip install $(curl -fsSL $repourl/pip-packages.txt)
