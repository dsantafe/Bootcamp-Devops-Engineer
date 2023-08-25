# !/bin/bash
# Descripción: Transferir información red
# Autor: David Santafe
# Fecha: 2023-07-18

echo "Empaquetar todos los scripts de la carpeta y transferirlos por la red a otro equipo usando el comando rsync"

HOST=""
USER=""

read -p "Ingrese el host: " HOST
read -p "Ingrese el usuario: " USER

echo -e "\nEn este momento se procederá a empaquetar la carpeta y transferirla según los datos ingresados"
rsync -avz $(pwd) $USER@$HOST:/home/dsantafe
