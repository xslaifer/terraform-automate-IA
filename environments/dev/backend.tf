# backend.tf

terraform {
  backend "s3" {
    bucket         = "s3-lab-terraform-jmo"
    key            = "env/dev/main.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
