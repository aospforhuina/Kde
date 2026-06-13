#!/bin/bash
set -eu
read -p "This script will install KDE, SDDM, and Fcitx5 on this device. Do you want to continue? (y/n): " answer

if [ "$answer" == "y" ]; then
    # 1. 시스템 업데이트 및 필수 패키지 설치
    sudo pacman -Syu --noconfirm \
    plasma-meta kde-applications-meta sddm \
    networkmanager plasma-nm bluez bluez-utils bluedevil plasma-pa \
    pipewire pipewire-pulse pipewire-alsa wireplumber \
    fcitx5 fcitx5-im fcitx5-hangul fcitx5-configtool fcitx5-gtk fcitx5-qt \
    mesa xf86-video-amdgpu vulkan-radeon xorg-xwayland \
    noto-fonts noto-fonts-cjk noto-fonts-emoji \
    unzip p7zip unrar firefox git base-devel nano && \
    sudo systemctl enable --now sddm && \
    sudo systemctl enable --now NetworkManager && \
    sudo systemctl enable --now bluetooth && \

    # 2. yay 설치 (이미 폴더가 있으면 에러 날 수 있으므로 /tmp에서 작업 권장)
    cd /tmp && \
    git clone https://aur.archlinux.org/yay.git && \
    cd yay && \
    makepkg -si --noconfirm && \
    yay -S --noconfirm otf-pretendard && \

    echo """done! u can add hangul in fcitx5 and u need to apply virtual keyboard setup(fcitx) too
    you need to add system variable to /etc/enviroment copy variable to below.
    GTK_IM_MODULE=fcitx
    QT_IM_MODULE=fcitx
    XMODIFIERS=@im=fcitx"""

elif [ "$answer" == "n" ]; then
    echo "bye"
else
    echo "you can type only y/n"
    exit 1
fi

exit 0
