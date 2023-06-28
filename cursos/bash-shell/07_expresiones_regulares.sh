# !/bin/bash
: ' Descripción: Expresiones Regulares
    Se necesita conocer ciertos criterios utilizados en las expresiones regulares que son los siguientes:
    - ^.    - Caracter que representa el inicio de la expresión regular.
    - $.    - Caracter que representa el final de la expresión regular.
    - *.    - Caracter que representa cero o más ocurrencias de la expresión
    - +.    - Caracter que representa una o más ocurrencias de la expresión.
    - {n}.  - Representa n veces de una expresión.
    - [] . - Representa un conjunto de caracteres, por ejemplo: [a-z] representa las letras del abecedario de la a a la z.
    Autor: David Santafe
    Fecha: 2023-06-27'

IDENTIFICATION_NUMBER_REGEX='^[0-9]{10}$'
COUNTRY_REGEX='^CO|PY|SV$'
BIRTH_DATE_REGEX='^(19|20)([0-9]{2})(0[1-9]|1[1-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])$'

# Solicitud de los datos
echo "Expresiones regulares"
read -p "Ingresar una identificación: " IDENTIFICATION_NUMBER
read -p "Ingresar las iniciales de un país [EC, COL, US]: " COUNTRY
read -p "Ingresar la fecha de nacimiento: [yyyyMMdd]: " BIRTH_DATE

# Validación de los datos

if [[ $IDENTIFICATION_NUMBER =~ $IDENTIFICATION_NUMBER_REGEX ]]; then
    echo "Identificación: $IDENTIFICATION_NUMBER válida"
else
    echo "Identificación: $IDENTIFICATION_NUMBER inválida"
fi

if [[ $COUNTRY =~ $COUNTRY_REGEX ]]; then
    echo "País: $COUNTRY válido"
else
    echo "País: $COUNTRY inválido"
fi

if [[ $BIRTH_DATE =~ $BIRTH_DATE_REGEX ]]; then
    echo "Fecha de nacimiento: $BIRTH_DATE válido"
else
    echo "Fecha de nacimiento: $BIRTH_DATE inválido"
fi