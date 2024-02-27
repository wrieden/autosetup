git submodule init
git submodule update

cd retool
python retool.py --update
python retool.py --update
cd ..

curl https://www.romvault.com/download/ROMVault_V3.6.4.zip -o romvault.zip
7z x -oromvault romvault.zip
cd romvault
rm ../romvault.zip *.xml *.Cache
ln -s ../RomVault3cfg.xml RomVault3cfg.xml
cp ../RomVault3_2.Cache RomVault3_2.Cache
cd ..

curl https://www.skraper.net/download/beta/Skraper-1.1.1.7z -o skraper.7z
7z x -oskraper skraper.7z
cd skraper
rm ../skraper.7z *.json
ln -s ../skraper.config.mono.json skraper.config.mono.json
cd ..

mkdir -p roms/combined
mkdir -p roms/local
mkdir -p roms/unsorted
mkdir -p media/local
mkdir -p bios