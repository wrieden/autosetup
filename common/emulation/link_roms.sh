cd roms/local
find . -type d | xargs -rn1 -I{} mkdir -p ../combined/{}
cd ../combined
find $(readlink -f ../local) -type f | sed -En 's/.*\/roms\/local\/(.*)/"\0" "\1"/p' | xargs -rn2 ln -sf

cd ~/Emulation/roms
find $(readlink -f ~/git/autosetup/common/emulation/roms/combined) -type l | sed -En 's/.*\/roms\/combined\/(.*)/"\0" "\1"/p' | xargs -rn2 ln -sf