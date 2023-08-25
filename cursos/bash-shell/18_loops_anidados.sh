# !/bin/bash
# Descripción: Loop Anidados
# https://blogs.upm.es/estudiaciencia/bucles-y-condicionales/
# Autor: David Santafe
# Fecha: 2023-07-17

echo "Loops Anidados"

for FILE in $(ls)
do
    for NAME in {1..4}
    do
        echo "Nombre Archivo: $FILE _ $NAME"
    done
done
