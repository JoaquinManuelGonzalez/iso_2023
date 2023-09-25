#!/bin/bash

if [ $# -ne 0 ] ; then
	echo "Este script no requiere parámetros"
	exit 1
fi

array1=(1 80 65 35 2)
array2=(5 98 3 41 8)

for ((i=0; i < ${#array1[*]}; i++)) ; do
	echo "La suma de los elementos de la posición $i de los vectores es $((${array1[$i]} + ${array2[$i]}))"
done

exit 0
