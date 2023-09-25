#!/bin/bash

select action in Listar DondeEstoy QuienEsta Exit
do
	case $action in
		"Listar") echo "Listando contenido: $(ls)" ;;
		"DondeEstoy") echo "Estoy en: $(pwd)" ;;
		"QuienEsta") echo "Están conectados: $(who)" ;;
		"Exit") exit 0 ;;
		*) exit 1 ;;
	esac
done
