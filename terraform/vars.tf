variable "instance_type" {
  description = "size of the instance"
  default     = "t2.nano"
}

variable "ami" {
  description = "basic linux 2 ami"
  default     = "ami-0d8f6eb4f641ef691"
}

variable "region" {
  default = "us-east-1"
}
