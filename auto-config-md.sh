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
		echo -e "[ \e[1;32mOK\e[0m ] Terminal personalizado"
	else
		echo -e "[ \e[1;31mFAIL\e[0m ] Terminal personalizado"
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
function actualizarSistema() {
	sudo apt-get update
	aux1=$?
	sudo apt-get -y upgrade -qq
	aux2=$?
	sudo apt-get autoclean
	aux3=$?
	sudo apt-get -y autoremove -qq
	aux4=$?
	sudo rpi-update
	aux5=$?
	
	let aux=$aux1+$aux2+$aux3+$aux4+$aux5
	if [ "$aux" -eq 0 ]; then
		echo -e "[ \e[1;32mOK\e[0m ] Actualizacion del sistema"
	else
		echo -e "[ \e[1;31mFAIL\e[0m ] Actualizacion del sistema"
	fi
}
function cambiarIdioma() {
	sudo sed -i 's/country=.*/country=ES/' /etc/wpa_supplicant/wpa_supplicant.conf
	aux1=$?
	sudo dpkg-reconfigure locales
	aux2=$?
	let aux=$aux1+$aux2
	if [ "$aux" -eq 0 ]; then
		echo -e "[ \e[1;32mOK\e[0m ] Ajustes español-España"
	else
		echo -e "[ \e[1;31mFAIL\e[0m ] Ajuste español-España"
	fi
}
function interfacePermanente() {
	echo "
	RPI3 USB OPTION:1 
	+---------------+ 
	| wlan1 | wlan2 | 
	+---------------+ 
	| wlan3 | wlan4 | 
	+---------------+ 
	"
	usb1="wlan1"
	usb2="wlan2"
	usb3="wlan3"
	usb4="wlan4"


	if [ -f /etc/udev/rules.d/72-wlan-geo-dependent.rules ]; then
		echo -n "El fichero ya existe, compruebe manualmente la configuración existente"	
	else
		sudo touch /etc/udev/rules.d/72-wlan-geo-dependent.rules
		echo "
			ACTION==\"add\", SUBSYSTEM==\"net\", SUBSYSTEMS==\"sdio\", KERNELS==\"mmc1:0001:1\", NAME=\"wlan0\"
			ACTION==\"add\", SUBSYSTEM==\"net\", SUBSYSTEMS==\"usb\", KERNELS==\"1-1.2\", NAME=\"$usb1\"
			ACTION==\"add\", SUBSYSTEM==\"net\", SUBSYSTEMS==\"usb\", KERNELS==\"1-1.4\", NAME=\"$usb2\"
			ACTION==\"add\", SUBSYSTEM==\"net\", SUBSYSTEMS==\"usb\", KERNELS==\"1-1.3\", NAME=\"$usb3\"
			ACTION==\"add\", SUBSYSTEM==\"net\", SUBSYSTEMS==\"usb\", KERNELS==\"1-1.5\", NAME=\"$usb4\"
			" | sudo tee -a /etc/udev/rules.d/72-wlan-geo-dependent.rules
			if [ "$?" -eq "0" ]; then
				echo -e "[ \e[1;32mOK\e[0m ] Renombres interfaces"
				echo "Reinicie para que los cambios tengan efecto"
			else
				echo -e "[ \e[1;31mFAIL\e[0m ] Renombres interfaces"
			fi

	fi

	
}


