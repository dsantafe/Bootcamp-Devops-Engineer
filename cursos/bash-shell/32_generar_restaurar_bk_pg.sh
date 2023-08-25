# !/bin/bash
# Descripción: Funciones sacar y restaurar respaldos en postgres
# Autor: David Santafe
# Fecha: 2023-07-18

OPTION=0
CURRENT_DATE=`date +%Y%m%d`

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

    echo "Listar las bases de datos..."
    sudo -u postgres psql -c "\l"
    read -p "Elegir la BD a respaldar: " BD_BACKUP
    echo -e "\n"

    if [ -d "$1" ]; then
        read -s -p "Ingresar contraseña de sudo: " PASSWORD
        echo "Establecer permisos directorio"
        echo "$PASSWORD" | sudo -S chmod 755 $1
        echo "Realizando respaldo..."
        sudo -u postgres pg_dump -Fc $BD_BACKUP > "$1/$BD_BACKUP_$CURRENT_DATE.bak"
        echo "Respaldo realizado Correctamente en la ubicacion: $1/$BD_BACKUP_$CURRENT_DATE.bak"
    else
        echo -e  "\nEl directorio $1 No Existe"
        echo -e "\n"
        read -n1 -p "Desea crear el directorio $1 (s/n)" FLAG_CREATE_DIR
        if [ $FLAG_CREATE_DIR = "s" ]; then
            sudo mkdir $1
            echo "$PASSWORD" | sudo -S chmod 755 $1
            echo -e "\nRealizando respaldo..."
            sleep 3
            sudo -u postgres pg_dump -Fc $BD_BACKUP > "$1/$BD_BACKUP_$CURRENT_DATE.bak"
            echo "Respaldo realizado Correctamente en la ubicacion: $1/$BD_BACKUP_$CURRENT_DATE.bak"
        else
            echo -e "\nSaliendo sin realizar Respaldo..."
            sleep 3
        fi
    fi

    read -n 1 -s -r -p "Presione [ENTER] para continuar..."
}

#Función para restaurar respaldo
restaurar_respaldo () {
    read -p "Ingresar el directorio donde se encuentran los respaldos   " DIR_BACKUP

    if [ -d $DIR_BACKUP ]; then
        echo "Listando los archivos de Respaldos..."
        sleep 3
        ls -la $DIR_BACKUP
        read -p "Ingresar el archivo .bak a restaurar:  " FILE_BACKUP
        
        if [ -f "$DIR_BACKUP/$FILE_BACKUP" ]; then
            read -p "Ingresar nombre BD destino: " BD_NAME
            VERIFY_BD_EXIST= $(sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -wq $BD_NAME)
            if [ $? -eq 0 ]; then
                echo "Restaurando en la Base de Datos destino...$BD_NAME"
                sudo -u postgres pg_restore -Fc -d $BD_NAME "$DIR_BACKUP/$FILE_BACKUP"
                echo "Listar Bases de datos..."
                sudo -u postgres psql -c "\l"
            else
                echo  "La BD destino no se encuentra..."
                echo  "Creando Base de Datos destino..."
                sleep 4
                sudo -u postgres psql -c "CREATE DATABASE $BD_NAME"
                sudo -u postgres pg_restore -Fc -d $BD_NAME "$DIR_BACKUP/$FILE_BACKUP"
                echo "Listar Bases de datos..."
                sudo -u postgres psql -c "\l"
            fi
        else
            echo "No se encuentra el archivo de Respaldo Ingresado"
            echo "Verifique nuevamente el nombre y vuelva a intentarlo..."
        fi
    else
        echo "No se encuentra el directorio de Respaldos ingresado..."
        echo "Verifique nuevamente el nombre y vuelva a intentarlo..."
    fi

    read -n 1 -s -r -p "Presione [ENTER] para continuar..."
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
