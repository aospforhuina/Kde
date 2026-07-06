#!/bin/bash
set -eu
read -p "This script will install hyprland and Fcitx5 on this device. Do you want to continue? (y/n): " answer

if [ "$answer" == "y" ]; then
    # 1. 시스템 업데이트 및 필수 패키지 설치
    sudo pacman -Syu --noconfirm \
    sddm \
    networkmanager waybar hyprland rofi-wayland bluez bluez-util \
    pipewire pipewire-pulse pipewire-alsa wireplumber \
    fcitx5 fcitx5-im fcitx5-hangul fcitx5-configtool fcitx5-gtk fcitx5-qt \
    noto-fonts noto-fonts-cjk noto-fonts-emoji \
    unzip p7zip unrar firefox git base-devel nano && \
    kitty pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber bluez bluez-utils blueman brightnessctl grim slurp wl-clipboard pavucontrol && \
    sudo systemctl enable --now sddm && \
    sudo systemctl enable --now NetworkManager && \
    sudo systemctl enable --now bluetooth && \
    
    mkdir -p ~/.config/hypr
    echo "monitor=HDMI-A-1,1920x1080@60,0x0,1" > ~/.config/hypr/hyprland.conf

    echo """done! u can add hangul in fcitx5 and u need to apply virtual keyboard setup(fcitx) too
    you need to add system variable to /etc/enviroment copy variable to below.
    GTK_IM_MODULE=fcitx
    QT_IM_MODULE=fcitx
    XMODIFIERS=@im=fcitx
    QT_QPA_PLATFORM=wayland
    ELECTRON_OZONE_PLATFORM_HINT=wayland"""
    
    cd /tmp 
    git clone https://aur.archlinux.org/yay.git 
    cd yay 
    makepkg -si --noconfirm 
    yay -S --noconfirm otf-pretendard  

    reboot

elif [ "$answer" == "n" ]; then
    echo "bye"
else
    echo "you can type only y/n"
    exit 1
fi

exit 0
