# !/bin/bash
# Descripción: Capturar información usuario
# Autor: David Santafe
# Fecha: 2023-06-27

OPTION=0
BACKUP_NAME=""

echo "Programa Utilidades Postgres"
read -p "Utilizar una opción:" OPTION
read -p "Ingresar el nombre del archivo del backup:" BACKUP_NAME
echo "Opción: $OPTION, BackupName: $BACKUP_NAME"
