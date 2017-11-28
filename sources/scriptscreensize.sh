#! /bin/bash
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
	if [ "$?" -eq 0 ]; then
                echo "OK"
        else
                echo "ERROR"
        fi

else
	echo "[FAIL] Error al cambiar la resolucion de pantalla"
	echo -n "Restaurando el archivo original..."
	sudo rm /boot/config.txt
	sudo cp /boot/config.txt.backup /boot/config.txt
	if [ "$?" -eq 0 ]; then
		echo "OK"
	else
		echo "ERROR"
		exit
	fi
	echo -n "Eliminando copia de seguridad..."
	sudo rm /boot/config.txt.backup
	if [ "$?" -eq 0 ]; then
		echo "OK"
	else
		echo "ERROR"
	fi
fi
