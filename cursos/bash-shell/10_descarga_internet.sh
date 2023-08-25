# !/bin/bash
: ' Descripción: Descargar información de Internet
    Url: https://downloads.apache.org/tomcat/tomcat-10/v10.1.11/bin/
    The DNS server seems out of order. You can use another DNS server such as 8.8.8.8. 
    Put nameserver 8.8.8.8 to the first line of /etc/resolv.conf.
    Autor: David Santafe
    Fecha: 2023-07-10'

echo "Descargar información de internet"
wget https://downloads.apache.org/tomcat/tomcat-10/v10.1.11/bin/apache-tomcat-10.1.11.zip
