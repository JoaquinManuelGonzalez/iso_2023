#!/bin/bash

if [ $# -ne 0 ] ; then
	echo "Este script no requiere de parámetros"
	exit 1
fi

function operaciones {
	local pila=()

	function push {
		pila=(${pila[*]} $1)
		echo "Elemento agregado"
		return 0
	}

	function lenght {
		return ${#pila[*]}
	}

	function pop {
		if [ ${#pila[*]} -ne 0 ] ; then
			elemento="${pila[${#pila[*]}-1]}"
			echo "Elemento popeado: $elemento"
		else
			echo "La pila está vacía"
		fi
		return 0
	}

	function print {
		echo "Elementos: ${pila[*]}"
		return 0
	}

	select action in push lenght pop print exit ; do
		case $action in
			"push")
				read -p "Ingrese el elemento a agregar: " elemento
				push $elemento ;;
			"lenght")
				lenght
				echo "La cantidad de elementos de la pila es: $?" ;;
			"pop") pop ;;
			"print") print ;;
			"exit") exit 0 ;;
			*)
				echo "Opción inválida"
				exit 2 ;;
		esac
	done
}

operaciones
