git submodule init
git submodule update

cd retool
python retool.py --update
python retool.py --update
cd ..

curl https://www.romvault.com/download/ROMVault_V3.6.4.zip -o romvault.zip
7z x -oromvault romvault.zip
cd romvault
ln -sf ../dat/processed DatRoot
ln -sf ../roms/local RomRoot
ln -sf ../roms/unsorted ToSort
rm romvault.zip

curl https://www.skraper.net/download/beta/Skraper-1.1.1.7z -o skraper.7z
7z x -oskraper skraper.7z
rm skraper.7z

mkdir -p roms/combined
mkdir -p roms/local
mkdir -p roms/unsorted
mkdir -p bios