# !/bin/bash
# Descripción: Expresiones Condicionales
# Autor: David Santafe
# Fecha: 2023-07-10

AGE=0
COUNTRY=""
PATH=""

read -p "Ingrese su edad: " AGE
read -p "Ingrese su pais: " COUNTRY
read -p "Ingrese el path de su archivo: " PATH

echo -e "\nExpresiones condicionales con números"
if [ $AGE -lt 10 ]; then
    echo "La persona es un niñ@"
elif [ $AGE -ge 10 ] && [ $AGE -le 17 ]; then
    echo "La persona se trata de un adolescente"
else
    echo "La persona es mayor de edad"
fi

echo -e "\nExpresiones condicionales con cadenas"
if [ $COUNTRY = "US" ]; then
    echo "La persona es un Americana"
elif [ $COUNTRY = "CO" ] || [ $COUNTRY = "PY" ]; then
    echo "La persona es Suramericana"
else
    echo "Se desconoce la nacionalidad"
fi

echo -e "\nExpresiones condicionales con archivos"
if [ -d $PATH ]; then
    echo "El directorio $PATH existe"
else
    echo "El directorio $PATH no existe"
fi