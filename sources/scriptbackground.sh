#! /bin/bash
sudo sed -i 's/wallpaper_mode=.*/wallpaper_mode=color/'   /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
sudo sed -i 's/desktop_bg=#.*/desktop_bg=#000000000000/' /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo "[ OK ] Fondo de pantalla"
