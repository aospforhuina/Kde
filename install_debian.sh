#!/bin/bash 

set -e

pack="kubuntu-desktop network-manager plasma-nm pipewire polkit-kde-agent-1 plasma-pa konsole dolphin plasma-systemmonitor btop gparted p7zip-full p7zip-rar rar unrar unzip zip bzip2 spectacle gwenview kcalc kfind firefox fcitx5 fcitx5-hangul sddm ssh sddm-theme-breeze kde-config-fcitx5 im-config bluez bluez-tools bluedevil pipewire-module-bluetooth"

sudo apt install $pack -y
sudo apt install -f
sudo systemctl enable --now sddm 
sudo systemctl enable --now ssh
sudo systemctl enable --now bluetooth
sudo systemctl set-default graphical.target
mkdir -p ~/.config/autostart && cp /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart
echo "pls set this Variable on ur /etc/environment/
XMODIFIERS=@im=fcitx
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx "




