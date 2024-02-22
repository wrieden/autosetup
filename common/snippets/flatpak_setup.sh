 #!/bin/sh
echo "Setting up flatpak"
yay -S --noconfirm --needed flatpak
flatpak install $(cat $packages/flatpak.txt)
