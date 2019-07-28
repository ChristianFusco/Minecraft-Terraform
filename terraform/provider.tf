# data "aws_caller_identity" "current" {}

provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    # Variables can't exist in a terraform backend see:
    # 	https://github.com/hashicorp/terraform/issues/13022
    # Workaround consideration here:
    #	https://github.com/hashicorp/terraform/issues/13022#issuecomment-294262392
    # 	Could probably bake the terraform command into a script, gitignore it, and regex replace the accountid
    # bucket = "${data.aws_caller_identity.current.account_id}-minecraft-terraform"
    bucket = "minecraft-terraform"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
