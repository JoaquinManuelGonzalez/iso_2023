#!/bin/bash

if [ $# -ne 0 ] ; then
	echo "Este script no requiere parámetros"
	exit 1
fi

num=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)

function recorrido {
	local total_imp=0

	for valor in ${num[*]} ; do
		if (( $valor % 2 == 0 )) ; then
			echo $valor
		else
			((total_imp++))
		fi
	done

	echo "La cantidad total de elementos impares es: $total_imp"
	
	return 0
}

recorrido
exit 0
