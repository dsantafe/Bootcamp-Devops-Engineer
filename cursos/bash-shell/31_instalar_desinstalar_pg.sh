# !/bin/bash
# Descripción: Funciones de instalar y desinstalar postgres
# Autor: David Santafe
# Fecha: 2023-07-18

OPTION=0

#Función para instalar postgres
instalar_postgres () {
    echo -e "\nVerificar instalación de Postgres"
    VERIFY_INSTALL=$(wich psql)
    if [[ $? -eq 0 ]]; then # Significado de $?: devuelve el estado del último comando ejecutado.
        echo "Postgres ya se encuentra instalado."
    else
        read -s -p "Ingresar contraseña de sudo: " PASSWORD
        read -s -p "Ingresar contraseña a utilizar en postgres: " PASSWORD_PG
        echo "$PASSWORD" | sudo -S apt aptupdate
        echo "$PASSWORD" | sudo -S apt-get -y install postgresql postgresql-contrib
        sudo -U postgres psql -c "ALTER USER postgres WITH PASSWORD '{PASSWORD_PG}';"
        echo "$PASSWORD" | sudo -S systemctl enable postgresql.service
        echo "$PASSWORD" | sudo -S systemctl start postgresql.service
    fi
    read -n 1 -s -r -p "Presione [ENTER] para continuar..."
}

#Función para desinstalar postgres
desinstalar_postgres () {
    echo "Desinstalar postgres..."
    read -s -p "Ingresar contraseña de sudo: " PASSWORD
    echo "$PASSWORD" | sudo -S systemctl stop postgresql.service
    echo "$PASSWORD" | sudo -S apt-get -y --purge postgresql\*
    echo "$PASSWORD" | sudo -S rm -r /etc/postgresql
    echo "$PASSWORD" | sudo -S rm -r /etc/postgresql-common
    echo "$PASSWORD" | sudo -S rm -r /var/lib/postgresql
    echo "$PASSWORD" | sudo -S userdel -r postgres
    echo "$PASSWORD" | sudo -S groupdel postgresql 
    read -n 1 -s -r -p "Presione [ENTER] para continuar..."
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
            read -p "Direcotrio de Respaldos: " DIR_BACKUP
            restaurar_respaldo $DIR_BACKUP
            sleep 3
            ;;
        5)
            echo -e "\nSaliendo del prgorama"
            exit 0
            ;;
    esac
done
