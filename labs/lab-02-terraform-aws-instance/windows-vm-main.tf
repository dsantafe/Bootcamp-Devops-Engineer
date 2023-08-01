###################################
## Virtual Machine Module - Main ##
###################################

# Bootstrapping PowerShell Script
data "template_file" "windows-userdata" {
  template = <<EOF
<powershell>
# Rename Machine
Rename-Computer -NewName "${var.windows_instance_name}" -Force;

# Install IIS
Install-WindowsFeature -name Web-Server -IncludeManagementTools;

# Restart machine
shutdown -r -t 10;
</powershell>
EOF
}

resource "aws_instance" "windows-server" {
	ami 						= "ami-0fc682b2a42e57ca2"
	instance_type 				= var.windows_instance_type
	vpc_security_group_ids      = [aws_security_group.aws-windows-sg.id]
	key_name                    = aws_key_pair.key_pair.key_name
	user_data                   = data.template_file.windows-userdata.rendered

	# root disk
	root_block_device {
		volume_size           = var.windows_root_volume_size
		volume_type           = var.windows_root_volume_type
		delete_on_termination = true
		encrypted             = true
	}	

	tags = {
		Name = "${lower(var.app_name)}-${var.app_environment}-windows-server"
		Environment = var.app_environment
	}
}

# Define the security group for the Windows server
resource "aws_security_group" "aws-windows-sg" {
	name = "${lower(var.app_name)}-${var.app_environment}-windows-sg"
	description = "Allow incoming connections"

	ingress {
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		description = "Allow incoming HTTP connections"
	}

	ingress {
		from_port   = 3389
		to_port     = 3389
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		description = "Allow incoming RDP connections"
	}

	ingress {
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		description = "Allow incoming SSH connections"
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		Name = "${lower(var.app_name)}-${var.app_environment}-windows-sg"
		Environment = var.app_environment
	}
}