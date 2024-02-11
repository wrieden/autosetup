# make pacman work...
sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate archlinux

#install yay
sudo pacman -Syyu base-devel git glibc gcc gcc-libs fakeroot linux-api-headers libarchive
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

#switching to zsh
chsh --shell /bin/zsh
touch ~/.zshrc
yay -S --noconfirm ttf-meslo-nerd-font-powerlevel10k zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
