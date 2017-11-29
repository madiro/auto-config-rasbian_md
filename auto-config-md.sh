#! /bin/bash
function customTerminal() {
cp /home/$USER/.config/lxterminal/lxterminal.conf /home/$USER/.config/lxterminal/lxterminal.conf.backup
sed -i 's/.*fontname=.*/fontname=Courier New 18/' /home/$USER/.config/lxterminal/lxterminal.conf
aux1=$?
sed -i 's/.*bgcolor=.*/bgcolor=#000000000000/' /home/$USER/.config/lxterminal/lxterminal.conf
aux2=$?
sed -i 's/.*bgalpha=.*/bgalpha=65535/' /home/$USER/.config/lxterminal/lxterminal.conf
aux3=$?
sed -i 's/.*fgcolor=.*/fgcolor=#d3d3d7d7cfcf/' /home/$USER/.config/lxterminal/lxterminal.conf
aux4=$?
sed -i 's/.*palette_color_0=.*/palette_color_0=#000000000000/' /home/$USER/.config/lxterminal/lxterminal.conf
aux5=$?
sed -i 's/.*palette_color_1=.*/palette_color_1=#cdcd00000000/' /home/$USER/.config/lxterminal/lxterminal.conf
aux6=$?
sed -i 's/.*palette_color_2=.*/palette_color_2=#4e4e9a9a0606/' /home/$USER/.config/lxterminal/lxterminal.conf
aux7=$?
sed -i 's/.*palette_color_3=.*/palette_color_3=#c4c4a0a00000/' /home/$USER/.config/lxterminal/lxterminal.conf
aux8=$?
sed -i 's/.*palette_color_4=.*/palette_color_4=#34346565a4a4/' /home/$USER/.config/lxterminal/lxterminal.conf
aux9=$?
sed -i 's/.*palette_color_5=.*/palette_color_5=#757550507b7b/' /home/$USER/.config/lxterminal/lxterminal.conf
aux10=$?
sed -i 's/.*palette_color_6=.*/palette_color_6=#060698989a9a/' /home/$USER/.config/lxterminal/lxterminal.conf
aux11=$?
sed -i 's/.*palette_color_7=.*/palette_color_7=#d3d3d7d7cfcf/' /home/$USER/.config/lxterminal/lxterminal.conf
aux12=$?
sed -i 's/.*palette_color_8=.*/palette_color_8=#555557575353/' /home/$USER/.config/lxterminal/lxterminal.conf
aux13=$?
sed -i 's/.*palette_color_9=.*/palette_color_9=#efef29292929/' /home/$USER/.config/lxterminal/lxterminal.conf
aux14=$?
sed -i 's/.*palette_color_10=.*/palette_color_10=#8a8ae2e23434/' /home/$USER/.config/lxterminal/lxterminal.conf
aux15=$?
sed -i 's/.*palette_color_11=.*/palette_color_11=#fcfce9e94f4f/' /home/$USER/.config/lxterminal/lxterminal.conf
aux16=$?
sed -i 's/.*palette_color_12=.*/palette_color_12=#72729f9fcfcf/' /home/$USER/.config/lxterminal/lxterminal.conf
aux17=$?
sed -i 's/.*palette_color_13=.*/palette_color_13=#adad7f7fa8a8/' /home/$USER/.config/lxterminal/lxterminal.conf
aux18=$?
sed -i 's/.*palette_color_14=.*/palette_color_14=#3434e2e2e2e2/' /home/$USER/.config/lxterminal/lxterminal.conf
aux19=$?
sed -i 's/.*palette_color_15=.*/palette_color_15=#eeeeeeeeecec/' /home/$USER/.config/lxterminal/lxterminal.conf
aux20=$?
sed -i 's/.*color_preset=.*/color_preset=Tango/' /home/$USER/.config/lxterminal/lxterminal.conf
aux21=$?

let aux=$aux1+$aux2+$aux3+$aux4+$aux5+$aux6+$aux7+$aux8+$aux9+$aux10+$aux11+$aux12+$aux13+$aux14+$aux15+$aux16+$aux17+$aux18+$aux19+$aux20+$aux21
if [ "$aux" -eq 0 ] ; then
	echo "[ OK ] Terminal personalizado"
else
	echo "[FAIL] Terminal personalizado"
	echo -n "Restaurando configuracion original..."
	mv /home/$USER/.config/lxterminal/lxterminal.conf /home/$USER/.config/lxterminal/lxterminal.conf.fail
	mov1=$?
	mv /home/$USER/.config/lxterminal/lxterminal.conf.backup /home/$USER/.config/lxterminal/lxterminal.conf
	mov2=$?
	let movT=$mov1+$mov2
	if [[ "$movT" -eq 0 ]]; then
		echo "OK"
	else
		echo "FAIL"
	fi
fi
}
function kernelUpdate() {
	sudo rpi-update
}
function actualizarSistema() {
	sudo apt-get update
	aux1=$?
	sudo apt-get -y upgrade
	aux2=$?
	sudo apt-get autoclean
	aux3=$?
	sudo apt-get -y autoremove
	aux4=$?
	let aux=$aux1+$aux2+$aux3+$aux4
	if [ "$aux" -eq 0 ]; then
		echo "[ OK ] Actualizacion del sistema"
	else
		echo "[FAIL] Actualizacion del sistema"
	fi
}

