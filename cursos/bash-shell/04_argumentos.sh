# !/bin/bash
# Descripción: Script con Argumentos
# Autor: David Santafe
# Fecha: 2023-06-24

NOMBRE_CURSO=$1
HORARIO_CURSO=$2

echo "El nombre del curso es: $NOMBRE_CURSO dictado en el horario de $HORARIO_CURSO"
echo "El numero de parámetros enviados es: $#"
echo "Los parámetros enviados son: $*"

# Ex ./04_argumentos.sh "Bash Shell" "18:00 a 20:00"
# Nota: Si es mayor a 9 argumentos se pone entre llaves ex ${10} 