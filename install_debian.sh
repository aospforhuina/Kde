#!/bin/bash 

set -e

pack="kde-standard konsole  firefox fcitx5 fcitx5-hangul sddm ssh sddm-theme-breeze fcitx5-configtool im-config" 

sudo apt install $pack -y

sudo systemctl enable --now sddm ssh 

mkdir -p ~/.config/autostart && cp /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart
echo "pls set this Variable on ur /etc/environment/
XMODIFIERS=@im=fcitx
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx "




