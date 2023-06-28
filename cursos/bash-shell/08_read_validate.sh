# !/bin/bash
: ' Descripción: Validar información
    Para el proceso de validación de información tenemos dos maneras de hacerlo:
    - Para validar tamaños se utiliza el siguiente comando: read -n <numero_caracteres>
    - Para validar el tipo de datos se utilizan las expresiones regulares
    Autor: David Santafe
    Fecha: 2023-06-27'

OPTION=0
BACKUP_NAME=""
PASSWORD=""

echo "Programa Utilidades Postgres"
# Acepta el ingrso de información de sólo un caracter0
read -n1 -p "Utilizar una opción: " OPTION
echo -e "\n"
read -n10 -p "Ingresar el nombre del archivo del backup: " BACKUP_NAME
echo -e "\n"
echo "Opción: $OPTION, BackupName: $BACKUP_NAME"
read -s -p "Clave: " PASSWORD
echo -e "\n"
echo "Clave: $PASSWORD"
