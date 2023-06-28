# !/bin/bash
: ' Descripción: Paso de parámetros y opciones
    En el while, se usa la opción -n $1, la cual quiere decir: Mientras exista argumento en $1 haz…
    Esto es porque se usa el comando shift, el cual elimina el argumento que esté guardado en $1, 
    volviendo a enumerar los argumentos desde $1 hasta $(n-1), donde n el número de agumentos.
    Autor: David Santafe
    Fecha: 2023-06-27'

echo "Programa opciones"
echo "Opción 1 enviada: $1"
echo "Opción 2 enviada: $2"
echo "Opción 3 enviada: $3"
echo "Opciones enviadas: $*"
echo -e "\n"
echo "Recuperar valores"
while [ -n "$1" ]
    do
        case "$1" in
        -a) echo "-a Option used ";;
        -b) echo "-b Option used ";;
        -c) echo "-c Option used ";;
        *) echo "$! no es una opción";;
        esac
        shift
     done
