terraform {
  backend "s3" {
    bucket         = "your-new-bucket-eryqwerqyw"
    key            = "project/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