function aliaTerminal() {
	no_duplicates=`grep -c "0x4004" /home/$USER/.bashrc`
	if [ "$no_duplicates" -eq "0" ]; then
        	echo "
	        #Alias 0x4004
	        alias apagar='sudo shutdown -h now'
	        alias reiniciar='sudo shutdown -r now'
	        alias instalar='sudo apt-get update && sudo apt-get install'
	        alias actualizar='sudo apt-get update && sudo apt-get upgrade && sudo a$
	        alias buscar='apt-cache search'
		alias borrar='rm"
		alias borrarr='rm -rf'
		alias clonargithub='git clone https://github.com/'
	        alias desinstalar='sudo apt-get purge'" | tee -a /home/$USER/.bashrc
		
	        if [ "$?" -eq 0 ]; then
	                echo "[ OK ] Registro de alias .bashrc"
        	else
	                echo "[FAIL] Registro de alias .bashrc"
	        fi
	else
	        echo "[ OK ] Los alias ya estaban registrados, saltando paso"
	fi
}

function fondoPantalla() {
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

}

function resolucionPantalla() {
	echo -n "Creando copia de seguridad /boot/config.txt.backup..."
	sudo cp /boot/config.txt /boot/config.txt.backup
	if [ "$?" -eq 0 ]; then
	        echo "OK"
	else
	        echo "FAIL"
	        echo "No se ha podido crear copia de seguridad, ningun archivo ha sido modificado, terminando..."
	        exit
	fi
	sudo sed -i 's/.*dmi_force_hotplug=.*/hdmi_force_hotplug=1/' /boot/config.txt
	aux1=$?
	sudo sed -i 's/.*dmi_group=.*/hdmi_group=2/' /boot/config.txt
	aux2=$?
	sudo sed -i 's/.*dmi_mode=.*/hdmi_mode=82/' /boot/config.txt
	aux3=$?

	let aux4=$aux1+$aux2+$aux3
	if [ "$aux4" -eq 0 ]; then
        	echo "[ OK ] Cambio de resolucion de pantalla"
	        echo -n "Eliminando copia de seguridad..."
	        sudo rm /boot/config.txt.backup
        	if [[ "$?" -eq 0 ]]; then
                	echo "OK"
        	else
                	echo "ERROR"
        	fi
	else
        	echo "[FAIL] Error al cambiar la resolucion de pantalla"
	        echo -n "Restaurando el archivo original..."
		sudo rm /boot/config.txt
	        sudo cp /boot/config.txt.backup /boot/config.txt
        	if [[ "$?" -eq 0 ]]; then
	                echo "OK"
	        else
	                echo "ERROR"
        	        exit
	        fi
        	echo -n "Eliminando copia de seguridad..."
	        sudo rm /boot/config.txt.backup
	        if [[ "$?" -eq 0 ]]; then
	                echo "OK"
	        else
	                echo "ERROR"
	        fi
	fi
}
echo -n "¿Desea actualizar todo el sistema?[y/n]"
read actualizar
echo -n "¿Desea actualizar el kernel de Raspbian?[y/n]"
read kernelup
echo -n "¿Desea cambiar el aspecto de la consola?[y/n]"
read custom
echo -n "¿Desea ingresar alias?[y/n]"
read aliax
echo -n "¿Desea poner un fondo de pantalla negro solido?[y/n]"
read fondo
echo -n "¿Desea cambiar el tamaño de pantalla a HDMI 1920x1080?[y/n]"
read size
echo -n "(Recomendado)¿Desea reiniciar automaticamente despues de aplicar los cambios?[y/n]"
read reset
if [ "$actualizar" = "y" ]; then
	actualizarSistema
fi
if [ "$aliax" = "y" ]; then
	aliaTerminal
fi

if [ "$fondo" = "y" ]; then
	fondoPantalla
fi

if [ "$size" = "y" ]; then
 	resolucionPantalla
fi
if [ "$custom" = "y" ]; then
	customTerminal	
fi
if [ "$kernelup" = "y" ]; then
	kernelUpdate
fi
if [ "$aliax" == "y" -o "$fondo" == "y" -o "$size" == "y" -o "$custom" = "y" ] ; then
  if [[ "$reset" = "y" ]] ; then
    shutdown -r now
  fi
else
  echo "No se ha aplicado ningun cambio, no es necesario reiniciar"
fi


