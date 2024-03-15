 #!/bin/sh
echo "Setting up flatpak"
yay -S --noconfirm --needed flatpak
echo "$(flatpak list --app --columns application | sort -u < $packages/flatpak.txt)" > $packages/flatpak.txt
flatpak install $(cat $packages/flatpak.txt)
