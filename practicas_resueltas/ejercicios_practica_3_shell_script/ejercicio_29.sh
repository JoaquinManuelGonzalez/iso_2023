#!/bin/bash

if [ $# -ne 0 ] ; then 
	echo "Este script no requiere parámetros"
	exit 1
fi

function crear_array {
	archivos=($(ls $HOME | grep ".doc"))
}

function verArchivo {
	for archivo in ${archivos[*]} ; do
		if [ $archivo = $1 ] ; then
			echo $(cat "$HOME/$archivo")
			return 0
		fi
	done
	echo "Archivo no encontrado"
	return 5
}

function cantidadArchivos {
	echo "La cantidad de archivos del /home con terminación en .doc es de: ${#archivos[*]}"
	return 0
}

function borrarArchivo {
	for ((i=0; i < ${#archivos[*]}; i++)) ; do
		if [ ${archivos[$i]} = $1 ] ; then
			read -p "Desea borrar el archivo logicamente (Si/No) " desicion
			case $desicion in
				"Si") unset archivos[$i] ;;
				"No") 
					unset archivos[$i]
					rm "$HOME/$1" ;;
				*)
				       	echo "Opción inválida"
					return 1
			esac
			return 0
		fi
	done
	echo "Archivo no encontrado"
	return 10
}

crear_array
cantidadArchivos
echo "Elementos el Array: ${archivos[*]}"
read -p "Ingrese el nombre del archivo que quiere ver: " nombre
verArchivo $nombre
echo "Valor de retorno: $?"
read -p "Ingrese el nombre del archivo que quiere eliminar: " eliminar
borrarArchivo $eliminar
echo "Valor de retorno: $?"
echo "Elementos luego de eliminar: ${archivos[*]}"
