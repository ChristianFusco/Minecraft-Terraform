variable "instance_type" {
  description = "size of the instance"
  default     = "t2.micro"
}

variable "ami" {
  description = "basic linux 2 ami"
  default     = "ami-0b898040803850657"
}

variable "region" {
  default = "us-east-1"
}
