#####################################
## Virtual Machine Module - Output ##
#####################################

output "vm_linux_server_instance_ip" {
  value = join("", ["http://", google_compute_instance.linux-server.network_interface.0.access_config.0.nat_ip, ":5000"])
}
