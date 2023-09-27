#!/bin/bash

if [ $# -ne 1 ] ; then 
    echo "La cantidad de parámetros no es la esperada" >&2
    exit 2
fi

existe=$(cat /etc/passwd | cut -d: -f1 | grep -w $1 | wc -l)

if [ $existe -eq 0 ] ; then
    echo "EL USUARIO NO EXISTE" >&2
    exit 1
else
    contador=0
    while [ $contador -ne 30 ] ; do
        conectado=$(who | grep -w $1 | wc -l)
        if [ conectado -ne 0 ] ; then
            echo "$1 $(date)" >> /var/access.$1.log
            let contador++
        fi
        sleep 30
    done
    exit 0
fi
