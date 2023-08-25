# !/bin/bash
# Descripción: Respaldo Empaquetado con clave
# Autor: David Santafe
# Fecha: 2023-07-18

echo "Empaquetar todos los scripts de la carpeta en un archivo comprimido"

#Empaquetar en shellCourse todo lo que tenga extensión sh
tar -cvf shell_course.tar *.sh
