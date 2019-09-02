
terraform {
  backend "s3" {
    bucket = "terraform-uw-demo"
    key    = "demo/terraform_demo.tfstate"
    region = "us-east-1"
  }
}