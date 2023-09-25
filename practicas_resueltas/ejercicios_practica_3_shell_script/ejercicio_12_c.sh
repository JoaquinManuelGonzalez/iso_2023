#!/bin/bash
if (($# != 3))
then
	exit 1
else
	case $2 in
		"+") echo "$(($1 + $3))" ;;
		"-") echo "$(($1 - $3))" ;;
		"*") echo "$(($1 * $3))" ;;
		"%") echo "$(($1 % $3))" ;;
		*) echo "OPERACIÓN NO VÁLIDA" ;;
	esac
fi
