terraform {
  backend "s3" {
    bucket         = "wp-terraform-state-bucket"
    key            = "./terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
