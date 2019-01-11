variable "aws_region" {
  description = "Region for the FizzBuzz VPC"
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for the FizzBuzz VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}

variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-03c30fb962b9dfa8e"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "/Users/dishayan/.ssh/fizzbuzz_id_rsa.pub"
}
