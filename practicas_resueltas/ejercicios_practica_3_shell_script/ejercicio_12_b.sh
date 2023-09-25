#!/bin/bash
if (($# != 2))
then
	exit 1
else
	echo "La suma de los 2 números es: $(($1 + $2))"
	echo "La multiplicación de los números es: $(($1 * $2))"
	echo "La división entre los 2 números es: $(($1 / $2))"
	echo "La resta entre los 2 números es: $(($1 - $2))"
	if [ $1 -gt $2 ]
	then
		echo "El número más grande de los 2 es: $1"
	else
		echo "El número más grande de los 2 es: $2"
	fi
fi
