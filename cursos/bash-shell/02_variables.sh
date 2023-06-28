# !/bin/bash
# Descripción: Declaración de Variables y Alcance en Bash Shell
# Autor: David Santafe
# Fecha: 2023-06-24

OPCION=0
NOMBRE=David

echo "Opción: $OPCION y Nombre: $NOMBRE"

# Exportar la variable NOMBRE para que esté disponible en los demás procesos

export NOMBRE

# Llamar el siguiente script para recuperar la variable
./02_variables_alcance.sh
