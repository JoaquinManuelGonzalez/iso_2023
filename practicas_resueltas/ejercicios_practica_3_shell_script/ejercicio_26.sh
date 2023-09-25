#!/bin/bash

if [ $# -eq 0 ] ; then
	echo "No se puede ejecutar el script sin parámetros"
	exit 1
fi

rutas=($@)
cantidad_inexistente=0

for ((i=0; i < ${#rutas[*]}; i++)) ; do
	if ! [ -e ${rutas[$i]} ] ; then
		((cantidad_inexistente++))
	else
		if (( $i % 2 != 0 )) ; then
			if [ -f ${rutas[$i]} ] ; then
				echo "El tipo del objeto $i es: archivo"
			elif [ -d ${rutas[$i]} ] ; then
				echo "El tipo del objeto $i es: directorio"
			else
				echo "El tipo del objeto $i es: other"
			fi
		fi
	fi
done

echo "La cantidad de archivos o directorios inexistentes en el sistema es: $cantidad_inexistente"

exit 0
