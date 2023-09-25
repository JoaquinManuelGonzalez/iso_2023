#!/bin/bash

if [ $# != 1 ] ; then 
	echo "Cantidad de parámetros incorrecta"
	exit 1
fi

existe=$(cat /etc/passwd | cut -d: -f1 | grep $1 | wc -l)
if [ $existe -eq 0 ] ; then
	echo "El usuario no existe en el sistema"
	exit 2
fi

while true ; do
	conectado=$(who | cut -d' ' -f1 | grep $1 | wc -l)
	if [ $conectado -gt 0 ] ; then
		echo "Usuario $1 logueado en el sistema"
		exit 0
	fi
	sleep 10
done	
