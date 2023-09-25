#!/bin/bash

if [ $# -ne 1 ] ; then
	echo "La cantidad de parámetros no es la esperada"
	exit 1
fi

if ! [ -e $1 ] && ! [ -d $1 ] ; then
       echo "La ruta especificada no existe/no es un directorio"
       exit 4
fi

pushd $1
contador=0
for archivo in $(ls) ; do
	if [ -f $archivo ] ; then
		if [ -r $archivo ] && [ -w $archivo ] ; then
			((contador++))
		fi
	fi
done
popd

echo "La cantidad de archivos con permisos de escritura y lectura son: $contador"
exit 0
