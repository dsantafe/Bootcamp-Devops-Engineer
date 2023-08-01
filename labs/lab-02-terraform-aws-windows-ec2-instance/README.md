# Creación de una máquina virtual con Windows usando Terraform

Este repositorio contiene el código de Terraform necesario para crear una máquina virtual con sistema operativo Windows en el proveedor de nube AWS. La máquina tendrá un disco virtual de 30 GB y podrá ser accedida de forma remota mediante el protocolo RDP.

## Requisitos previos

Antes de comenzar, asegúrate de tener lo siguiente:

1. Una cuenta en AWS con las credenciales adecuadas para crear recursos.
2. Terraform instalado en tu máquina local.
3. Una llave SSH en AWS para acceder a la máquina (necesario para crear la VM, pero no para acceder por RDP).
4. Dado que el archivo principal de terraform se va a cargar en el repositorio de código con todo el proyecto, claramente no podemos almacenar ningún dato sensible. Así que pongamos la clave secreta y la clave de acceso en un archivo diferente, y coloquemos este archivo en nuestro gitignore.

Para separar los datos sensibles, crea un archivo en el mismo directorio llamado terraform.tfvars. Y decláralos así:

```terraform
# Application Definition 
app_name        = "bootcampdevops" # Do NOT enter any spaces
app_environment = "dev"       # Dev, Test, Staging, Prod, etc

# AWS Settings
aws_access_key = "aws_access_key"
aws_secret_key = "aws_secret_key"
aws_region     = "aws_region"

# Windows Virtual Machine
windows_instance_name               = "winsrv01"
windows_instance_type               = "t2.micro"
windows_root_volume_size            = 30
windows_root_volume_type            = "gp2"
```

## Pasos de ejecución

1. Clona este repositorio:

```bash
git clone https://github.com/dsantafe/Bootcamp-Devops-Engineer
cd Bootcamp-Devops-Engineer/labs/lab-02-terraform-aws-windows-ec2-instance
```

2. Abre el archivo windows-vm-variables.tf y realiza las siguientes modificaciones:

Cambia el valor de region para seleccionar la región de AWS donde deseas crear la máquina virtual.
Si es necesario, cambia el valor de ami para seleccionar la AMI de Windows que prefieras.
Verifica la configuración de key_name para asegurarte de que corresponde al nombre de tu llave SSH en AWS.

3. Ejecuta el siguiente comando para inicializar el directorio de trabajo de Terraform:
```bash
terraform init
```

4. Antes de crear los recursos, verifica qué recursos se crearán con el siguiente comando:
```bash
terraform plan
```

5. Si la salida del comando terraform plan es correcta, procede a crear la máquina virtual con el siguiente comando:
```bash
terraform apply
```

Será necesario confirmar la creación de los recursos escribiendo "yes" cuando se te solicite.

- Una vez que la máquina virtual esté creada, puedes obtener la dirección IP pública asignada a ella desde la salida del comando `terraform apply`.
- Configura el acceso remoto a la máquina virtual mediante RDP utilizando la dirección IP pública obtenida en el paso anterior.

## Acceso remoto a la máquina virtual
Para acceder a la máquina virtual de forma remota, sigue estos pasos:
1. Abre el cliente de RDP en tu máquina local.
2. Ingresa la dirección IP pública de la máquina virtual como destino.
3. Usa las credenciales de acceso configuradas en la instancia de Windows para iniciar sesión.

¡Listo! Ahora puedes acceder a tu máquina virtual de Windows desde tu máquina local de forma remota.

## Limpieza de recursos
Una vez que hayas terminado de utilizar la máquina virtual, asegúrate de eliminar los recursos creados para evitar costos innecesarios. Para hacerlo, ejecuta el siguiente comando:
```bash
terraform destroy
```

Recuerda confirmar la eliminación de los recursos escribiendo "yes" cuando se te solicite.

## Notas adicionales
- Este ejemplo se enfoca en AWS, pero puedes adaptar el código para otros proveedores de nube como Azure o Google Cloud Platform.
- Asegúrate de entender los costos asociados con los recursos creados y elimina los recursos cuando no los necesites para evitar gastos innecesarios.

Espero que esta documentación te sea útil. ¡Buena suerte con tu máquina virtual de Windows en la nube!

## Referencias
- [Primeros pasos con AWS – crear una instancia de EC2](https://www.adictosaltrabajo.com/2020/06/12/primeros-pasos-con-aws-crear-una-instancia-de-ec2/)
- [Primeros pasos con Terraform – crear instancia EC2 en AWS](https://www.adictosaltrabajo.com/2020/06/19/primeros-pasos-con-terraform-crear-instancia-ec2-en-aws/)
- [How to Deploy a Windows Server EC2 Instance in AWS using Terraform](https://gmusumeci.medium.com/how-to-deploy-a-windows-server-ec2-instance-in-aws-using-terraform-dd86a5dbf731)
