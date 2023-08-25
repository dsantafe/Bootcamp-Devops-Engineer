# !/bin/bash
# Descripción: Arreglos
# Autor: David Santafe
# Fecha: 2023-07-17

ARR_NUMBERS=(1 2 3 4 5 6)
ARR_STRINGS=(Juan, Manuel, Antonio, Pedro, Pablo)
ARR_RANGES=({A..Z} {10..20})

#Imprimir todos los valores
echo "Arreglo de Números: ${ARR_NUMBERS[*]}"
echo "Arreglo de Cadenas: ${ARR_STRINGS[*]}"
echo "Arreglo de Rangos: ${ARR_RANGES[*]}"

#Imprimir los tamaños de los arreglos
echo "Tamaño arreglo de Números: ${#ARR_NUMBERS[*]}"
echo "Tamaño arreglo de Cadenas: ${#ARR_STRINGS[*]}"
echo "Tamaño arreglo de Rangos: ${#ARR_RANGES[*]}"

#Imprimir la posición 3 del arreglo de Números, Cadenas y Rangos
echo "Posición 3 arreglo de Números: ${ARR_NUMBERS[3]}"
echo "Posición 3 arreglo de Cadenas: ${ARR_STRINGS[3]}"
echo "Posición 3 arreglo de Rangos: ${ARR_RANGES[3]}"

#Añadir / Eliminar valores de un arreglo
ARR_NUMBERS[6]=20
unset ARR_NUMBERS[0]  # Para quitar algún elemento: unset arregloNombre[posición]
echo "Arreglo de Números: ${ARR_NUMBERS[*]}"
echo "Tamaño del Arreglo de Números ${#ARR_NUMBERS[*]}"
