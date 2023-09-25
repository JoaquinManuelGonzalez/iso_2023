#!/bin/bash

if [ $# -ne 0 ] ; then
	echo "Este script no requiere de parámetros"
	exit 1
fi

select action in $(ls | grep ".sh") Salir ; do
	case $action in
		"Salir")
			echo "Saliendo del menú"
			exit 0 ;;
		*) bash $action ;;
	esac
done
