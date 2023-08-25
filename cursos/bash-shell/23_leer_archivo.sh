# !/bin/bash
# Descripción: Leer Archivos, https://bash.cyberciti.biz/guide/$IFS
# Autor: David Santafe
# Fecha: 2023-07-17

echo "Leer en un archivo"

#Primer método
echo -e "\nLeer directamente todo el archivo"
cat $1

#Segundo método
echo -e "\nAlmacenar los valores en una variable"
COMMAND_CAT=`cat $1`
echo "$COMMAND_CAT"

#Tercer método
#Se utiliza la variable especial IFS (Internal File Separator) para evitar que los espacios en blanco se recorten
echo -e "\nLeer archivos línea por línea utilizando while"
while IFS= read LINE
do
    echo "$LINE"
done < $1
