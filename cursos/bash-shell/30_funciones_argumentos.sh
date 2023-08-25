# !/bin/bash
# Descripción: Crear funciones y Paso de Argumentos
# Autor: David Santafe
# Fecha: 2023-07-18

OPTION=0

#Función para instalar postgres
instalar_postgres () {
    echo "Instalar postgres..."
}

#Función para desinstalar postgres
desinstalar_postgres () {
    echo "Desinstalar postgres..."
}

#Función para sacar respaldo
sacar_respaldo () {
    echo "Sacar respaldo..."
    echo "Directorio backup: $1"
}

#Función para restaurar respaldo
restaurar_respaldo () {
    echo "Restaurar respaldo..." 
    echo "Directorio respaldo: $1"
}

while :
do
    #Limpiar la pantalla
    clear
    #Desplegar el menu de opciones
    echo "_________________________________________"
    echo "PGUTIL - Programa de Utilidad de Postgres"
    echo "-----------------------------------------"
    echo "            MENÚ PRINCIAPAL              "
    echo "-----------------------------------------"
    echo "1. Instalar Postgres"
    echo "2. Desinstalar Postgres"
    echo "3. Sacar un respaldo"
    echo "4. Restaurar respaldo"
    echo "5. Salir"

    #Leer los datos del usuario
    read -n1 -p "Ingrese una opción (1-5): " OPTION
    echo -e "\n"

    #Validación
    case $OPTION in
        1)
            instalar_postgres
            sleep 3
            ;;
        2)
            desinstalar_postgres
            sleep 3
            ;;
        3) 
            read -p "Directorio de Backup: " DIR_BACKUP
            sacar_respaldo $DIR_BACKUP
            sleep 3
            ;;
        4) 
            read -p "Direcotrio de Respaldos: " DIR_RESPALDO
            restaurar_respaldo $DIR_RESPALDO
            sleep 3
            ;;
        5)
            echo -e "\nSaliendo del prgorama"
            exit 0
            ;;
    esac
done
