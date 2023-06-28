# !/bin/bash
: ' Descripción: Capturar información usuario
    Para poder capturar información tenemos dos formas dentro de un programa Bash.
    - Utilizando en conjunto con el comando echo
    - Utilizando directamente el comando read
    Unas de las opciones más utilizadas para Read:
    -p: Permite ingresar una frase o prompt antes de pedir el dato.
    -s: Modo Sigiloso. No muestra ningún caracter en la terminal, util para contraseñas o información sensible.
    -n [num]: Permite leer como máximo n caracteres.
    -r: Toma el botón de retroceso o backspace como un caracter y no borra ningun otro caracter previamente escrito.
    Nota: La variable “$REPLY” es donde se almacenará esa información del standard input
    Autor: David Santafe
    Fecha: 2023-06-27'

OPTION=0
BACKUP_NAME=""

echo "Programa Utilidades Postgres"
echo -n "Utilizar una opción:"
read
OPTION=$REPLY
echo -n "Ingresar el nombre del archivo del backup:"
read
BACKUP_NAME=$REPLY
echo "Opción: $OPTION, BackupName: $BACKUP_NAME"
