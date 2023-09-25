#!/bin/bash

if [ $# -ne 0 ] ; then
	echo "Este script no requiere parámetros"
	exit 1
fi

archivos=($(ls -F | grep "*"))

if [ ${#archivos[*]} -ne 0 ] ; then
	bin=$HOME/bin
	if ! [ -e $bin ] ; then
		mkdir $bin
	fi
		mv ${archivos[*]} $bin
	echo "Elementos movidos: ${archivos[*]}"
	echo "La cantidad de archivos movidos fue de: ${#archivos[*]}"
else
	echo "No hay archivos para mover"
fi
exit 0
