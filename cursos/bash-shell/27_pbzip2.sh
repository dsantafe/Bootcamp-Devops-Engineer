# !/bin/bash
# Descripción: Respaldo Empaquetado con clave
# Autor: David Santafe
# Fecha: 2023-07-18

echo "Empaquetar todos los scripts de la carpeta en un archivo comprimido"

tar -cvf shell_course.tar *.sh
pbzip2 -f shell_course.tar

echo "Empaquetar un directorio con tar y pbzip2"
tar -cf *.sh -c > shell_course.tar.bz2
