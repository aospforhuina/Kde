import subprocess
commands = "sudo pacman -Syyu && sudo pacman -S plasma-desktop openssh sddm openssh konsole firefox fcitx5 fcitx5-hangul sddm-kcm && sudo systemctl enable --now sddm && sudo systemctl enable --now sshd"
fcitx5 = "mkdir -p ~/.config/autostart && cp /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart"
font + "yay -S otf-pretendard"
yay = "sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si"
answer = input("this script will install these packages..\n " + commands + "do you wanna install? and will enable ssh too (y/n)" )

if answer.lower() in ['y']:
    subprocess.run(commands, shell=True, executable='/bin/bash')
    subprocess.run(fcitx, shell=True, executable='/bin/bash')
    subprocess.run(yay, shell=True, executable='/bin/bash')
    subprocess.run(font, shell=True, executable='/bin/bash')

elif answer.lower() in ['n']:
    print("bye..")

else: 
    print("wrong input! y/n")