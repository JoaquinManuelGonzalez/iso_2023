#!/bin/bash

if [ $# -ne 1 ] ; then exit 1; fi

if ! [ -e $1 ]
then
	$(mkdir $1)
elif [ -f $1 ]
then
	echo "El parámetro proporcionado es un archivo"
else
	echo "El parámetro proporcionado es un directorio"
fi
