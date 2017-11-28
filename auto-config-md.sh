#! /bin/bash
echo "¿Desea ingresar alias?[y/n]"
read aliax
echo "¿Desea poner un fondo de pantalla negro solido?[y/n]"
read fondo
echo "¿Desea cambiar el tamaño de pantalla a HDMI 1920x1080?[y/n]"
read size
echo "(Recomendado)¿Desea reiniciar automaticamente despues de aplicar los cambios?[y/n]"
read reset
if [ "$aliax" = "y" ]; then
  bash sources/scriptaliasrpi.sh
fi

if [ "$fondo" = "y" ]; then
  bash sources/scriptbackground.sh
fi

if [ "$size" = "y" ]; then
  bash sources/scriptscreensize.sh
fi

if [ "$aliax" == "y" -o "$fondo" == "y" -o "$size" -o "y" ] ; then
  if [[ "$reset" = "y" ]] ; then
    shutdown -r now
  fi
else
  echo "No se ha aplicado ningun cambio, no es necesario reiniciar"
fi
