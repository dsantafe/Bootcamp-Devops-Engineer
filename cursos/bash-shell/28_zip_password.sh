# !/bin/bash
# Descripción: Respaldo Empaquetado con clave
# Autor: David Santafe
# Fecha: 2023-07-18

echo "Empaquetar todos los scripts de la carpeta shell_course con zip y asignarle una clave de seguridad"

zip -e shell_course.zip *.sh
