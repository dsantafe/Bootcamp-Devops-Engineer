# !/bin/bash
# Descripción: Expresiones Condicionales
# Autor: Sentencias Case
# Fecha: 2023-07-17

OPTION=""

echo "Ejemplo Sentencia Case"
read -p "Ingrese una opción de la A - Z: " OPTION

case $OPTION in
    "A") echo -e "Operación guardar Archivo";;
    "B") echo -e "Operación eliminar Archivo";;
    [C-E]) echo "No esta implementada la operación";;
    *) echo "Opcion Incorrecta"
esac
