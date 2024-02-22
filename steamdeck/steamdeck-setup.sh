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

cd $prevdir
