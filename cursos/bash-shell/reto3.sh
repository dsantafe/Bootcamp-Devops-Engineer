# !/bin/bash
# Reto 3.
# 1. Solicitar que se ingrese un valor del 1 al 5.
# 2. Según el valor ingresado, hacer la validación utilizando las condicionales e imprimir el resultado.
# 3. Construir expresiones de validación numéricas, cadenas y archivos según la opción ingresada.
# Autor: David Santafe
# Fecha: 2023-07-10

NUM=0

read -n1 -p "Enter a number between 1 and 5: " NUM
echo -e "\n"

if [ $NUM -eq 1 ]; then
    echo "You entered 1"
elif [ $NUM -eq 2 ]; then
    echo "You entered 2"
elif [ $NUM -eq 3 ]; then
    echo "You entered 3"
elif [ $NUM -eq 4 ]; then
    echo "You entered 4"
elif [ $NUM -eq 5 ]; then
    echo "You entered 5"
else
    echo "You did not enter a number between 1 and 5"
fi
