#!/bin/bash

if [ $# -ne 1 ] ; then
    echo "Flaquito manda bien los parámetros" >&2
    exit 1
fi

usuarios=($(cat /etc/passwd | cut -d":" -f1 | grep $1))

function menu {

    local options=(listar eliminar contar Exit)

    function listar {
       printf "%s\n" "${usuarios[@]}"
    }

    function listar_con_indices {
        for ((i=0; i < ${#usuarios[*]}; i++)) ; do
            echo "ELEMENTO: ${usuarios[$i]} | ÍNDICE: $i"
        done
    }

    function eliminar {
        if [ $1 -lt ${#usuarios[*]} ] ; then
            unset usuarios[$1]
            usuarios=(${usuarios[*]})
            echo "Elemento eliminado"
        else
            echo "Posición inválida"
        fi
    }

    function contar {
        echo "CANTIDAD DE ELEMENTOS: ${#usuarios[*]}"
    }

    select option in ${options[*]} ; do
        case $option in
            "listar") listar ;;
            "eliminar") listar_con_indices
                read -p "Ingrese el indice del elemento " indice
                eliminar $indice ;;
            "contar") contar ;;
            "Exit") echo "Saliendo del menú"
                exit 0 ;;
            *) echo "Opción inválida" >&2
                exit 2 ;;
        esac
    done
}

menu
