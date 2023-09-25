#!/bin/bash

if [ $# != 1 ] ; then
	echo "La cantidad de parámetros no es la esperada"
	exit 1
fi

echo -n > $HOME/reporte.txt

for usuario in $(cat /etc/passwd | cut -d: -f 1,6) ; do
	nombre=$(echo $usuario | cut -d: -f1)
	directorio=$(echo $usuario | cut -d: -f2)
	if [ -d $directorio ] ; then
		cantidad=$(sudo find $directorio -type f -name "*.$1" -user $nombre | wc -l)
		echo "$nombre $cantidad" >> $HOME/reporte.txt
	fi
done
