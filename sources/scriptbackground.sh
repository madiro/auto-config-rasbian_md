#! /bin/bash
sed -i 's/wallpaper_mode=.*/wallpaper_mode=color/'   /home/$USER/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
var1=$?
sed -i 's/desktop_bg=#.*/desktop_bg=#000000000000/' /home/$USER/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
var2=$?
let var3=$var1+$var2
if [ "$var3" -eq 0 ]; then
	echo "[ OK ] Fondo de pantalla"
else
	echo "[FAIL] Fondo de pantalla"
fi
