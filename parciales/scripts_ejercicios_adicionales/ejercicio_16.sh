#!/bin/bash

#Valido que al menos se reciba un parámetro
if [ $# -eq 0 ] ; then
    echo "Se necesitan al menos 1 parámetro" >&2
    exit 1
fi

no_existen=0

for direccion in $@ ; do
    if [ -f $direccion ] ; then
        gzip -v $direccion
    elif [ -d $direccion ] ; then
        if [ -r $direccion ] ; then
            tar -cvzf "$direccion.tar.gz" $direccion
        elif [ -w $direccion ] ; then
            rm -r $direccion
        fi
    else
        let no_existen++
    fi
done

echo "La cantidad de parámetros inexistentes es: $no_existen"

exit 0