# !/bin/bash
# Descripción: Menú de Opciones
# Autor: David Santafe
# Fecha: 2023-07-17

OPTION=0

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

    #Validación
    case $OPTION in
        1)
            echo -e "\nInstalando Postgres..."
            sleep 3
            ;;
        2)
            echo -e "\nDesinstalando Postgres..."
            sleep 3
            ;;
        3) 
            echo -e "\nSacando un respaldo..."
            sleep 3
            ;;
        4) 
            echo -e "\nRestaurando respaldo..."
            sleep 3
            ;;
        5)
            echo -e "\nSaliendo del programa"
            exit 0
            ;;
    esac
done
