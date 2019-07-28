data "aws_caller_identity" "current" {}

provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "${data.aws_caller_identity.current.account_id}-minecraft-terraform"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
