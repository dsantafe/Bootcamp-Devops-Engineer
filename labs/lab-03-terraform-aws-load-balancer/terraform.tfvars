# Application Definition 
app_name        = "lab-aws-lb" # Do NOT enter any spaces
app_environment = "dev"        # Dev, Test, Staging, Prod, etc

# Network
vpc_cidr              = "10.11.0.0/16"
private_subnet_cidr_1 = "10.11.1.0/24"
private_subnet_cidr_2 = "10.11.2.0/24"
public_subnet_cidr    = "10.11.4.0/24"

# AWS Settings
aws_access_key = "complete-this"
aws_secret_key = "complete-this"
aws_region     = "us-east-1"

# Linux Virtual Machine
ec2_count              = 2
linux_instance_type    = "t2.micro"
linux_root_volume_size = 20
linux_root_volume_type = "gp2"
linux_data_volume_size = 10
linux_data_volume_type = "gp2"
