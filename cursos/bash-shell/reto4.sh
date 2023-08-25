# !/bin/bash
: ' Descripción: Reto 4.
    Crear un menú con las siguientes opciones:
    1. Procesos Actuales,
    2. Memoria Disponible,
    3. Espacio en Disco,
    4. Información de Red,
    5. Variables de Entorno Configuradas,
    6. Información Programa
    7. Backup información
    8. Ingrese una opción.
    Posterior a esto vamos  a recuperar la opción ingresada, validarla e imprimir la opción y el título de acuerdo a lo ingresado
    Autor: David Santafe
    Fecha: 2023-07-17'

OPTION=0

while :
do
        #Limpiar Pantalla
        clear
        #Desplegar el menu de opciones
        echo "_________________________________________"
        echo " RECURSOS - Programa de Recursos del PC  "
        echo "-----------------------------------------"
        echo "            MENÚ PRINCIPAL               "
        echo "-----------------------------------------"
        echo "1) Procesos Actuales "
        echo "2) Memoria Disponible "
        echo "3) Espacio en disco "
        echo "4) Informacion Red "
        echo "5) Variables de entorno configuradas "
        echo "6) Información Programa "
        echo "7) Comprimir Arcivos *.sh "
        echo "8) Salir "
        
        #Leer datos de usuario
        read -n1 -p "Ingrese la opción a seleccionar (1 - 8): " OPTION
        
        #Validar opción ingresada
        case $OPTION in
                1)
                        echo -e "\n..Procesos Actuales.."
                        ps axu
                        sleep 3
                        ;;
                2)
                        echo -e "\n..Memoria Disponible.."
                        free
                        sleep 3
                        ;;
                3)
                        echo -e "\n..Espacion en disco.."
                        df -h
                        sleep 3
                        ;;
                4)
                        echo -e "\n..Información Red.."
                        ifconfig -a
                        sleep 3
                        ;;
                5)
                        echo -e "\n..Variables de Entorno Configuradas.."
                        #printenv
                        env -u VAR
                        sleep 3
                        ;;
                6)
                        echo -e "\n..Información Programa.."
                        dpkg -l | more
                        sleep 3
                        ;;
                7)
                        echo -e "\n..Comprimiendo Archivos.."
                        tar -czvf archivos_compresos.tar.gz $(ls | grep "$*.sh")
                        echo -e "\n SUCESS!!"
                        sleep 3
                        ;;
                8)
                        echo -e "\n..Saliendo, ¡¡Gracias!!"
                        exit 0
                        ;;
        esac
done
