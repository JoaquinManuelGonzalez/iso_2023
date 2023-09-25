#!/bin/bash

if [ $# -ne 3 ] ; then
	echo "La cantidad de parámetros no es la esperada"
	exit 1
fi

if [ ! -d $1 ] ; then
	echo "No se proporcionó un DIRECTORIO"
	exit 2
fi

if [ "$2" != "-a" ] && [ "$2" != "-b" ] ; then
	echo -e "No se proporcionó un flag válido\nLas opciones válidas son -a o -b"
	exit 3
fi

pushd $1
if [ "$2" = "-a" ] ; then
	for archivo in $(ls) ; do
		if [ -f $archivo ] ; then
			mv $archivo $archivo$3
		else
			continue
		fi
	done
else
	for archivo in $(ls) ; do
		if [ -f $archivo ] ; then
			mv $archivo $3$archivo
		else
			continue
		fi
	done
fi
popd
