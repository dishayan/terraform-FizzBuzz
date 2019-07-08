variable "aws_region" {
  description = "Region for the GCC VPC"
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for the GCC VPC"
  default = "20.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "20.0.1.0/24"
}
variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default = "20.0.2.0/24"
}

variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-0e28e9a62a36c9177"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "/Users/dishayan/.ssh/fizzbuzz_id_rsa.pub"
}
