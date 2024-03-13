source $(dirname $0)/../common/snippets/env_setup.sh
source $snippets/pacman_setup.sh
yay -S --noconfirm --needed paclog
yay -S --noconfirm --needed $packages/pacman.txt

source $snippets/git_setup.sh
source $snippets/zsh_setup.sh
source $snippets/python_setup.sh
source $snippets/pyocd_setup.sh
source $snippets/code_setup.sh


ln -sf $configs/code-flags.conf ~/.config/code-flags.conf
ln -sf $configs/chromium-flags.conf ~/.config/chromium-flags.conf
gsettings set org.gnome.desktop.interface cursor-size 12

#udev
sudo groupadd usb
sudo usermod -a -G usb $USER
echo '''SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", GROUP="usb", MODE="0666"''' | sudo tee -a /etc/udev/rules.d/50-usb.rules
