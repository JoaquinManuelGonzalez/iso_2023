#!/bin/bash

#chequeo la cantidad de parámetros
if [ $# -ne 0 ] ; then
    echo "Este script no necesita parámetros" >&2
    exit 1
fi

#me quedo con los usuarios
usuarios=($(cat /etc/passwd | cut -d: -f1))

function existe {
    if [ $# -ne 1 ] ; then
        echo "La cantidad de parámetros no es la esperada" >&2
        return 3
    fi

    existe=$(echo "${usuarios[*]}" | grep -w $1 | wc -l)

    if [ $existe -ne 0 ] ; then
        echo "El usuario existe en el sistema"
        return 0
    else
        echo "El usuario no existe en el sistema" >&2
        return 1
    fi
}

function eliminar_usuario {
    if [ $# -ne 1 ] ; then
        echo "La cantidad de parámetros no es la esperada" >&2
        return 3
    fi

    existe $1

    if [ $? -eq 0 ] ; then
        for ((i=0; i < ${#usuarios[*]}; i++)) ; do
            if [ ${usuarios[$i]} = $1 ] ; then
                unset usuarios[$i]
                usuarios=(${usuarios[*]})
                break
            fi
        done
        echo "Elemento eliminado"
        return 0
    else
        echo "El usuario no existe" >&2
        return 2
    fi
}

function usuarios_con_patron {
    if [ $# -ne 1 ] ; then
        echo "La cantidad de parámetros no es la esperada" >&2
        return 3
    fi

    echo -e "Los elementos que coinciden con el patrón son:\n $(printf "%s\n" "${usuarios[@]}" | grep $1)"
    return 0
}

function cantidad {
    echo "La cantidad de elementos es: ${#usuarios[*]}"
    return 0
}

function usuarios {
    echo "Elementos: ${usuarios[*]}"
}

usuarios
cantidad
usuarios_con_patron o
existe joacogoonz
eliminar_usuario joacogoonz
usuarios
cantidad
existe joacogoonz
echo "$?"

exit 0