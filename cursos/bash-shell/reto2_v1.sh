# !/bin/bash
# Reto 2:Solicitar la información de cada uno de ustedes como nombres, apellidos, edad, dirección y números telefónicos; y posterior imprima toda la información
# Autor: David Santafe
# Fecha: 2023-07-10

NAME_REGEX='^([A-Z]{1})([a-z]*)$'
LASTNAME_REGEX='^([A-Z]{1})([a-z]*)$'
AGE_REGEX='^([1-9][1-9])$'
ADDRESS_REGEX='^([A-Z]{1})([a-z]*\s)([A-Z]{2}\s)([0-9]*)$'
PHONE_REGEX="^([0-9]{10})$"

function invalid_syntax {
    echo "Invalid syntax... $1"
    echo "Please try again and double check if you miss spelled something"
    echo ""
}

echo "Ingrese la información personal"
read -p "Ingrese un nombre: " NAME
read -p "Ingrese un apellido: " LASTNAME
read -p "Ingrese una edad: " AGE
read -p "Ingrese una direccion: " ADDRESS
read -p "Ingrese un telefono: " PHONE
echo -e "\n"

# Validación de los datos
if [[ $NAME =~ $NAME_REGEX ]]; then
    echo "Nombre: $NAME válida"
else
    invalid_syntax "Nombre"
fi
if [[ $LASTNAME =~ $LASTNAME_REGEX ]]; then
    echo "Apellido: $LASTNAME válida"
else
    invalid_syntax "Apellido"
fi
if [[ $AGE =~ $AGE_REGEX ]]; then
    echo "Edad: $AGE válida"
else
    invalid_syntax "Edad"
fi
if [[ $ADDRESS =~ $ADDRESS_REGEX ]]; then
    echo "Dirección: $ADDRESS válida"
else
    invalid_syntax "Dirección"
fi
if [[ $PHONE =~ $PHONE_REGEX ]]; then
    echo "Telefono: $PHONE válida"
else
    invalid_syntax "Telefono"
fi
echo -e "\n"

# Mostrar Datos
echo "-----Mostrar datos-----"
echo "$NAME"
echo "$LASTNAME"
echo "$AGE"
echo "$ADDRESS"
echo "$PHONE"

