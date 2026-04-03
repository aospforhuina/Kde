#!/bin/bash 

set -e

pack="kde-standard konsole  firefox fcitx5 fcitx5-hangul sddm ssh sddm-theme-breeze fcitx5-configtool im-config" 

sudo apt install $pack -y

sudo systemctl enable --now sddm ssh 
im-config -n fcitx5

echo "pls set this Variable on ur /etc/environment/
XMODIFIERS=@im=fcitx
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx "




