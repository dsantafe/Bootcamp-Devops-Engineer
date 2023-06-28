# !/bin/bash
# Descripción: Sentencias If/Else
# Autor: David Santafe
# Fecha: 2023-06-27

NOTE=0
AGE=0

echo "Ejemplo Sentencia If-Else"
read -n1 -p "Indique cual es su nota (1-9): " NOTE
echo -e "\n"
if (( $NOTE >= 7 )); then
    echo "El alumno aprobó la materia"
else 
    echo "El alumno reprobó la materia"
fi

read -p "Ingrese su edad: " AGE
echo -e "\n"
if [ $AGE -le 18 ]; then
    echo "La persona no puede votar"
else
    echo "La persona si puede votar"
fi
