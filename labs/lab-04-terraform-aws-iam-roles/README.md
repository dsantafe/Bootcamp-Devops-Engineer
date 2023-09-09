# Configuración de Ejemplo: AWS, Terraform y Gestión de acceso e identidad
Este repositorio contiene una configuración de ejemplo para el siguiente caso de estudio en AWS utilizando Terraform. En esta configuración, Una empresa de desarrollo recientemente activo una cuenta de AWS y desea dar acceso a su equipo para poder realizar acciones en la cuenta, sin embargo, no desea que todos los usuarios tengan acceso a todos los recursos.

Para esta primera etapa se va a replicar la siguientes roles correspondiente al area de ingenieria.

- Software Engineer: los miembros de este grupo podran visualizar información de las instancias EC2, pero no podrán realizar ninguna acción sobre ellas.
- DevOps Engineer: El equipo de DevOps podra realizar acciones sobre las instancias EC2, pero no podrán crear nuevas instancias y no podrán apagarlas.
- Cloud Engineer: El equipo de Cloud podra realizar todas las acciones pero no podrá terminar instancias.
- Manager Engineer: El Manager podrá realizar todas las acciones incluso terminar instancias.
- Automation Script: este role solo puede detener e iniciar instancias EC2.

Práctica:
Elaborar el código Terraform para poder crear los recursos necesarios para el rol Cloud Engineer.

## Requisitos Previos
Antes de comenzar, asegúrate de tener lo siguiente:

1. Una cuenta de AWS y [las credenciales de AWS configuradas](https://docs.aws.amazon.com/es_es/cli/latest/userguide/cli-configure-quickstart.html).
2. [Terraform](https://www.terraform.io/downloads.html) instalado en tu máquina local.
3. Dado que el archivo principal de terraform se va a cargar en el repositorio de código con todo el proyecto, claramente no podemos almacenar ningún dato sensible. Así que pongamos la clave secreta y la clave de acceso en un archivo diferente, y coloquemos este archivo en nuestro gitignore.

Para separar los datos sensibles, crea un archivo en el mismo directorio llamado terraform.tfvars. Y decláralos así:

```terraform
# Application Definition 
app_name        = "lab-aws-iam" # Do NOT enter any spaces
app_environment = "dev"         # Dev, Test, Staging, Prod, etc

# AWS Settings
aws_access_key = "complete-this"
aws_secret_key = "complete-this"
aws_region     = "us-east-1"
```

## Pasos de ejecución
1. Clona este repositorio en tu máquina local:
```bash
git clone https://github.com/dsantafe/Bootcamp-Devops-Engineer.git
cd Bootcamp-Devops-Engineer/labs/lab-04-terraform-aws-iam-roles
```

2. Ejecuta el siguiente comando para inicializar el directorio de trabajo de Terraform:
```bash
terraform init
```

3. Antes de crear los recursos, verifica qué recursos se crearán con el siguiente comando:
```bash
terraform plan
```

4. Si la salida del comando terraform plan es correcta, procede a crear la máquina virtual con el siguiente comando:
```bash
terraform apply
```

Será necesario confirmar la creación de los recursos escribiendo "yes" cuando se te solicite.

## Notas
- Esta configuración es un ejemplo básico y puede requerir ajustes adicionales para su uso en un entorno de producción.
- Mantén seguras las claves privadas y sigue las mejores prácticas para la gestión de claves SSH.
- No olvides destruir los recursos creados cuando ya no los necesites, utilizando `terraform destroy`.
