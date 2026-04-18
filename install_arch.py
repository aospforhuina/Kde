import subprocess
commands = "sudo pacman -Syyu && sudo pacman -S plasma-desktop sddm plasma-wayland-session qt6-wayland konsole firefox sddm-kcm && sudo systemctl enable --now sddm"

answer = input("this script will install these packages..\n " + commands + "do you wanna install? (y/n)" )

if answer.lower() in ['y']:
    subprocess.run(commands, shell=True, executable='/bin/bash')


elif answer.lower() in ['n']:
    print("bye..")

else: 
    print("wrong input! y/n")