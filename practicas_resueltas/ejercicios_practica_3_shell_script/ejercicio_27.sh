#!/bin/bash

if [ $# -ne 0 ] ; then 
	echo "Este script no requiere parámetros"
	exit 1
fi

function menu {
	
	local options=(inicializar agregar_elem eliminar_elem longitud imprimir inicializar_con_valores Exit)
	
	function inicializar {
		array=()
		echo "Vector vacío inicializado"
		return 0
	}

	function agregar_elem {
		array=(${array[*]} $1)
		echo "Elemento agregado"
		return 0
	}

	function eliminar_elem {
		if (($1 < ${#array[*]} )) ; then
			unset array[$1]
			echo "Elemento eliminado"
		else
			echo "Posición inválida"
			return 1
		fi
		return 0
	}

	function longitud {
		echo "Longitud del array: ${#array[*]}"
		return 0
	}

	function imprimir {
		echo "Elementos: ${array[*]}"
		return 0
	}

	function inicializar_con_valores {
		local array_con_valores=()
		for ((i=0; i < $1; i++)) ; do
			array_con_valores[$i]=$2
		done
		echo "Nuevo Arreglo: ${array_con_valores[*]}"
		return 0
	}

	select action in ${options[*]} ; do
		case $action in
			"inicializar") inicializar ;;
			"agregar_elem")
				read -p "Ingrese el elemento a agregar: " elemento
				agregar_elem $elemento ;;
			"eliminar_elem")
				read -p "Ingrese la posición de elemento a eliminar: " pos
				eliminar_elem $pos ;;
			"longitud") longitud ;;
			"imprimir") imprimir ;;
			"inicializar_con_valores")
				read -p "Ingrese la cantidad de elementos: " cant
				read -p "Ingrese el valor a asignar a cada posición: " valor
				inicializar_con_valores $cant $valor ;;
			"Exit")
				echo "Saliendo del menú"
				exit 0 ;;
			*)
				echo "Opción inválida"
				exit 2 ;;
		esac
	done
}

menu
exit 0
