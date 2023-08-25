# !/bin/bash
# Descripción: Sentencia while loop
# Autor: David Santafe
# Fecha: 2023-07-17

NUMBER=1

while [ $NUMBER -lt 10 ]
do
    echo "Imprimiendo $NUMBER veces"
    NUMBER=$((NUMBER + 1))
done
