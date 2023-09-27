#!/bin/bash

if [ $# -ne 0 ] ; then
    echo "La cantidad de parámetros no es la esperada" >&2
    exit 1
fi

archivos=($(ls /var/log | grep access))

function cantidad {
    if [ $# -ne 0 ] ; then
        echo "LA FUNCIÓN NO NECESITA ARGS"
        return 1
    fi

    echo "CANTIDAD DE ELEMENTOS: ${#archivos[*]}"
    return 0
}

function listar {
    if [ $# -ne 0 ] ; then
        echo "LA FUNCIÓN NO NECESITA ARGS"
        return 1
    fi

    echo "ELEMENTOS: ${archivos[*]}"
    return 0
}

function borrado {
    unset archivos[$1]
    archivos=(${archivos[*]})
    echo "ELEMENTO ELIMINADO"
    return 0
}

function eliminar {
    if [ $# -ne 2 ] ; then
        echo "La cantidad de parametros no es la esperada" >&2
        return 1
    fi

    if [ $1 -lt ${#archivos[*]} ] ; then
        case $2 in 
            "lógico") borrado $1 ;;
            "fisico") arch=${archivos[$1]}
                borrado $1
                rm /var/log/$arch ;;
            *) echo "OPCIÓN INVÁLIDA"
                return 2 ;;
        esac
    else
        echo "POSICIÓN INVÁLIDA"
        return 2
    fi
    return 0
}
