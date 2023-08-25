# !/bin/bash
# Descripción: Archivos y Directorios
# - Para crear directorios utilizamos el comando mkdir seguido del nombre que queremos colocar.
# - Para crear archivos utilizamos el comando touch seguido del nombre que queremos colocar.
# Autor: David Santafe
# Fecha: 2023-07-17
# Ex.   ./21_archivos_directorios.sh d 21_sample_dir
#       ./21_archivos_directorios.sh f 21_sample_file

echo "Archivos - Directorios"

if [[ $# -ne 2 ]]; then
    echo "Número de parámetros incorrectos"
    exit 1
fi

if [[ $1 == "d" ]]; then
    mkdir -m 755 $2
    echo "Directorio creado correctamente"
    ls -la $2
elif [[ $1 == "f" ]]; then
    touch $2
    echo "Archivo creado correctamente"
    ls -la $2
else
    echo "No existe esa opción: $1"
fi
