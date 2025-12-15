resource "aws_instance" "httpd" {
  ami           = "ami-068c0051b15cdb816"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public1.id         # 🔗 public subnet
  key_name      = "my-keypair"

  vpc_security_group_ids = [
    aws_security_group.web_sg.id               # 🔗 web SG attached
  ]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              echo "Hello World this message is from httpd" > /var/www/html/index.html
              systemctl start httpd
              systemctl enable httpd
              EOF

  tags = { Name = "httpd-server" }
}

