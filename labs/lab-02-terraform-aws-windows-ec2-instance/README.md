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

## Output del terraform plan.
```bash
Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.  
PS D:\workspace-git\Bootcamp-Devops-Engineer\labs\lab-02-terraform-aws-windows-ec2-instance> terraform apply
data.template_file.windows-userdata: Reading...
data.template_file.windows-userdata: Read complete after 0s [id=50eca9f9175b3acfb54f3db14c93d621f3b2ee9ae96545ece3cbfc991f8680eb]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.windows-server will be created
  + resource "aws_instance" "windows-server" {
      + ami                                  = "ami-0fc682b2a42e57ca2"
      + arn                                  = (known after apply)    
      + associate_public_ip_address          = (known after apply)    
      + availability_zone                    = (known after apply)    
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "bootcampdevops-dev-windows-us-east-1"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = false
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Environment" = "dev"
          + "Name"        = "bootcampdevops-dev-windows-server"
        }
      + tags_all                             = {
          + "Environment" = "dev"
          + "Name"        = "bootcampdevops-dev-windows-server"
        }
      + tenancy                              = (known after apply)
      + user_data                            = "e9cefb0132d94c0e1c7c03abb530aeba5d48bfff"
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + root_block_device {
          + delete_on_termination = true
          + device_name           = (known after apply)
          + encrypted             = true
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 30
          + volume_type           = "gp2"
        }
    }

  # aws_key_pair.key_pair will be created
  + resource "aws_key_pair" "key_pair" {
      + arn             = (known after apply)
      + fingerprint     = (known after apply)
      + id              = (known after apply)
      + key_name        = "bootcampdevops-dev-windows-us-east-1"
      + key_name_prefix = (known after apply)
      + key_pair_id     = (known after apply)
      + key_type        = (known after apply)
      + public_key      = (known after apply)
      + tags_all        = (known after apply)
    }

  # aws_security_group.aws-windows-sg will be created
  + resource "aws_security_group" "aws-windows-sg" {
      + arn                    = (known after apply)
      + description            = "Allow incoming connections"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow incoming HTTP connections"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow incoming RDP connections"
              + from_port        = 3389
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 3389
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow incoming SSH connections"
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
        ]
      + name                   = "bootcampdevops-dev-windows-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Environment" = "dev"
          + "Name"        = "bootcampdevops-dev-windows-sg"
        }
      + tags_all               = {
          + "Environment" = "dev"
          + "Name"        = "bootcampdevops-dev-windows-sg"
        }
      + vpc_id                 = (known after apply)
    }

  # local_file.ssh_key will be created
  + resource "local_file" "ssh_key" {
      + content              = (sensitive value)
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "bootcampdevops-dev-windows-us-east-1.pem"
      + id                   = (known after apply)
    }

  # tls_private_key.key_pair will be created
  + resource "tls_private_key" "key_pair" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + private_key_pem_pkcs8         = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

Plan: 5 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + vm_windows_server_instance_id         = (known after apply)
  + vm_windows_server_instance_name       = "winsrv01"
  + vm_windows_server_instance_public_dns = (known after apply)
  + vm_windows_server_instance_public_ip  = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

tls_private_key.key_pair: Creating...
aws_security_group.aws-windows-sg: Creating...
tls_private_key.key_pair: Creation complete after 4s [id=5667e832905b9452d2ab0587ddb686307e28111f]
aws_security_group.aws-windows-sg: Creation complete after 4s [id=sg-066ba8fa2e45e5374]
aws_key_pair.key_pair: Creating...
aws_key_pair.key_pair: Creation complete after 0s [id=bootcampdevops-dev-windows-us-east-1]
local_file.ssh_key: Creating...
local_file.ssh_key: Creation complete after 0s [id=e7eddd02fec3a943358b616fbcdb9a28fdc3673b]
aws_instance.windows-server: Creating...
aws_instance.windows-server: Still creating... [10s elapsed]
aws_instance.windows-server: Still creating... [20s elapsed]
aws_instance.windows-server: Still creating... [30s elapsed]
aws_instance.windows-server: Still creating... [40s elapsed]
aws_instance.windows-server: Creation complete after 44s [id=i-09b68618262df04e8]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:

vm_windows_server_instance_id = "i-09b68618262df04e8"
vm_windows_server_instance_name = "winsrv01"
vm_windows_server_instance_public_dns = "ec2-44-201-177-44.compute-1.amazonaws.com"
vm_windows_server_instance_public_ip = "44.201.177.44"
```

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
