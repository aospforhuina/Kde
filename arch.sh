sudo pacman -S --needed networkmanager plasma-nm p7zip unrar wget spectacle unzip zip bzip2 gzip lzop lrzip zstd ark xorg-server fctix5-configtool kvantum fcitx5-qt xorg-xauth plasma-x11-session fcitx5 fcitx5-gtk fcitx5-hangul bluez bluez-utils bluedevil pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber plasma-pa power-profiles-daemon plasma-firewall kde-cli-tools plasma-desktop ly dolphin konsole firefox kate && sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && sudo systemctl enable ly@tty2 bluetooth && yay -S ttf-pretendard && mkdir -p ~/.config/autostart && cp /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart 
: << 'COMMENT'
sudo nano /etc/environment 
XMODIFIERS=@im=fcitx
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx

sudo pacman -S base-devel linux-zen-headers git nano --needed
sudo nano /etc/pacman.conf
include multilib 
[multilib]
Include = /etc/pacman.d/mirrorlist

yay -Syu
yay -S nvidia-470xx-dkms nvidia-470xx-utils lib32-nvidia-470xx-utils nvidia-settings

sudo nano /etc/kernel/cmdline
add this nvidia-drm.modeset=1 nvidia-drm.fbdev=1 video=HDMI-A-1:1920x1080M@60

sudo nano /etc/mkinitcpio.conf
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
remove kms on hook
sudo mkinitcpio -P 

cd ~ && wget https://raw.githubusercontent.com/korvahannu/arch-nvidia-drivers-installation-guide/main/nvidia.hook
nano nvidia.hook
Target=nvidia-470xx-dkms
sudo mkdir -p /etc/pacman.d/hooks/ && sudo mv ./nvidia.hook /etc/pacman.d/hooks/
COMMENT
