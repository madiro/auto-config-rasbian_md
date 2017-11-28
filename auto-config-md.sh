#! /bin/bash

function aliaTerminal() {
	no_duplicates=`grep -c "0x4004" /home/$USER/.bashrc`
echo "entra en la funcion alias"
	if [ "$no_duplicates" -eq "0" ]; then
        	echo "
	        #Alias 0x4004
	        alias apagar='sudo shutdown -h now'
	        alias reiniciar='sudo shutdown -r now'
	        alias instalar='sudo apt-get update && sudo apt-get install'
	        alias actualizar='sudo apt-get update && sudo apt-get upgrade && sudo a$
	        alias buscar='apt-cache search'
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
echo -n "¿Desea ingresar alias?[y/n]"
read aliax
echo -n "¿Desea poner un fondo de pantalla negro solido?[y/n]"
read fondo
echo -n "¿Desea cambiar el tamaño de pantalla a HDMI 1920x1080?[y/n]"
read size
echo -n "(Recomendado)¿Desea reiniciar automaticamente despues de aplicar los cambios?[y/n]"
read reset
if [ "$aliax" = "y" ]; then
	# bash sources/scriptaliasrpi.sh
	aliaTerminal
fi

if [ "$fondo" = "y" ]; then
	#bash sources/scriptbackground.sh
	fondoPantalla
fi

if [ "$size" = "y" ]; then
	#bash sources/scriptscreensize.sh
 	resolucionPantalla
fi

if [ "$aliax" == "y" -o "$fondo" == "y" -o "$size" -o "y" ] ; then
  if [[ "$reset" = "y" ]] ; then
    shutdown -r now
  fi
else
  echo "No se ha aplicado ningun cambio, no es necesario reiniciar"
fi


