# !/bin/bash
# Descripción: Operaciones Archivos
# Autor: David Santafe
# Fecha: 2023-07-17

echo "Operaciones de un archivo"

#Crear directorio para backups
mkdir -m 755 backup_scripts

#Copiar los archivos al directorio de backup
echo -e "\nCopiar los scripts del directorio actual al nuevo directorio backup_scripts"
cp *.* backup_scripts/
ls -la backup_scripts/

#Mover el directorio de backup a otra carpeta
echo -e "\nMover el directorio de backup_scripts a otra ubicación: $HOME"
mv backup_scripts $HOME

#Eliminar los archivos con extensión .txt
cd $HOME/backup_scripts/
echo -e "\nEliminar los archivos .txt"
rm *.txt
