#!/bin/bash

if [ $# -lt 2 ] ; then
    echo "Flaco te faltan parametros" >&2
    exit 1
fi

existe=$(ls /var/log | cut -d"." -f2 | grep -w $1 | wc -l)

if [ $existe -ne 0 ] ; then
    echo "IP | CANTIDAD DE ACCESOS"
    for ip in ${@:2} ; do
        echo "$ip | $(cat /var/log/access.$1.log | cut -f1 | grep $ip | wc -l)"
    done
else
    echo "El archivo con la fecha recibida no existe" >&2
    exit 2
fi

exit 0