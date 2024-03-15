#!/bin/sh
echo "Setting up sdcard mount"
uuid=$(lsblk -o kname,uuid | sed -En 's/^\w*mmc\w*\s+(\w+)$/\1/p')
sudo sed -i '/UUID=.*\/mnt\/sdcard/d' /etc/fstab
echo '''UUID=046D53B628103DBC /mnt/sdcard lowntfs-3g uid=1000,gid=1000,rw,noatime,user,exec,umask=000,nofail 0 0''' | sudo tee -a /etc/fstab
