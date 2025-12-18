output "web_public_ip" {
  value = aws_instance.httpd.public_ip
}

output "db_endpoint" {
  value = aws_db_instance.db.endpoint
}

