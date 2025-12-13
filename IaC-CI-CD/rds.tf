resource "aws_db_instance" "my_db" {
  allocated_storage   = 20
  engine              = "mysql"
  engine_version      = "8.0.43"
  instance_class      = "db.t4g.micro"
  db_name             = "mydatabase"
  username            = "admin"
  password            = "mysecretpassword"
  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.db_sg.id]
}


