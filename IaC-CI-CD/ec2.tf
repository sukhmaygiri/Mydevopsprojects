resource "aws_instance" "web" {
  ami                    = "ami-068c0051b15cdb816" # Amazon Linux 2
  instance_type          = "t2.micro"
  key_name               = "basyuhi46"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  user_data = <<-EOF
              #!/bin/bash
              set -e

              # Update system
              yum update -y

              # Install Docker
              yum install -y docker
              systemctl enable docker
              systemctl start docker
              usermod -aG docker ec2-user

              # Install AWS CLI v2
              curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
              unzip -q awscliv2.zip
              ./aws/install
              EOF

  depends_on = [
    aws_iam_instance_profile.ec2_profile,
    aws_ecr_repository.flask_repo
  ]

  tags = {
    Name = "WebServer"
  }
}

