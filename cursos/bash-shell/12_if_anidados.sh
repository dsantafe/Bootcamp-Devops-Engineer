# !/bin/bash
# Descripción: If Anidados
# Autor: David Santafe
# Fecha: 2023-07-10

NOTE=0
IS_CONTINUE=""

echo "Ejemplo Sentencia If-Else"
read -n1 -p "Indique cual es su nota (1-9): " NOTE
echo -e "\n"

if [ $NOTE -ge 7 ]; then
    echo "El alumno aprobó la materia"
    read -n1 -p "Va a continuar estudiando en el siguiente nivel? (s/n): " IS_CONTINUE
    if [ $IS_CONTINUE = "s" ]; then
        echo -e "\n"
        echo "Bienvenido al siguiente nivel"
    else
        echo -e "\n"
        echo "Gracias por trabajar con nosotros, mucha suerte"
    fi
else 
    echo "El alumno reprobó la materia"
fi
