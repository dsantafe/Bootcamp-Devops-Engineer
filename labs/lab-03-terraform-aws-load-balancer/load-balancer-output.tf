###############################################
## Application Load Balancer Module - Output ##
###############################################

output "lb_dns_name" {
  description = "DNS Name of Linux application load balancer"
  value       = aws_lb.linux-alb.dns_name
}
