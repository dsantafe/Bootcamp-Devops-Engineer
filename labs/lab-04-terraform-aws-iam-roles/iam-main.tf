resource "aws_iam_group" "developers_group" {
  name = "developers"
  path = "/"
}

resource "aws_iam_user" "cloud_engineer_user" {
  name = "cloud_engineer"
  path = "/"

  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-user-cloud-engineer"
    Environment = var.app_environment
  }
}

resource "aws_iam_policy" "cloud_engineer_policy" {
  name = "CloudEngineerPolicy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "ec2:StartInstances",
          "ec2:StopInstances",
        ],
        Effect   = "Allow",
        Resource = "*",
      },
      {
        Action = [
          "ec2:TerminateInstances", # No permitir terminar instancias
        ],
        Effect   = "Deny",
        Resource = "*",
      },
    ],
  })
}

resource "aws_iam_role" "cloud_engineer_role" {
  name = "CloudEngineerRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com",
        },
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "cloud_engineer_role_attachment" {
  policy_arn = aws_iam_policy.cloud_engineer_policy.arn
  role       = aws_iam_role.cloud_engineer_role.name
}

resource "aws_iam_group_membership" "cloud_engineer_group_membership" {
  name  = aws_iam_user.cloud_engineer_user.name
  users = [aws_iam_user.cloud_engineer_user.name]
  group = aws_iam_group.developers_group.name
}

resource "aws_iam_user_policy_attachment" "cloud_engineer_attachment" {
  user       = aws_iam_user.cloud_engineer_user.name
  policy_arn = aws_iam_policy.cloud_engineer_policy.arn
}