function estaticaIP() {
	echo "-------STATIC IP-------\n"
	echo "Inserte SSID de la red"
	read ssidd
	echo "Inserte la IP que desea asignar (ej:192.168.1.125)"
	read ipp
	echo "Inserte la puerta de enlace (ej:192.168.1.1)"
	read puertaEnlace
	echo "Inserte DNS1 (ej:8.8.8.8)"
	read dns1
	echo "Inserte DNS2 (ej:8.8.4.4)"
	read dns2
	aux=`sudo grep -c "SSID"`
	check=-1
	if [ "aux" -eq 0]; then
		echo "
		\rSSID $ssidd
		\rinform $ipp
		\rstatic routers=$puertaEnlace
		\rstatic domain_name_servers=$dns1
		\rstatic domain_search=$dns2" | sudo tee -a /etc/dhcpcd.conf
		check=$?
	else
		sed -i 's/SSID.*/SSID $ssidd/' /etc/dhcpcd.conf
		sed -i 's/inform.*/inform $ipp/' /etc/dhcpcd.conf
		sed -i 's/static routers.*/static routers=$puertaEnlace/' /etc/dhcpcd.conf
		sed -i 's/static domain_name_servers.*/static_domain_servers=$dns1/' /etc/dhcpcd.conf
		sed -i 's/static domain_search.*/static domain_search=$dns2/' /etc/dhcpcd.conf
		check=$
	fi
	if [ "$check" -eq 0 ]; then
	       echo -e "[ \e[1;32mOK\e[0m ] Añadir IP statica"
	else
	       echo -e "[ \e[1;31mFAIL\e[0m ] Añadir IP statica"
	fi
	
}
function contraseña() {
	sudo passwd $USER
}
function aliaTerminal() {
	no_duplicates=`grep -c "0x4004" /home/$USER/.bashrc`
	if [ "$no_duplicates" -eq "0" ]; then
        	echo "
	        #Alias 0x4004
	        alias apagar='sudo shutdown -h now'
	        alias reiniciar='sudo shutdown -r now'
	        alias instalar='sudo apt-get update && sudo apt-get install'
	        alias actualizar='sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get autoclean && sudo apt-get -y autoremove'
	        alias buscar='apt-cache search'
		alias borrar='rm'
		alias borrarr='rm -rf'
	        alias desinstalar='sudo apt-get purge'" | tee -a /home/$USER/.bashrc
		aux1=$?
		source /home/$USER/.bashrc
		aux2=$?
		let aux=$aux1+$aux2
	        if [ "$aux" -eq 0 ]; then
	               echo -e "[ \e[1;32mOK\e[0m ] Registro de alias .bashrc"
        	else
	               echo -e "[ \e[1;31mFAIL\e[0m ] Registro de alias .bashrc"
	        fi
	else
	       echo -e "[ \e[1;32mOK\e[0m ] Los alias ya estaban registrados, saltando paso"
	fi
}
function fuenteDesktop() {
	echo -n "Creando copia de seguridad Desktop..."
	cp /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf.backup
	aux1=$?
	cp /home/pi/.config/lxsession/LXDE-pi/desktop.conf /home/pi/.config/lxsession/LXDE-pi/desktop.conf.backup
	aux2=$?
	let aux=$aux1+$aux2
	if [ "$aux" -eq 0 ]; then
		echo "OK"
	else
		echo "FAIL"
		echo "Omitiendo paso"
		return
	fi
	sed -i 's/desktop_font=.*/desktop_font=Droid Sans Fallback 17/' /home/$USER/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
	sed -i 's/FontName=.*/FontName=Droid Sans Fallback 17/' /home/$USER/.config/lxsession/LXDE-pi/desktop.conf
	
}
function fondoPantalla() {
	sed -i 's/wallpaper_mode=.*/wallpaper_mode=color/'   /home/$USER/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
	var1=$?
	sed -i 's/desktop_bg=#.*/desktop_bg=#000000000000/' /home/$USER/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
	var2=$?

	let var3=$var1+$var2

	if [ "$var3" -eq 0 ]; then
		echo -e "[ \e[1;32mOK\e[0m ] Fondo de pantalla"
	else
		echo -e "[ \e[1;31mFAIL\e[0m ] Fondo de pantalla"
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
		echo -e "[ \e[1;32mOK\e[0m ] Cambio de resolucion de pantalla"
		echo -n "Eliminando copia de seguridad..."
		sudo rm /boot/config.txt.backup
		if [[ "$?" -eq 0 ]]; then
				echo "OK"
		else
				echo "ERROR"
		fi
	else
		echo -e "[ \e[1;31mFAIL\e[0m ] Error al cambiar la resolucion de pantalla"
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
function chrome() {
	echo -n "Instalando Google Chrome"
	wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome64.deb
	sudo dpkg -i chrome64.deb
	if [[ "$?" -eq 0 ]]; then
		echo -e "[ \e[1;32mOK\e[0m ] Instalado Google-Chomre"
	else
		echo -e "[ \e[1;31mFAIL\e[0m ] Instalado Google-Chomre"
	fi
}
function notepadd() {
	echo -n "Instalando Notepadd"
	sudo add-apt-repository -y ppa:notepadqq-team/notepadqq
	sudo apt-get update -qq
	sudo apt-get install -qq -y notepadqq

	if [[ "$?" -eq 0 ]]; then
		echo -e "[ \e[1;32mOK\e[0m ] Instalado Notepadd"
	else
		echo -e "[ \e[1;31mFAIL\e[0m ] Instalado Notepadd"
	fi
}
function overlock() {
	echo -n " \e[1;31mAPLICANDO CONFIGURACION OVERLOCK\e[0m "
	sudo sed -i 's/.*rm_freq=.*/#arm_freq=/' /boot/config.txt
	sudo sed -i 's/.*ver_voltage=.*/#over_voltage=/' /boot/config.txt
	sudo sed -i 's/.*pu_freq=.*/#gpu_freq=/' /boot/config.txt
	sudo sed -i 's/.*dram_freq=.*/#sdram_freq=/' /boot/config.txt
	sudo sed -i 's/.*dram_schmoo=.*/#sdram_schmoo=/' /boot/config.txt
	sudo sed -i 's/.*ver_voltage_sdram_p.*/#over_voltage_sdram_p=/' /boot/config.txt
	sudo sed -i 's/.*ver_voltage_sdram_i.*/#over_voltage_sdram_i=/' /boot/config.txt
	sudo sed -i 's/.*ver_voltage_sdram_c.*/#over_voltage_sdram_c=/' /boot/config.txt


	echo "arm_freq=1372
over_voltage=5
gpu_freq=588

sdram_freq=588
sdram_schmoo=0x02000020
over_voltage_sdram_p=6
over_voltage_sdram_i=4
over_voltage_sdram_c=4" | tee -a /boot/config.txt
	if [[ "$?" -eq 0 ]]; then
		echo -e "[ \e[1;32mOK\e[0m ] Aplicado OVERLOCK"
	else
		echo -e "[ \e[1;31mFAIL\e[0m ] Error al aplicar OVERLOCK, por favor, revise /boot/config.txt"
	fi

}

echo -n "¿Desea adaptar raspbian español-España?[y/n]"
read idioma
echo -n "¿Deseacambiar la contraseña del usuario $USER?[y/n]"
read modpass
#echo -n "¿Desea poner una IP local estatica?[y/n]"
#read staticIP
echo -n "¿Desea renombrar de forma permanente las interfaces wifi (puertos USB)?[y/n]"
read renombrar
echo -n "¿Desea actualizar todo el sistema?[y/n]"
read actualizar
echo -n "¿Desea cambiar el aspecto de la consola?[y/n]"
read custom
echo -n "¿Des[y/n]ea instalar Chrome?"
read chrome
echo -n "¿Desea instalar Notepad++?[y/n]"
read notepadd
echo -n "¿Desea aplicar overlock: 1372 | 500 | 500 | 500 | 5 ?[y/n]"
read overlock
echo -n "¿Desea aumentar el tamaño de la fuente Desktop?[y/n]"
read sizeDesktop 
echo -n "¿Desea ingresar alias?[y/n]"
read aliax
echo -n "¿Desea poner un fondo de pantalla negro solido?[y/n]"
read fondo
echo -n "¿Desea cambiar el tamaño de pantalla a HDMI 1920x1080?[y/n]"
read size
echo -n "(Recomendado)¿Desea reiniciar automaticamente despues de aplicar los cambios?[y/n]"
read reset


# Script que requieren atención 
if [ "$idioma" = "y" ]; then
	cambiarIdioma
fi
if [ "$modpass" = "y" ]; then
	contraseña
fi
if [ "$staticIP" = "y" ];then
	#estaticaIP
	echo "metodo en construccion :S"
fi



# Script automatizados
if [ "$renombrar" = "y" ];then
	interfacePermanente
fi
if [ "$aliax" = "y" ]; then
	aliaTerminal
fi
if [ "$sizeDesktop" = "y" ]; then
	fuenteDesktop
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
if [ "$actualizar" = "y" ]; then
	actualizarSistema
	kernelUpdate
fi
if [ "$chrome" ]; then
	chrome
fi
if [ "$notepadd" ]; then
	notepadd
fi
if [ "$overlock" ]; then
	overlock
fi

if [ "$overlock" == "y" -o "$aliax" == "y" -o "$fondo" == "y" -o "$size" == "y" -o "$custom" = "y" -o "$sizeDesktop" = "y" -o "$kernelup" = "y" -o  "$actualizar" = "y" ] ; then
  if [[ "$reset" = "y" ]] ; then
    shutdown -r now
  fi
else
  echo "No se ha aplicado ningun cambio, no es necesario reiniciar"
fi

