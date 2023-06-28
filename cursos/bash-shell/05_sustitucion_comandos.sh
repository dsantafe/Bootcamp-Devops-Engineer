# !/bin/bash
: ' Descripción: Sustitución de Comandos en variables
    Para la sustitución de comandos es importante tener en cuenta que el resultado servirá para realizar otras tareas de otras sentencias de 
    nuestro programa.
    Las dos maneras de hacerlo:
    Usando el backtick caracter. (`)
    Usando el signo de dólar con el formato $(comando)
    Autor: David Santafe
    Fecha: 2023-06-24'

UBICACION_ACTUAL=`pwd`
INFO_KERNEL=$(uname -a)

echo "La ubicación actual es: $UBICACION_ACTUAL"
echo "Información del Kernel: $INFO_KERNEL"
