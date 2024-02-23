#setup layout

source $(dirname $0)/../common/snippets/env_setup.sh

[[ $(passwd -S | grep " P ") ]] || passwd
sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate archlinux holo

source $snippets/pacman_setup.sh
source $snippets/flatpak_setup.sh
source $snippets/git_setup.sh
source $snippets/zsh_setup.sh
source $snippets/python_setup.sh
source $snippets/pyocd_setup.sh
source $snippets/code_setup.sh


ln -sf $configs/chromium-flags.conf ~/.config/chromium-flags.conf

#curl https://raw.githubusercontent.com/CryoByte33/steam-deck-utilities/main/install.sh | bash -s --
#curl -L https://github.com/SteamDeckHomebrew/decky-installer/releases/latest/download/install_release.sh | sh
curl -L https://raw.githubusercontent.com/dragoonDorise/EmuDeck/main/install.sh | bash

cd $prevdir
