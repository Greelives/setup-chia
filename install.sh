#!/bin/bash


# Secure Chia server installer for Debian only.
# https://github.com/greelives/setup-chia
apt update
apt-get install --assume-yes wget
https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
dpkg --install chrome-remote-desktop_current_amd64.deb
apt install --assume-yes --fix-broken
DEBIAN_FRONTEND=noninteractive \
    apt install --assume-yes xfce4 desktop-base
bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
apt install --assume-yes xscreensaver
systemctl disable lightdm.service
usermod -a -G chrome-remote-desktop $USER
mkfs.ext4 -F /dev/nvme0n1
mkfs.ext4 -F /dev/sdb
mkdir /tmp1
mkdir /data1
mount /dev/nvme0n1 /tmp1
mount /dev/sdb /data1
chmod 777 /tmp1
chmod 777 /data1
mkfs.ext4 -F /dev/nvme0n2
mkdir /tmp2
mount /dev/nvme0n2 /tmp2
chmod 777 /tmp2
wget https://github.com/Chia-Network/chia-blockchain/releases/download/1.1.2/chia-blockchain_1.1.2_amd64.deb
sudo dpkg --install chia-blockchain_1.1.2_amd64.deb 
apt install --assume-yes --fix-broken
