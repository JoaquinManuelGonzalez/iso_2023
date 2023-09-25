#!/bin/bash

if [ $# -gt 2 ] ; then
	echo "La cantidad de parámetros no es la esperada"
	exit 1
fi

usuarios=($(cat /etc/group | grep -w "users" | cut -d: -f4 | tr "," " "))

case $1 in
	"-b")
		if [ $# -eq 2  ] && [ $2 -lt ${#usuarios[*]} ] ; then
			echo "El elemento de la posición $2 es: ${usuarios[$2]}"
		else
			echo "Posición inválida"
			exit 2
		fi ;;
	"-l") echo "Longitud del arreglo: ${#usuarios[*]}" ;;
	"-i") echo "Elementos: ${usuarios[*]}" ;;
	*)
		echo "Parámetro inválido"
		exit 3
esac
exit 0
