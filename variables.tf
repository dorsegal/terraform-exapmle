variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr1" {
    description = "CIDR for the Public Subnet"
    default = "10.0.1.0/24"
}


variable "public_subnet_cidr2" {
    description = "CIDR for the Public Subnet"
    default = "10.0.2.0/24"
}

variable "private_subnet_cidr1" {
    description = "CIDR for the Private Subnet"
    default = "10.0.3.0/24"
}

variable "private_subnet_cidr2" {
    description = "CIDR for the Private Subnet"
    default = "10.0.4.0/24"
}
