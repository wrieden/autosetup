#setup layout
repourl=https://raw.githubusercontent.com/wrieden/autosetup/main/manjaro

passwd

sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate archlinux holo
sudo pacman -Syyu --noconfirm


#install yay
sudo pacman -Sy base-devel git glibc gcc gcc-libs fakeroot linux-api-headers libarchive --noconfirm --needed
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd ..
rm -rf yay-bin


# zsh + goodies
yay -S --noconfirm --needed zsh ttf-meslo-nerd-font-powerlevel10k
sudo chsh -s $(which zsh) $USER

rm -rf ~/.oh-my-zsh
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
curl -fsSL $repourl/.zshrc > ~/.zshrc
curl -fsSL $repourl/.p10k.zsh > ~/.p10k.zsh




