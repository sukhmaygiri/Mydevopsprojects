terraform {
  backend "s3" {
    bucket         = "my-terraform-state-64378638746378463478"
    key            = "ec2-rds/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

