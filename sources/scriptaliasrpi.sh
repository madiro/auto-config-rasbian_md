no_duplicates=`grep -c "0x4004" /home/pi/.bashrc`

if [ "$no_duplicates" -eq "0" ]; then

	echo "
	#Alias 0x4004
	alias apagar='sudo shutdown -h now'
	alias reiniciar='sudo shutdown -r now'
	alias instalar='sudo apt-get update && sudo apt-get install'
	alias actualizar='sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoclean && sudo apt-get autoremove'
	alias buscar='apt-cache search'
	alias desinstalar='sudo apt-get purge'" | sudo tee -a /home/pi/.bashrc
	echo "[ OK ] Los alias se han insertado correctamente"

else

	echo "[ OK ] Los alias que intenta registrar ya estan disponibles"

fi
