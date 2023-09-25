#!/bin/bash

if [ $# -ne 0 ] ; then
	echo "Este script no necesita parámetros"
	exit 1
fi

num=(10 3 5 7 9 3 5 4)

function productoria {
	local resultado="1"

	for valor in ${num[*]} ; do
		resultado=$(($valor * $resultado))
	done

	echo "EL resultado de multiplicar los elementos del array es: $resultado"
}

productoria
exit 0
