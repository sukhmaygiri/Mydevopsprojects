output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.my_db.endpoint
}

output "ecr_repo_url" {
  value = aws_ecr_repository.flask_repo.repository_url
}

