#setup layout

source $(dirname $0)/../common/snippets/env_setup.sh

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


source $snippets/flatpak_setup.sh
source $snippets/git_setup.sh
source $snippets/zsh_setup.sh
source $snippets/python_setup.sh
source $snippets/pyocd_setup.sh
source $snippets/code_setup.sh


ln -sf $configs/chromium-flags.conf ~/.config/chromium-flags.conf

