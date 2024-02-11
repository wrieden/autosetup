emulation_dir=/home/deck/Emulation
emulationstation_dir=/home/deck/.emulationstation
linked_dir=/var/mnt/sdcard/emulation

rm -rfv $emulation_dir/roms $emulation_dir/bios $emulation_dir/saves
rm -rfv $emulationstation_dir/gamelists $emulation_dir/tools/downloaded_media

ln -sv $linked_dir/roms/  -T $emulation_dir/roms
ln -sv $linked_dir/bios/  -T $emulation_dir/bios
ln -sv $linked_dir/saves/ -T $emulation_dir/saves
ln -sv $linked_dir/roms/  -T $emulationstation_dir/gamelists
ln -sv $linked_dir/roms/  -T $emulation_dir/tools/downloaded_media
