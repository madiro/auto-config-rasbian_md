#! /bin/bash

sudo sed -i 's/.*dmi_force_hotplug=.*/hdmi_force_hotplug=1/' /boot/config.txt
sudo sed -i 's/.*dmi_group=.*/hdmi_group=2/' /boot/config.txt
sudo sed -i 's/.*dmi_mode=.*/hdmi_mode=82/' /boot/config.txt
echo "[ OK ] Cambio de resolucion de pantalla"
