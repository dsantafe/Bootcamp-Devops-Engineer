# Configuración de Ejemplo: AWS, Terraform y Balanceador de Carga

Este repositorio contiene una configuración de ejemplo para crear una infraestructura básica en AWS utilizando Terraform. En esta configuración, se crea un balanceador de carga de aplicaciones (ALB) que distribuye el tráfico entre dos instancias Linux que ejecutan servidores web Apache. Cada instancia muestra su nombre de host cuando se accede a través del balanceador de carga.

## Requisitos Previos

Antes de comenzar, asegúrate de tener lo siguiente:

- [Terraform](https://www.terraform.io/downloads.html) instalado en tu máquina local.
- Una cuenta de AWS y [las credenciales de AWS configuradas](https://docs.aws.amazon.com/es_es/cli/latest/userguide/cli-configure-quickstart.html).

## Instrucciones

1. Clona este repositorio en tu máquina local:
```bash
git clone https://github.com/tu-usuario/aws-terraform-load-balancer.git
cd aws-terraform-load-balancer
```

2. Ejecuta el siguiente comando para aplicar la configuración de Terraform:
```bash
terraform apply
```
3. Una vez que la infraestructura esté creada, la salida de Terraform mostrará la dirección DNS del balanceador de carga. Abre un navegador web y accede a la dirección DNS del balanceador de carga. Verás una página que muestra alternativamente el nombre de host de cada instancia.

4. Para conectarte a las instancias via SSH, asegúrate de tener la clave privada generada (private_key_pem) en tu máquina local. Actualiza tu archivo ~/.ssh/config con las entradas de host para cada instancia, usando el nombre de host como se muestra en la página del balanceador de carga.

5. Con las configuraciones adecuadas en tu archivo SSH config, puedes conectarte a las instancias utilizando comandos como:
```bash
ssh my-instance-0
```

## Notas
- Esta configuración es un ejemplo básico y puede requerir ajustes adicionales para su uso en un entorno de producción.
- Mantén seguras las claves privadas y sigue las mejores prácticas para la gestión de claves SSH.
- No olvides destruir los recursos creados cuando ya no los necesites, utilizando `terraform destroy`.
