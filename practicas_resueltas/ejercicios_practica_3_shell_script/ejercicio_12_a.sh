#!/bin/bash
read -p "Ingrese el primer número: " num_1
read -p "Ingrese el segundo número: " num_2
echo "La suma de los 2 número es $(($num_1 + $num_2))"
echo "La multiplicación de los números es $(($num_1 * num_2))"
echo "La división entre los 2 números es $(($num_1 / $num_2))"
echo "La resta entre los 2 números es $(($num_1 - $num_2))"
if [ $num_1 -gt $num_2 ]
then
	echo "El número más grande de los 2 es $num_1"
else
	echo "El número más grande de los 2 es $num_2"
fi
