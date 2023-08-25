# !/bin/bash
# Descripción: Sentencia for loop
# Autor: David Santafe
# Fecha: 2023-07-17

ARR_NUMBERS=(1 2 3 4 5 6)

echo "Iterar en la lista de Números"
for NUM in ${ARR_NUMBERS[*]}
do 
    echo "Número: $NUM"
done

echo "Iterar en la lista de Cadenas"
for NOM in "Marco" "Pedro" "Luis" "Daniela"
do
    echo "Nombre: $NOM"
done

echo "Iterar en Archivos"
for FILE in *
do
    echo "Archivo: $FILE"
done

echo "Iterar utilizando un comando"
for FILE in $(ls)
do
    echo "Resultado del comando: $FILE"
done

echo "Iterar utilziando el formato tradicional"
for ((i=1;i<10;i++))
do
    echo "Número: $i"
done
