#!/bin/bash
set -e
# -p 옵션을 사용해야 질문 메시지를 출력하고 입력을 받을 수 있습니다.
read -p "This script will install KDE on your device. Continue? (y/n): " answer

if [ "$answer" == "y" ]; then
    sudo apt update
    # sddm은 kde-full에 포함되어 있지만 명시해도 무방합니다.
    sudo apt install -y kde-full sddm language-pack-ko fonts-nanum* fontconfig sddm-theme-breeze fcitx5 fcitx5-hangul firefox 
    
    # sddm을 기본 서비스로 설정하고 즉시 실행
    sudo systemctl enable --now sddm
    
    echo """KDE installation complete. Please reboot if the screen doesn't switch.
    type this command to /etc/environment
    GTK_IM_MODULE=fcitx
    QT_IM_MODULE=fcitx
    XMODIFIERS=@im=fcitx

"""

elif [ "$answer" == "n" ]; then
    echo "Installation cancelled. Bye!"

else
    echo "Invalid input. You can only type y or n."
fi
