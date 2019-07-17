provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "minecraft-terraform"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
