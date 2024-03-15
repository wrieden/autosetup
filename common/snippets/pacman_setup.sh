 #!/bin/sh
echo "Setting up pacman"

sudo pacman -Syu --noconfirm

if [[ ! $(command -v yay) ]]; then
  if [[ $(pacman -Ss ^yay$) ]]; then
    sudo pacman -S --noconfirm --needed yay
  else
    sudo pacman -S --noconfirm --needed base-devel git glibc gcc gcc-libs fakeroot linux-api-headers libarchive
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si --noconfirm --needed
    cd ..
    rm -rf yay-bin
  fi
fi
