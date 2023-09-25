#!/bin/bash

if [ $# != 0 ] ; then
	echo "Este script no necesita parámetros"
	exit 1
fi

for linea in $(ls) ; do
	echo "$(echo $linea | tr -d 'aA' | tr '[:upper:][:lower:]' '[:lower:][:upper:]')"
done
