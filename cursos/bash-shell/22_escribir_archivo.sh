# ! /bin/bash
# Descripción: Escribir dentro de archivos
# - EOM: End Of Message
# - EOF: End Of File
# >> # Concatena
# >  # Reemplaza
# Autor: David Santafe
# Fecha: 2023-07-17
# Ex.   ./22_escribir_archivo.sh provincias.txt "Mendoza"
#       cat provincias.txt 

echo "Escribir en un archivo"

#Lo que envien en archivo numero 2 se agregará al archivo número 1
echo "Valores escritos con el comando echo" >> $1

#Adición multilinea
cat << EOM >> $1
$2
EOM
