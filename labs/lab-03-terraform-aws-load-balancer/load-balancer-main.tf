#############################################
## Application Load Balancer Module - Main ##
#############################################

# Create a Security Group for The Load Balancer
resource "aws_security_group" "linux-alb-sg" {
  name        = "${lower(var.app_name)}-${var.app_environment}-linux-alb-sg"
  description = "Allow web traffic to the load balancer"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-linux-alb-sg"
    Environment = var.app_environment
  }
}

# Create an Application Load Balancer
resource "aws_lb" "linux-alb" {
  name               = "${lower(var.app_name)}-${var.app_environment}-linux-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.linux-alb-sg.id]
  # subnets            = local.ec2_subnet_list
  subnets = [
    aws_subnet.public-subnet-1.id,
    aws_subnet.public-subnet-2.id
  ]

  enable_deletion_protection = false
  enable_http2               = false

  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-linux-alb"
    Environment = var.app_environment
  }
}

# Create a Load Balancer Target Group for HTTP
resource "aws_lb_target_group" "linux-alb-target-group-http" {
  name     = "${lower(var.app_name)}-${var.app_environment}-linux-alb-tg-http"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  load_balancing_algorithm_type = "round_robin"

  stickiness {
    enabled = false
    type    = "lb_cookie"
  }

  health_check {
    path                = "/"
    port                = 80
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 10
    interval            = 30
    matcher             = "200,301,302"
  }
}

# Attach EC2 Instances to Application Load Balancer Target Group
resource "aws_alb_target_group_attachment" "linux-alb-target-group-http-attach" {
  count = var.ec2_count

  target_group_arn = aws_lb_target_group.linux-alb-target-group-http.arn
  target_id        = aws_instance.linux-server[count.index].id
  port             = 80
}

# Create the Application Load Balancer Listener
resource "aws_lb_listener" "linux-alb-listener-http" {
  depends_on = [
    aws_lb.linux-alb,
    aws_lb_target_group.linux-alb-target-group-http
  ]

  load_balancer_arn = aws_lb.linux-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.linux-alb-target-group-http.arn
    type             = "forward"
  }
}
