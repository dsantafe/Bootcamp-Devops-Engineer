########################################
## Virtual Machine Module - Variables ##
########################################

variable "linux_machine_type" {
  type        = string
  description = "Compute Engine machine type for Linux Server"
  default     = "f1-micro"
}
