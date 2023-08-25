# !/bin/bash
# Descripción: Break y continue
# Autor: David Santafe
# Fecha: 2023-07-17

echo "Sentencias de Break y continue"
for FILE in $(ls)
do
    for NAME in {1..4}
    do
        if [ $FILE = "10_descarga_internet.sh" ]; then
            break;
        elif [[ $FILE == 04*  ]]; then
            # El utilizar 04* indica que la comparacion verificara cualquier archivo que su nombre comience con el numero 04.
            continue;
        else
            echo "Nombre Archivo: $FILE _ $NAME"
        fi
    done
done
