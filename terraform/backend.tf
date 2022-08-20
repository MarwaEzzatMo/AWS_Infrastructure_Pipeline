terraform {
  backend "s3" {
    bucket         = "backend-terroo"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state_lock"
  }
}
