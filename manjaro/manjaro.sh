repourl=https://raw.githubusercontent.com/wrieden/autosetup/main/manjaro

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm yay

# anchor pkg, marks install date
yay -S --noconfirm --needed paclog

# git
yay -S --noconfirm --needed git
mkdir ~/.ssh
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
pip install --upgrade pip
pip install $(curl -fsSL $repourl/pip-packages.txt)

# pyocd
pip install pyocd
pyocd pack install $(curl -fsSL $repourl/pyocd-packages.txt)
git clone https://github.com/pyocd/pyOCD.git
sudo cp pyOCD/udev/*.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && udevadm trigger
rm -rf pyOCD

# code
yay -S --noconfirm --needed code code-marketplace
echo $(curl -fsSL $repourl/code-packages.txt) | xargs -rn1 code --install-extension

#wsl stuff
ELECTRON_WAYLAND='''
--enable-features=UseOzonePlatform
--ozone-platform=wayland
'''
echo $ELECTRON_WAYLAND > ~/.config/chromium-flags.conf
echo $ELECTRON_WAYLAND > ~/.config/code-flags.conf
gsettings set org.gnome.desktop.interface cursor-size 12


